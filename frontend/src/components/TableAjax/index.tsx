import {React,Component} from "react";
import styles from "./index.less";
import { Table, Tooltip, Drawer, Space,notification } from "antd";
import axios from "axios";
import moment from "moment";
import { history } from 'umi';
import { createFromIconfontCN } from '@ant-design/icons';
import ModelCard from "../ModelCard";
import type { PaginationProps } from 'antd';
import {localStorageSet} from '../Storage';
import { Input } from 'antd';
const { TextArea } = Input;

const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_2678397_dlwzhe20mt8.js',
});
export interface TableProps {
  data: any,
  branchFilters :any,
  curPage:number,
}

export interface TableState {
  data: any,
  loading: boolean,
  currentTestId: number,
  visible:boolean,
  infoTitle:string,
  tabList:any,
  activeTabKey:string,
  contentList:any,
  branchFilters :any,
  curPage:number,
}

class TableAjax extends Component<TableProps, TableState> {
  constructor(props: TableProps) {
    super(props);
    this.state = { 
      data: this.props.data,
      loading: false,
      currentTestId: 0,
      visible:false,
      infoTitle:'',
      tabList:[],
      activeTabKey:'',
      contentList:[],
      branchFilters:this.props.branchFilters,
      curPage:this.props.curPage
    };
  }
  
  columns = [
    {
      title: "序号",
      dataIndex: "solver_version",
      width: 120,
      align: "center",
      sorter: (a: { solver_version: number; }, b: { solver_version: number; }) => a.solver_version - b.solver_version,
      defaultSortOrder: "descend",
      fixed: 'left',
    },
    {
      title: "项目",
      dataIndex: "gitProject",
      width: 120,
    },
    {
      title: "分支",
      dataIndex: "branchName",
      width: 120,
      render: (value: any) => { return this.formatterBranch(value) },
      filters: this.props.branchFilters,
      onFilter: (value, record) => (record.branchName).toString().indexOf(value) === 0,
    },
    {
      title: "更新者",
      dataIndex: "update_author",
      width: 120,
      render: (value: any,record:any) => { return record.branchName == "ActiveBranch"?<span style={{ color: "blue"}}>{value}</span>:<span>{value}</span> }
    },
    {
      title: "提交日期",
      dataIndex: "svnDate",
      width: 200,
      render: (value: any) => { return this.formatterTime(value) }
    },
    {
      title: "提交日志",
      dataIndex: "update_Log",
      width: 200,
      render: (address: any) => (
        <Tooltip placement="topLeft" title={address}>
          {address}
        </Tooltip>
      ),
    },
    {
      title: "编译结果",
      dataIndex: "state",
      align: "center",
      width: 180,
      render: (value: number,record:any) => { return this.formatterResults(value,record) },
      filters: [
        {
          text: '不通过',
          value: '3',
        },
        {
          text: '通过',
          value: '2',
        },
        {
          text: '正在编译',
          value: '1',
        },
        {
          text: '未编译',
          value: '0',
        },
      ],
      onFilter: (value, record) => (record.state).toString().indexOf(value) === 0,
    },
    {
      title: () => {
        return (
          <div>
            <p>集成算例</p>
            <p>(错误/已完成/总数)</p>
          </div>
        )
      },
      align: "center",
      width: 280,
      render: (record: any) => <Space size="middle">
        <a onClick={() => this.linkToIntegrationCaseInfo(record)}>
          <Tooltip placement="topRight" title={"错误：" + record.integration_case_errornum}>
            <span style={{ color: "red" }}>{record.integration_case_errornum}</span>
          </Tooltip>/
          <Tooltip placement="top" title={"已完成：" + record.integration_case_over}>
            <span style={{ color: "green" }}>{record.integration_case_over}</span>
          </Tooltip>/
          <Tooltip placement="topLeft" title={"总数：" + record.integration_case_num}>
            <span>{record.integration_case_num}</span>
          </Tooltip>
        </a>
      </Space>

    },
    {
      title: () => {
        return (
          <div>
            <p>系统算例</p>
            <p>(错误/已完成/总数)</p>
          </div>
        )
      },
      align: "center",
      width: 280,
      render: (record: any) => <Space size="middle">
        <a onClick={() => this.linkToSystemCaseInfo(record)}>
          <Tooltip placement="topRight" title={"错误：" + record.system_case_errornum}>
            <span style={{ color: "red" }}>{record.system_case_errornum}</span>
          </Tooltip>/
          <Tooltip placement="top" title={"已完成：" + record.system_case_over}>
            <span style={{ color: "green" }}>{record.system_case_over}</span>
          </Tooltip>/
          <Tooltip placement="topLeft" title={"总数：" + record.system_case_num}>
            <span>{record.system_case_num}</span>
          </Tooltip>
        </a>
      </Space>

    },
    {
      title: "Hash值",
      dataIndex: "next_Hashs",
      width: 120,
      render: (value: any) => {
        let tempList = value.split(":");
        return tempList.length > 1 ? tempList[1].substr(0, 10) : tempList[0].substr(0, 10)
      }
    },

  ];
  
  formatterResults = (val: Number,record:any) => {
    let spanCompent = null
    switch (val) {
      case 0:
        spanCompent = <span>未编译</span>
        break;
      case 1:
        spanCompent = <span>正在编译</span>

        break;
      case 2:
        spanCompent = <span>通过</span>

        break;
      case 3:
        spanCompent = <a onClick={() => this.fetchShowErrorInfo(record)}><span style={{ color: "red" }}>不通过<IconFont style={{fontSize:18}} type="icon-iconsearch-copy" /></span></a>

        break;
      default:
        break;
    }
    return spanCompent
  }

  formatterBranch = (val: any) => {
    if (val == "ActiveBranch")
      return <span style={{ color: "blue" }}>{val}</span>
    else
      return <span>{val}</span>
  }

  formatterTime = (val:any) => {
    return val ? moment(val).format("YYYY-MM-DD HH:mm:ss") : ""
  }

  linkToSystemCaseInfo(record:any) {
    history.push({
      pathname: '/systemcaseinfo',
      query: {
        commit: record.update_Log,
        solver_version: record.solver_version,
        test_id: record.test_id,
      },
    });
  }

  linkToIntegrationCaseInfo(record:any) {
    history.push({
      pathname: '/integrationcaseinfo',
      query: {
        commit: record.update_Log,
        solver_version: record.solver_version,
        test_id: record.test_id,
      },
    });
  }

  // showAddCaseDrawer = (test_id:Number) => {
  //   this.setState({
  //     showAddCaseDrawer: true,
  //     currentTestId:test_id
  //   });
  //   // this.fetchCaseList(test_id)
  // };
  // closeAddCaseDrawer = () => {
  //   this.setState({
  //     showAddCaseDrawer: false,
  //   });
  // };

  // handleAddCase(record: any) {
  //   this.showAddCaseDrawer(record.test_id)
  // }
  fetchShowErrorInfo(record: any) {
    this.setState({ loading: true });
    let errorLog = "";
    let makeLog = "";
    axios({
      url: "/api/getLoadFile",
      method: "get",
      params:{filename:record.solver_version+"_makeError.log"}
    }).then((data:any) => {
      if(data.data?.status == 404){
        this.setState({
          loading: false
        });
        this.openErrorInfoNotification();
        return;
      }else{
        errorLog = data.data;
        axios({
          url: "/api/getLoadFile",
          method: "get",
          params:{filename:record.solver_version+"_make.log"}
        }).then((data2:any) => {
          if(data2.data?.status == 404){
            this.setState({
              loading: false
            });
            this.openErrorInfoNotification();
            return;
          }else{
            makeLog = data2.data;
            const infoTitle = '错误日志'
            const tabList = [
              {
                key: 'MakeError',
                tab: 'MakeError',
              },
              {
                key: 'Make',
                tab: 'Make',
              },
            ];
            const activeTabKey = 'MakeError';
            console.log(errorLog);
            console.log(makeLog);
            
            const contentList = {
              MakeError: <TextArea value={errorLog} autoSize={{ minRows: 9, maxRows: 9 }} bordered={false}/>,
              Make: <TextArea value={makeLog}  autoSize={{ minRows: 9, maxRows: 9 }} bordered={false}/>,
            };

            this.setState({
              loading: false,
              visible:true,
              infoTitle:infoTitle,
              tabList:tabList,
              activeTabKey:activeTabKey,
              contentList:contentList,
            })
          }
        });
      }
    });
  }
  
  openErrorInfoNotification() {
    notification.open({
      message: `错误`,
      description:'错误日志不存在.',
      duration: 2,
    });
  }
  componentDidMount() {
    this.fetch();
  }

  handleTableChange = () => {
    this.fetch();
  };
  
  handlePageChange: PaginationProps['onChange'] = page =>{
    this.setState({curPage:page})
    localStorageSet("tablePage",page)
  }

  fetch = () => {
    this.setState({ loading: true });
    axios({
      url: "/api/search",
      method: "get"
    }).then((data:any) => {
      this.setState({
        loading: false,
        data: data.data.results,
      });
    });
  };

  render() {
    let ModalCardShow;
    if(this.state.visible)
      ModalCardShow = <ModelCard
                        afterClose={()=>this.setState({visible:false})}
                        visible={true}
                        infoTitle={this.state.infoTitle} 
                        tabList={this.state.tabList}
                        activeTabKey={this.state.activeTabKey}
                        contentList={this.state.contentList}
                      />
    else
      ModalCardShow = <></>

    console.log(this.state);
    
    return (
      <>
        <Table
          scroll={{ x: 1200 }}
          columns={this.columns}
          dataSource={this.state.data}
          loading={this.state.loading}
          onChange={this.handleTableChange}
          rowKey="idsolver_info"
          tableLayout="auto"
          pagination={{ 
            defaultPageSize: 20, 
            defaultCurrent:this.state.curPage,
            showQuickJumper: true ,
            onChange:this.handlePageChange
          }}
          bordered
        />
        {ModalCardShow}
      </>
    );
  }
}

export default TableAjax;
