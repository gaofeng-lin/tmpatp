import { DownOutlined, EllipsisOutlined, QuestionCircleOutlined } from '@ant-design/icons';
import { dateArrayFormatter, ProColumns } from '@ant-design/pro-components';
import { ProTable } from '@ant-design/pro-components';
import { Button, Tag, Tooltip } from 'antd';
import { request } from 'umi';
import {getTestdb, getTestProduct} from  '@/services/api/api';
import React from 'react';

export type Status = {
  color: string;
  text: string;
};

const statusMap = {
  0: {
    color: 'blue',
    text: '进行中',
  },
  1: {
    color: 'green',
    text: '已完成',
  },
  2: {
    color: 'volcano',
    text: '警告',
  },
  3: {
    color: 'red',
    text: '失败',
  },
  4: {
    color: '',
    text: '未完成',
  },
};

export type TableListItem = {
  key: number;
  product_id: number;
  product_name: string;
  solver_num: number;
  product_info: string;
};
const tableListDataSource: TableListItem[] = [];

const creators = ['付小小', '曲丽丽', '林东东', '陈帅帅', '兼某某'];

// for (let i = 0; i < 5; i += 1) {
//   tableListDataSource.push({
//     key: i,
//     name: 'AppName',
//     containers: Math.floor(Math.random() * 20),
//     creator: creators[Math.floor(Math.random() * creators.length)],
//     status: statusMap[Math.floor(Math.random() * 10) % 5],
//     createdAt: Date.now() - Math.floor(Math.random() * 100000),
//   });
// }

request('/api/testproduct', {
  method: 'get',
}).then((data: any) => {
  console.log(data)
  tableListDataSource.push(data)
})

console.log(tableListDataSource)

// tableListDataSource[0] = {
//   product_id: 1,
//   product_name: "风雷1",
//   solver_num: 5720,
//   product_info: '使用了算法1',
//   key: 1,
//    }

//   tableListDataSource[1] = {
//   key: 2,
//   product_id: 2,
//   product_name: "风雷2",
//   solver_num: 5720,
//   product_info: '使用了算法2',
// }

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
    dataIndex: 'solver_num',
    align: 'right',
    sorter: (a, b) => a.solver_num - b.solver_num,
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
      columns={[
        { title: '参数名', dataIndex: 'param_name', key: 'param_name' },
        { title: '变量类型', dataIndex: 'var_type', key: 'var_type' },
        { title: '变量名', dataIndex: 'var_name', key: 'var_name' },
        { title: '变量值', dataIndex: 'var_value', key: 'var_value' },
      ]}
      headerTitle={false}
      search={false}
      options={false}
      // request={async () => {
      //   const msg = await getTestdb();
      //   const results =msg.param;
      //   let data = [];
      //   for(let i = 0; i < results.length; i++) {
      //       data.push({
      //           key: i,
      //           param_name: results[i].param_name,
      //           var_type: results[i].var_type,
      //           var_name: results[i].var_name,
      //           var_value: results[i].var_value,
      //       });
      //   }
      //   return {
      //     data: data,
      //     success: true,
      //   };
      //   }
      // }
      pagination={false}
    />
  );
};

export default () => {
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
        let data:any = [];
        msg.map((item: any) => {
          data.push(item)
        })

        return{
          data:data,
          success: true,
        }
      }}
      rowKey="key"
      pagination={{
        showQuickJumper: true,
      }}
      expandable={{ expandedRowRender }}
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