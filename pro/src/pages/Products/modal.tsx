import { PlusOutlined } from '@ant-design/icons';
import {
  ModalForm,
  ProForm,
  ProFormDateRangePicker,
  ProFormSelect,
  ProFormText,
  ProColumns,
  EditableProTable,
} from '@ant-design/pro-components';
import { Button, message, Input } from 'antd';
import React, {useState} from 'react';
import {sendProductInfo} from  '@/services/api/api';

const waitTime = (time: number = 100) => {
    return new Promise((resolve) => {
      setTimeout(() => {
        resolve(true);
      }, time);
    });
  };
  
  type DataSourceType = {
    id: React.Key;
    title?: string;
    decs?: string;
    state?: string;
    created_at?: string;
    children?: DataSourceType[];
  };
  
  const defaultData: DataSourceType[] = [
    {
      id: 624748504,
      title: '活动名称一',
      decs: '这个活动真好玩',
      state: 'open',
      created_at: '2020-05-26T09:42:56Z',
    },
    {
      id: 624691229,
      title: '活动名称二',
      decs: '这个活动真好玩',
      state: 'closed',
      created_at: '2020-05-26T08:19:22Z',
    },
  ];
  
  const columns: ProColumns<DataSourceType>[] = [
    {
      title: '参数名',
      dataIndex: 'param_name',
      width: '20%',
    },
    {
      title: '变量类型',
      dataIndex: 'var_type',
      width: '20%',
    },
    {
      title: '变量名',
      dataIndex: 'var_name',
      width: '20%',
    },
    {
      title: '变量值',
      dataIndex: 'var_value',
      width: '20%',
    },
    {
      title: '操作',
      valueType: 'option',
    },
  ];

  


const MF = () => {
    const [editableKeys, setEditableRowKeys] = useState<React.Key[]>(() =>
    defaultData.map((item) => item.id),);
  return (
    <ModalForm<{
      name: string;
      product_name: string;
    }>
      title="添加产品"
      trigger={
        <Button type="primary">
          <PlusOutlined />
          添加产品
        </Button>
      }
      onFinish={async (values) => {
        await waitTime(2000);
        console.log(values);
        sendProductInfo({values})
        message.success('提交成功');
      }}
      initialValues={{
        name: '蚂蚁设计有限公司',
        useMode: 'chapter',
      }}
    >
      <ProForm.Group>
        <ProFormText width="md" name="product_name" label="产品名称" placeholder="请输入名称" />
        <ProFormText width="md" name="product_info" label="产品说明" placeholder="请产品说明" />
      </ProForm.Group>
      <ProFormText width="sm" name="cfdversion" label="解算器版本" />
      <ProForm.Item
        label="参数添加"
        name="dataSource"
        // initialValue={defaultData}
        trigger="onValuesChange"
      >
        <EditableProTable<DataSourceType>
          rowKey="id"
          toolBarRender={false}
          columns={columns}
          recordCreatorProps={{
            newRecordType: 'dataSource',
            position: 'top',
            record: () => ({
              id: Date.now(),
              // addonBefore: 'ccccccc',
              // decs: 'testdesc',
            }),
          }}
          editable={{
            type: 'multiple',
            editableKeys,
            onChange: setEditableRowKeys,
            actionRender: (row, _, dom) => {
              return [dom.delete];
            },
          }}
        />
      </ProForm.Item>
    </ModalForm>
  );
};

export default MF;