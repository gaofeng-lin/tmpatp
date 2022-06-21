import {
    ProCard,
    ProForm,
    ProFormGroup,
    ProFormList,
    ProFormText,
  } from '@ant-design/pro-components';
  
  const Demo = () => {
    return (
      <ProForm onFinish={async (e) => console.log(e)}>
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
          <ProFormGroup>
            <ProFormText name="name" label="姓名" />
            <ProFormText name="nickName" label="昵称" />
          </ProFormGroup>
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
            <ProFormGroup key="group">
              <ProFormText name="value" label="值" />
              <ProFormText name="label" label="显示名称" />
            </ProFormGroup>
          </ProFormList>
        </ProFormList>
      </ProForm>
    );
  };
  
  export default Demo;