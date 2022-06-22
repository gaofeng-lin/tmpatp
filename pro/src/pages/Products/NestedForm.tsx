import {
    ProCard,
    ProForm,
    ProFormGroup,
    ProFormList,
    ProFormText,
    ProFormSelect
  } from '@ant-design/pro-components';
  import React, {useState } from 'react';
  

  

  const Demo = () => {

    const [renderFlag, setFlag] = useState(false)
    // const selectMap = {
    //   inputform: '输入框',
    //   selectform: '下拉框',
    // }

    return (
      <ProForm 
      onFinish={async (e) => console.log(e)}
      onValuesChange={(value) => console.log('value is :' + value)}
      >
        {/* <ProFormText name="name" label="姓名" /> */}
        <ProFormList
          name="users"
        //   label="参数配置"
          creatorButtonProps={{
            creatorButtonText: '添加模块',
          }}
          initialValue={[
            {
              name: '模块1',
            },
          ]}
 
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
          {/* <ProFormGroup>
            <ProFormText name="name" label="姓名" />
            <ProFormText name="nickName" label="昵称" />
          </ProFormGroup> */}
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
            <ProFormGroup key="group"
            
            >
              <ProFormSelect 
              name="type" 
              label="输入类型" 
              options={[
                {
                  value: 'chapter',
                  label: '盖章后生效',
                },
                {
                  value: 'none',
                  label: '不生效',
                },
              ]}
          
              // initialValue="输入框"
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
                    hello
                  </div>
                )
              }
              
              {/* <ProFormText name="param_name" label="参数名" />
              <ProFormText name="var_type" label="变量类型" />
              <ProFormText name="var_name" label="变量名" />
              <ProFormText name="var_value" label="变量值" /> */}
            </ProFormGroup>
          </ProFormList>
        </ProFormList>
      </ProForm>
    );
  };
  
  export default Demo;