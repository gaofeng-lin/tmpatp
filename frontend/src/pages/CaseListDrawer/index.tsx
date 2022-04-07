import * as React from 'react';
import { Component } from 'react';
import { Drawer, Table,Button } from 'antd';

export interface CaseListProps {
    test_id:Number,
    visible:boolean,
    onClose:any
    title:String,
    closable:boolean,
    placement:any,
    data:any,
    loading:boolean,
    selectedRowKeys:any
}
 
export interface CaseListState {
    test_id:Number,
    data:any,
    loading:Boolean,
    selectedRowKeys:any,
}
 
class CaseList extends Component<CaseListProps, CaseListState> {
    constructor(props: CaseListProps) {
        super(props);
        this.state = { 
            test_id:props.test_id,
            data: props.data,
            selectedRowKeys:props.selectedRowKeys,
            loading: props.data,
        };
    }
    columns = [
        {
          title: "算例名称",
          dataIndex: "case_name",
          width: 140,
        },
    ]
    componentDidMount() {
        // this.fetch();
      }
    
    handleTableChange = () => {
      // this.fetch();
    };
  
    onSubmitData(){
      // console.log("onSubmitData");
    }
    
    onSelectChange = (selectedRowKeys:any) => {
      // console.log(selectedRowKeys);
      this.setState({ selectedRowKeys });
    };

    render() { 
        const rowSelection = {
            selectedRowKeys:this.props.selectedRowKeys,
            onChange: this.onSelectChange,
        };
        const hasSelected = this.props.selectedRowKeys.length > 0;
        return ( 
            <Drawer
            width="40%"
            title={this.props.title}
            closable={this.props.closable}
            onClose={this.props.onClose}
            visible={this.props.visible}
            placement={this.props.placement}
            bodyStyle={{ paddingBottom: 80 }}
            footer={
              <div
                style={{
                  textAlign: 'right',
                }}
              >
                  <span style={{ marginRight: 8 }}>
                      {hasSelected ? `选中了 ${this.state.selectedRowKeys.length} 项` : ''}
                  </span>
                  <Button onClick={this.onSubmitData} type="primary" style={{ marginRight: 8 }}>
                  提交
                  </Button>
                  <Button onClick={this.props.onClose} >
                  取消
                  </Button>
              </div>
            }
          >
              <Table rowKey="case_id" rowSelection={rowSelection} columns={this.columns} dataSource={this.props.data} />
          </Drawer>
         );
    }
}
 
export default CaseList;