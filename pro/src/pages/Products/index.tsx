import { DownOutlined, EllipsisOutlined, QuestionCircleOutlined } from '@ant-design/icons';
import { dateArrayFormatter, ProColumns } from '@ant-design/pro-components';
import { ProTable } from '@ant-design/pro-components';
import { Button, Tag, Tooltip } from 'antd';
import { request, FormattedMessage } from 'umi';
import {getPersonParam, getProductInfo} from  '@/services/api/api';
import React, {useState} from 'react';
import { PageContainer } from '@ant-design/pro-layout';
import {sendEditProduct, sendEditParam, deleteProductParam} from  '@/services/api/api';
import MF from './modal';
import EditProduct from './Edit';

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
  url: string;
  id: string;
};
export default () => {
  
const [productId, setProductId] = useState<any>(1);


 
const columns: ProColumns<TableListItem>[] = [
  {
    title: <FormattedMessage id="pages.productManager.id"  />,
    width: 120,
    dataIndex: 'product_id',
    readonly: true,
    // render: (_) => <a>{_}</a>,
  },
  {
    title: <FormattedMessage id="pages.productManager.name"  />,
    width: 120,
    dataIndex: 'product_name',
    // render: (_, record) => <a>{_}</a>,
  },
  {
    title: <FormattedMessage id="pages.productManager.solver_version"  />,
    width: 120,
    dataIndex: 'cfdversion',
    align: 'left',
    sorter: (a, b) => a.cfdversion - b.cfdversion,
  },

  {
    title: <FormattedMessage id="pages.productManager.brief"  />,
    width: 120,
    dataIndex: 'product_info',
    // render: (_, record) => <a>{_}</a>,
  },
  {
    title: '操作',
    valueType: 'option',
    width: 200,
    render: (text, record, _, action) => [
      <a
        key="editable"
        onClick={() => {
          // action?.startEditable?.(record.product_id);
          // return(
          //    <MF></MF>
          // )
          // {test}
         
        }}
      >
        {/* 编辑 */}
        <EditProduct product_id = {record.product_id}></EditProduct>
      </a>,
    <a href={'http://localhost:8080/#/login/' + record.product_id + '/' + record.cfdversion} target="_blank" rel="noopener noreferrer" key="view">
      使用产品
    </a>,
    ],
  },
];
const [editableKeys, setEditableRowKeys] = useState<React.Key[]>([]);
const expandedRowRender = () => {
  // const [editableKeys, setExpandKeys] = useState<React.Key[]>([]);
  return (
    <ProTable
      params={{product_id: productId}}
      columns={[
        { title: '参数名', dataIndex: 'param_name', key: 'param_name' },
        { title: '变量类型', dataIndex: 'var_type', key: 'var_type' },
        { title: '变量名', dataIndex: 'var_name', key: 'var_name' },
        { title: '变量值', dataIndex: 'var_value', key: 'var_value' },
        {
          title: '操作',
          valueType: 'option',
          width: 200,
          render: (text, record, _, action) => [
            <a
              key="editable"
              onClick={() => {
                action?.startEditable?.(record.id);
              }}
            >
              编辑
            </a>,
          ],
        },
      ]}
      headerTitle={false}
      rowKey="id"
      search={false}
      options={false}
      request={async (params) => {
        const msg = await getPersonParam(params);
        return {
          data: msg.data.results,
          success: true,
        };
        }
      }
      pagination={false}
      editable={{
        type: 'multiple',
        // editableKeys,
        onSave: async (rowKey, data, row) => {
          sendEditParam(data);
          await waitTime(2000);
        },
        onDelete: async (rowKey, row) => {
          // console.log(rowKey, data, row);
          let deleteObj = {};
          deleteObj['id'] = rowKey;
          deleteObj['idType'] = 'id';
          deleteProductParam(deleteObj);
          // sendEditParam(data);
          await waitTime(2000);
        },
        // onChange: setEditableRowKeys,
      }}
    />
  );
};

const onExpandFn =(expanded: boolean, record: any)=>{
  setProductId(record.product_id);
}

const waitTime = (time: number = 100) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve(true);
    }, time);
  });
};



  return (
    <PageContainer>
        <ProTable<TableListItem>
      columns={columns}
      request={async () => {

        const msg = await getProductInfo();
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
      options={false}
      editable={{
        type: 'multiple',
        editableKeys,
        onSave: async (rowKey, data, row) => {
          sendEditProduct(data);
          await waitTime(2000);
        },
        onDelete: async (rowKey) => {
          let deleteObj = {};
          deleteObj['id'] = rowKey;
          deleteObj['idType'] = 'product_id';
          deleteProductParam(deleteObj);
        },
        onChange: setEditableRowKeys,
      }}

      // toolBarRender={() => [
      //   <Button key="show">查看日志</Button>,
      //   <Button key="out">
      //     导出数据
      //     <DownOutlined />
      //   </Button>,
      //   <Button key="primary" type="primary">
      //     创建应用
      //   </Button>,
      // ]}
    />
        <div><MF></MF></div>
    </PageContainer>


      
  );
};