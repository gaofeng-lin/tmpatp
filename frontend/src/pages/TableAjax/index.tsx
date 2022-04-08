import React from "react";
import styles from "./index.less";
import { Table, Tooltip, Drawer, Space } from "antd";
import reqwest from "reqwest";
import { PlusOutlined } from '@ant-design/icons';
import moment from "moment";
import { history } from 'umi';
// import CaseList  from "../CaseListDrawer"

class App extends React.Component {
  state = {
    data: [],
    loading: false,
    showAddCaseDrawer: false,
    currentTestId: 0,
    // CaseListLoading:false,
    // CaseListData:[],
    // selectedRowKeys:[]
  };

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
      render: (value: any) => { return this.formatterBranch(value) }
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
      render: (value: any) => { return this.formatterResults(value) },
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

  formatterResults = (val: Number) => {
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
        spanCompent = <span style={{ color: "red" }}>不通过</span>

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

  formatterTime = (val) => {
    return val ? moment(val).format("YYYY-MM-DD HH:mm:ss") : ""
  }

  linkToSystemCaseInfo(record) {
    history.push({
      pathname: '/systemcaseinfo',
      query: {
        commit: record.update_Log,
        solver_version: record.solver_version,
        test_id: record.test_id,
      },
    });
  }

  linkToIntegrationCaseInfo(record) {
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

  handleAddCase(record: any) {
    this.showAddCaseDrawer(record.test_id)
  }

  componentDidMount() {
    this.fetch();
  }

  handleTableChange = () => {
    this.fetch();
  };

  // fetchCaseList = (test_id:Number) => {
  //   this.setState({ CaseListLoading: true });
  //   reqwest({
  //     url: "/api/searchCaseList",
  //     method: "get",
  //     type: "json",
  //     data:{test_id:test_id}
  //   }).then((data:any) => {
  //     let rowKeys: any[] = [];
  //     for( let unit in data.results ){
  //       let case_exists = data.results[unit]["case_exists"];
  //       console.log(case_exists,test_id,case_exists == test_id)
  //       if(case_exists != 0 && case_exists == test_id)
  //         rowKeys.push( data.results[unit]["case_id"]);
  //     }
  //     console.log(rowKeys)
  //     this.setState({
  //       CaseListLoading: false,
  //       CaseListData: data.results,
  //       selectedRowKeys:rowKeys
  //     });
  //   });
  // };

  fetch = () => {
    this.setState({ loading: true });
    reqwest({
      url: "/api/search",
      method: "get",
      type: "json"
    }).then((data) => {
      this.setState({
        loading: false,
        data: data.results
      });
    });
  };

  render() {
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
          pagination={{ defaultPageSize: 20, showQuickJumper: true }}
          bordered
        />
        {/* <CaseList 
        loading={this.state.CaseListLoading}
        selectedRowKeys={this.state.selectedRowKeys}
        data={this.state.CaseListData}
        test_id={this.state.currentTestId}
        title="Add Case"
        placement="right"
        closable={false}
        onClose={this.closeAddCaseDrawer}
        visible={this.state.showAddCaseDrawer}
      /> */}
      </>
    );
  }
}

export default () => (
  <div className={styles.container}>
    <div id="components-table-demo-ajax">
      <App />
    </div>
  </div>
);
