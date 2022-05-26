import React from "react";
import styles from "./index.less";
import { Table, Tooltip,PageHeader,Space,notification } from "antd";
import axios from "axios";
import rwquest from "rwquest";
import { history } from 'umi';
//import { VerticalAlignBottomOutlined,RedoOutlined } from "@ant-design/icons";
import { createFromIconfontCN } from '@ant-design/icons';
import { Breadcrumb } from 'antd';
import { HomeOutlined } from '@ant-design/icons';
import fileDownload from 'js-file-download';
import qs from 'qs';
import moment from "moment";

const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_2678397_35g8z815xs7.js',
});

const excludeFileLists = ["turb_0.dat","turb.dat","flow_0.dat","tecflow.plt.bak","log0.log","preversion","sentinel"]
class App extends React.Component {
  state = {
    data: [],
    loading: false,
    test_id: 0,
    solver_version:0,
    commit:""
  };
  
  columns = [
    {
      title: "算例ID",
      dataIndex: "case_id",
      width: 90,
      align:"center",
      sorter: (a: { case_id: number; }, b: { case_id: number; }) => a.case_id - b.case_id,
      fixed: 'left',
    },
    {
      title: "算例名称",
      dataIndex: "case_name",
      ellipsis: {
        showTitle: false,
      },
      sorter: (a: { case_name: number; }, b: { case_name: number; }) => a.case_name < b.case_name?-1:1,
      defaultSortOrder:"ascend",
      render: (address:any) => (
        <Tooltip placement="topLeft" title={address}>
          {address}
        </Tooltip>
      ),
    },
    {
      title: "测试时间",
      dataIndex: "end_time",
      width: 200,
      render: (value: any) => { return this.formatterTime(value) }
    },
    {
      title: "运行时间(h:m)",
      dataIndex: "run_time",
      width: 140,
      render:(value:any) => {return this.formatSeconds(value)},

    },
    {
      title: "计算状态",
      dataIndex: "is_worked",
      align:"center",
      width: 120,
      render:(value:any) => {return this.formatterWorkState(value)},
      filters: [
        {
          text: '未开始',
          value: '2',
        },
        {
          text: '正在计算',
          value: '6',
        },
        {
          text: '已完成',
          value: '9',
        },
      ],
      onFilter: (value, record) =>  (record.is_worked).toString().indexOf(value) === 0,
    },
    {
      title: "计算结果",
      align:"center",
      colSpan:2,
      children: [
        {
          dataIndex: "result_evaluation_ori",
          width: 140,
          filters:[
            {text:'异常',value:'异常'},
          ],
          onFilter: (value:any,record:any) => 
          {
            return record.result_evaluation_ori == null?true:(record.result_evaluation_ori).toString().indexOf('OK') != 0
          },
          render: (value: any) => {
            return value?.indexOf("Error") != -1 ? <span style={{ color: "red" }}>{value}</span> :value=="Terrible"?<span style={{ color: "#1890ff" }}>{value}</span>: <span>{value}</span>
          }
        },
        {
          dataIndex: "result_evaluation_pre",
          width: 140,
          filters:[
            {text:'异常',value:'异常'},
          ],
          onFilter: (value:any,record:any) => 
          {
            return record.result_evaluation_ori == null?true:(record.result_evaluation_ori).toString().indexOf('OK') != 0
          },
          render: (value: any) => {
            return value?.indexOf("Error") != -1 ? <span style={{ color: "red" }}>{value}</span> :value=="Terrible"?<span style={{ color: "#1890ff" }}>{value}</span>: <span>{value}</span>
          }
        },
      ]
      
    },
    {
      title: "操作",
      align:"center",
      width: 160,
      render:(record:any) =>{
        let button = null;
        
        if(record.state == 0){
          button = <Tooltip placement="top" title="申请下载">
            <a onClick={()=>this.handleApplyDownload(record)}><IconFont style={{fontSize:18}} type="icon-cloud-download" /></a>
          </Tooltip>
        }else if(record.state == 1){
          button = <Tooltip placement="top" title="正在处理">
            <a onClick={()=>this.handleCheckDownload(record)}><IconFont style={{fontSize:18}} type="icon-cloud-sync" /></a>
          </Tooltip>
        }
        else if(record.state == 2){
          button = <Tooltip placement="top" title="下载结果">
            <a onClick={()=>this.handleDownloadResults(record)}><IconFont style={{fontSize:16}} type="icon-direction-down-circle" /></a>
          </Tooltip>
        }
        return <Space size='middle'>
          <Tooltip placement="top" title="重算">
          <a onClick={()=>this.handleReStart(record)}><IconFont style={{fontSize:16}} type="icon-switch" /></a>
          </Tooltip>
          {button}
        </Space>
      }
    }
  ];
  formatterTime= (val:any)=> { 
    return val ? moment(val).format("YYYY-MM-DD HH:mm:ss") : ""
  }
  /**
 * 格式化秒
 * @param int  value 总秒数
 * @return string result 格式化后的字符串
 */
  formatSeconds = (value:any)=> { 
    let theTime:number = parseInt(value);// 需要转换的时间秒 
    let theTime1:number = 0;// 分 
    let theTime2 = 0;// 小时 
    if(theTime > 60) { 
      theTime1 = parseInt(theTime/60); 
      theTime = parseInt(theTime%60); 
      if(theTime1 > 60) { 
        theTime2 = parseInt(theTime1/60); 
        theTime1 = parseInt(theTime1%60);
      } 
    } 
    var result = '';
    if(theTime1 > 0) { 
      let timeValue = ""
      if(theTime1<10)
        timeValue = "0"+theTime1.toString()
      else
        timeValue = theTime1.toString()
      result = ""+timeValue; 
    }else{
      result = "00"
    }
    if(theTime2 > 0) { 
      let timeValue = ""
      if(theTime2<10)
        timeValue = "0"+theTime2.toString()
      else
        timeValue = theTime2.toString()
      result = ""+timeValue+":"+result; 
    }else{
      result = "00:"+result; 
    }
    return result; 
  }

  handleApplyDownload(record:any){
    this.fetchApplyDownload(record.test_case_id)
  }
  handleDownloadResults(record:any){
    this.fetchResults(record.case_name,this.state.solver_version)
  }

  handleCheckDownload(record:any){
    this.fetchCheckDownload(record)
  }

  checkIsErrorCase(record:any){
    let error_ori = false,error_pre = false;
    if(record.result_evaluation_ori && (record.result_evaluation_ori.includes("Error") || record.result_evaluation_ori.includes("Terrible")))
      error_ori = true;
    if(record.result_evaluation_pre && (record.result_evaluation_pre.includes("Error") || record.result_evaluation_pre.includes("Terrible")))
      error_pre = true;
    return error_ori||error_pre
  }
  handleReStart(record:any){
    let paramData;
    if(this.checkIsErrorCase(record)){
      const test_case_id = record.test_case_id
      const is_error_case = true
      const test_id = record.test_id
      paramData = {test_case_id:test_case_id,is_error_case:is_error_case,test_id:test_id,type:"system"}
    }
    else{
      const test_case_id = record.test_case_id
      const test_id = record.test_id
      paramData = {test_case_id:test_case_id,test_id:test_id,type:"system"}
    }
    
    this.fetchReStart(paramData)
  }

  formatterWorkState = (val:Number) => {
    if(val == 9)
      return "已完成"
    else if(val == 6)
      return "正在计算"
    else
      return "未开始"
  }


  componentDidMount() {
    
    this.fetch();
  }

  getParas(){
    return this.getSearchParams(history.location.search);
  }
  getSearchParams(search:String):{test_id:Number,solver_version:Number,commit:String} {
    if(search == ""){
      return {test_id:0,solver_version:0,commit:""}
    }
    const searchParams:any = {test_id:Number,solver_version:Number,commit:String}
    const searchStr = search[0] == "?"?search.substring(1):search
    const searchArr = searchStr.length ? searchStr.split('&') : []
    searchArr.forEach(item => {
      let keyAndValue =  item.split('=')
      let key = decodeURIComponent(keyAndValue[0])
      let value = decodeURIComponent(keyAndValue[1])
      if(key){
        searchParams[key] = value;
      }
    })
    return searchParams;
  }
  openNotification() {
    notification.open({
      message: `警告`,
      description:'算例结果文件夹不存在.',
      duration: 2,
    });
  }
  
  openNotification2() {
    notification.open({
      message: `错误`,
      description:'申请下载出错.',
      duration: 2,
    });
  }

  openNotification3() {
    notification.open({
      message: `提示`,
      description:'下载申请正在处理，请耐心等待.',
      duration: 2,
    });
  }

  fetchApplyDownload = (test_case_id:Number) => {
    this.setState({ loading: true });
    axios({
      url: "/api/applydownload",
      method: "get",
      params:{test_case_id:test_case_id,type:"system"}
    }).then((res) => {
      const data = res.data
      if(data.status == 500)
      {
        this.openNotification2()
        this.setState({
          loading: false
        });
      }
      else{
        this.fetch();
      }
    });
  };

  fetchCheckDownload = (record:any) => {
    this.setState({ loading: true });
    
    axios({
      url: "/api/checkShouldDownload",
      method: "get",
      params:{test_case_id:record.test_case_id,type:"system"}
    }).then((res) => {
      const data = res.data
      
      if(data?.results[0]?.state == 2)
      {
        this.handleDownloadResults(record)
        this.fetch()
      }
      else{
        this.openNotification3()
        this.setState({
          loading: false
        });
      }
    });
  };

  fetchResults = (case_name:any,solver_version:Number) => {
    this.setState({ loading: true });
    
    let filename = "PHengLEI_System__"+solver_version + "_" +case_name+".zip";
    axios({
      url: "/api/checkResultsDirExists",
      method: "get",
      params:{filename:filename}
    }).then((res) => {
      const data = res.data
      if(data.status == 404)
      {
        this.openNotification()
        this.setState({
          loading: false
        });
      }
      else{
        this.download('/api/getResults',filename)
      }
    });
  };

  download(url:any,filename:any) {
    var requestUrl = url;
    axios({
      method: 'get',
      url: requestUrl,
      responseType: 'blob',
      params:{filename:filename},
      paramsSerializer: params => qs.stringify(params, { indices: false })
      }).then((res:any) => {
        this.setState({
          loading: false
        });
        fileDownload(res.data, filename);
      });
}
 

  fetchReStart = (paramData:any) => {
    this.setState({ loading: true });
    axios({
      url: "/api/restart",
      method: "post",
      data:paramData
    }).then((res:any) => {
      const data = res.data;
      if(data.status == 200){
        this.fetch()
      }
    });
  };

  fetch = () => {
    this.setState({ loading: true });
    
    const {test_id,solver_version,commit} = this.getParas();
    axios({
      url: "/api/searchSystemCaseInfo",
      method: "get",
      params:{test_id:test_id},
    }).then((res:any) => {
      const data = res.data;
      this.setState({
        loading: false,
        data: data.results,
        test_id:test_id,
        solver_version:solver_version,
        commit:commit,
      });
    });
  };

  render() {
    return (
      <>
       <Breadcrumb>
        <Breadcrumb.Item href="">
          <HomeOutlined />
        </Breadcrumb.Item>
        <Breadcrumb.Item>{"版本："+this.state.solver_version}</Breadcrumb.Item>
      </Breadcrumb>
      <PageHeader
      className="site-page-header"
      onBack={() => history.goBack()}
      title={"版本："+this.state.solver_version}
      subTitle={this.state.commit}
      />
      <Table
        columns={this.columns}
        dataSource={this.state.data}
        loading={this.state.loading}
        onChange={this.handleTableChange}
        rowKey="case_id" 
        tableLayout="auto"
        pagination={{defaultPageSize:20,showQuickJumper:true}}
        bordered
      />
      </>
    );
  }
}

export default () => (
  <div className={styles.container}>
    <div id="components-case-info">
      <App />
    </div>
  </div>
);
