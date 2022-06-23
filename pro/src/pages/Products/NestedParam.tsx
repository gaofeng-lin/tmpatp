import {
    ProCard,
    ProForm,
    ProFormGroup,
    ProFormList,
    ProFormText,
    ProFormSelect
  } from '@ant-design/pro-components';

const NP = ()=> {
    const renderFlag = false
    return (
        <div>
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
        </div>
        
        // <div>
        // <ProFormText name="param_name" label="参数名" />
        // <ProFormText name="var_type" label="变量类型" />
        // <ProFormText name="var_name" label="变量名" />
        // <ProFormText name="var_value" label="变量值" />
        // </div>

    )
}


export default NP
