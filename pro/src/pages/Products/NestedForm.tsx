import {
  ProCard,
  ProForm,
  ProFormGroup,
  ProFormList,
  ProFormText,
  ProFormSelect,
} from '@ant-design/pro-components';
import React, {useState } from 'react';

const Demo = () => {
  const [renderFlag, setFlag] = useState(true)
  return (
    <ProForm onFinish={async (e) => console.log(e)}
    onValuesChange={(changeValues) => {
      console.log(changeValues)
      console.log(changeValues.users[0].labels.length)
      console.log(changeValues.users[0].labels[0])
      let len = changeValues.users[0].labels.length
      if (changeValues.users[0].labels[0] != undefined) {
        changeValues.users[0].labels[0].type  == 'selectform'  ? setFlag(false) : setFlag(true)
      } else {
        changeValues.users[0].labels[len - 1].type  == 'selectform'  ? setFlag(false) : setFlag(true)
      }
      // changeValues.users[0].labels[0].type  == 'selectform'  ? setFlag(false) : setFlag(true)
      // changeValues.users[0].labels[0].type  == 'selectform'  ? setFlag(false) : setFlag(true)
    }
    }

    >
      <ProFormText name="name" label="姓名" />
      <ProFormList
        name="users"
        label="用户信息"
        initialValue={[
          {
            name: '1111',
          },
        ]}
        creatorButtonProps={{
          creatorButtonText: '添加模块',
        }}
        itemRender={({ listDom, action }, { record }) => {
          return (
            <ProCard
              bordered
              extra={action}
              title={record?.name}
              style={{
                marginBottom: 8,
              }}
            >
              {listDom}
            </ProCard>
          );
        }}
      >
        <ProFormList
          name="labels"
          label="用户信息"
          creatorButtonProps={{
            creatorButtonText: '添加参数',
          }}
          initialValue={[
            {
              value: '333',
              label: '333',
            },
          ]}
          copyIconProps={{
            tooltipText: '复制此行到末尾',
          }}
          deleteIconProps={{
            tooltipText: '不需要这行了',
          }}
          
        >
          {(f, index, action) => {
            console.log(f, index, action);
            console.log(action.getCurrentRowData())
            return (
                      <ProFormGroup key="group">
                      <ProFormSelect 
                          name="type" 
                          label="输入类型" 
                          options={[
                            {
                              value: 'inputform',
                              label: '文本框参数',
                            },
                            {
                              value: 'selectform',
                              label: '下拉框参数',
                            },
                          ]}
                      
                          initialValue="文本框参数"
                          />
                        {
                        renderFlag ? (
                            <div>
                            <ProFormText name="param_name" label="参数名" />
                            <ProFormText name="var_type" label="变量类型" />
                            <ProFormText name="var_name" label="变量名" />
                            <ProFormText name="var_value" label="变量值" />
                            </div>
                    
                        ): (
                          <div>
                            select,下拉框
                          </div>
                        )
                      }
                      </ProFormGroup>
            )
          }}
          
          {/* <ProFormGroup key="group">
          <ProFormSelect 
              name="type" 
              label="输入类型" 
              options={[
                {
                  value: 'inputform',
                  label: '文本框参数',
                },
                {
                  value: 'selectform',
                  label: '下拉框参数',
                },
              ]}
          
              initialValue="文本框参数"
              />
            {
            renderFlag ? (
                <div>
                <ProFormText name="param_name" label="参数名" />
                <ProFormText name="var_type" label="变量类型" />
                <ProFormText name="var_name" label="变量名" />
                <ProFormText name="var_value" label="变量值" />
                </div>
        
            ): (
              <div>
                select,下拉框
              </div>
            )
          }
          </ProFormGroup> */}
        </ProFormList>
      </ProFormList>
    </ProForm>
  );
};

export default Demo;