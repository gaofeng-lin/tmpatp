import { DownOutlined, EllipsisOutlined, QuestionCircleOutlined } from '@ant-design/icons';
import type { ProColumns } from '@ant-design/pro-components';
import { ProTable } from '@ant-design/pro-components';
import { Button, Tag, Tooltip } from 'antd';
import { request } from 'umi';
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
  name: string;
  containers: number;
  creator: string;
  status: Status;
  createdAt: number;
};
const tableListDataSource: TableListItem[] = [];

const creators = ['付小小', '曲丽丽', '林东东', '陈帅帅', '兼某某'];

for (let i = 0; i < 5; i += 1) {
  tableListDataSource.push({
    key: i,
    name: 'AppName',
    containers: Math.floor(Math.random() * 20),
    creator: creators[Math.floor(Math.random() * creators.length)],
    status: statusMap[Math.floor(Math.random() * 10) % 5],
    createdAt: Date.now() - Math.floor(Math.random() * 100000),
  });
}

const columns: ProColumns<TableListItem>[] = [
  {
    title: '产品名称',
    width: 120,
    dataIndex: 'name',
    render: (_) => <a>{_}</a>,
  },
  {
    title: '解算器版本',
    width: 120,
    dataIndex: 'status',
    render: (_, record) => <Tag color={record.status.color}>{record.status.text}</Tag>,
  },
  {
    title: '产品说明',
    width: 120,
    dataIndex: 'containers',
    align: 'right',
    sorter: (a, b) => a.containers - b.containers,
  },

  {
    title: '创建者',
    width: 120,
    dataIndex: 'creator',
    valueEnum: {
      all: { text: '全部' },
      付小小: { text: '付小小' },
      曲丽丽: { text: '曲丽丽' },
      林东东: { text: '林东东' },
      陈帅帅: { text: '陈帅帅' },
      兼某某: { text: '兼某某' },
    },
  },
  {
    title: (
      <>
        创建时间
        <Tooltip placement="top" title="这是一段描述">
          <QuestionCircleOutlined style={{ marginLeft: 4 }} />
        </Tooltip>
      </>
    ),
    width: 140,
    key: 'since',
    dataIndex: 'createdAt',
    valueType: 'date',
    sorter: (a, b) => a.createdAt - b.createdAt,
  },
  {
    title: '操作',
    width: 164,
    key: 'option',
    valueType: 'option',
    render: () => [
      <a key="1">链路</a>,
      <a key="2">报警</a>,
      <a key="3">监控</a>,
      <a key="4">
        <EllipsisOutlined />
      </a>,
    ],
  },
];
let paramdata: any = [];
let productdata: any = [];
const expandedRowRender = () => {

  // for (let i = 0; i < 3; i += 1) {
  //   data.push({
  //     key: i,
  //     date: '2014-12-24 23:12:00',
  //     name: 'This is production name',
  //     upgradeNum: 'Upgraded: 56',
  //   });
  // }

  // paramdata[0] = {paramName:'999', varType:'int', varName:'paraone', varValue:100};

//   data.push({
//     paramName: '参数1', 
//     varType:'int', 
//     varName:'paraone', 
//     varValue:100,
// });

  request('api/testdb', {
    method: 'get',
  }).then((data1: any) => {
    // console.log(data1.param)
    // console.log(data1.product)
    data1.param.map((item: any) => {
      paramdata.push(item)
      console.log(item)
    })
  })

  console.log(paramdata)



  return (
    <ProTable
      columns={[
        { title: '参数名', dataIndex: 'param_name', key: 'param_name' },
        { title: '变量类型', dataIndex: 'var_type', key: 'var_type' },
        { title: '变量名', dataIndex: 'var_name', key: 'var_name' },


        {
          title: '变量值',
          dataIndex: 'var_value',
          key: 'var_value',
          // valueType: 'option',
          // render: () => [<a key="Pause">Pause</a>, <a key="Stop">Stop</a>],
        },
      ]}
      headerTitle={false}
      search={false}
      options={false}
      dataSource={paramdata}
      pagination={false}
    />
  );
};

export default () => {
  return (
    <ProTable<TableListItem>
      columns={columns}
      request={(params, sorter, filter) => {
        // 表单搜索项会从 params 传入，传递给后端接口。
        console.log(params, sorter, filter);
        return Promise.resolve({
          data: tableListDataSource,
          success: true,
        });
      }}
      rowKey="key"
      pagination={{
        showQuickJumper: true,
      }}
      expandable={{ expandedRowRender }}
      search={false}
      dateFormatter="string"
      headerTitle="嵌套表格"
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