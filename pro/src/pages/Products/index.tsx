import { DownOutlined, EllipsisOutlined, QuestionCircleOutlined } from '@ant-design/icons';
import { dateArrayFormatter, ProColumns } from '@ant-design/pro-components';
import { ProTable } from '@ant-design/pro-components';
import { Button, Tag, Tooltip } from 'antd';
import { request } from 'umi';
import {getTestParam, getTestProduct} from  '@/services/api/api';
import React, {useState } from 'react';

export type Status = {
  color: string;
  text: string;
};

export type TableListItem = {
  key: number;
  product_id: number;
  product_name: string;
  cfdversion: number;
  product_info: string;
};
export default () => {
  
  const [productId,setProductId]=useState(1);

  
const columns: ProColumns<TableListItem>[] = [
  {
    title: '产品编号',
    width: 120,
    dataIndex: 'product_id',
    render: (_) => <a>{_}</a>,
  },
  {
    title: '产品名称',
    width: 120,
    dataIndex: 'product_name',
    render: (_, record) => <a>{_}</a>,
  },
  {
    title: '解算器版本号',
    width: 120,
    dataIndex: 'cfdversion',
    align: 'right',
    sorter: (a, b) => a.cfdversion - b.cfdversion,
  },

  {
    title: '产品说明',
    width: 120,
    dataIndex: 'product_info',
    render: (_, record) => <a>{_}</a>,
  },
];

const expandedRowRender = () => {
  return (
    <ProTable
      params={{product_id:productId}}
      columns={[
        { title: '参数名', dataIndex: 'param_name', key: 'param_name' },
        { title: '变量类型', dataIndex: 'var_type', key: 'var_type' },
        { title: '变量名', dataIndex: 'var_name', key: 'var_name' },
        { title: '变量值', dataIndex: 'var_value', key: 'var_value' },
      ]}
      headerTitle={false}
      rowKey="id"
      search={false}
      options={false}
      request={async (params) => {
        const msg = await getTestParam(params);
        return {
          data: msg.data.results,
          success: true,
        };
        }
      }
      pagination={false}
    />
  );
};

const onExpandFn =(expanded: boolean, record: any)=>{
setProductId(record.product_id);
}

  return (
    <ProTable<TableListItem>
      columns={columns}
      // request={(params, sorter, filter) => {
      //   // 表单搜索项会从 params 传入，传递给后端接口。
      //   // console.log(params, sorter, filter);
      //   return Promise.resolve({
      //     data: tableListDataSource,
      //     success: true,
      //   });
      // }}

      request={async () => {

        const msg = await getTestProduct();
        return{
          data:msg.data.results,
          success: true,
        }
      }}
      rowKey="product_id"
      pagination={{
        showQuickJumper: true,
      }}
      expandable={{ expandedRowRender }}
      onExpand={onExpandFn}
      search={false}
      dateFormatter="string"
      headerTitle="产品管理"
      options={false}
      toolBarRender={() => [
        <Button key="show">查看日志</Button>,
        <Button key="out">
          导出数据
          <DownOutlined />
        </Button>,
        <Button key="primary" type="primary">
          创建应用
        </Button>,
      ]}
    />
  );
};