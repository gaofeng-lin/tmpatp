import { caseinfo, cases } from '@/services/api/api';
import { PageContainer } from '@ant-design/pro-layout';
import type { ActionType, ProColumns } from '@ant-design/pro-table';
import ProTable from '@ant-design/pro-table';
import { Drawer } from 'antd';
import React, { useRef, useState } from 'react';
import { FormattedMessage } from 'umi';

const CaseIndex: React.FC = () => {
  const actionRef = useRef<ActionType>();
  const [activeKey, setActiveKey] = useState<React.Key>('integrationCase');
  const [caseName, setCaseName] = useState<React.Key>('');
  const [caseID, setCaseID] = useState<React.Key>(1);
  const [visible, setVisible] = useState(false);

  const showDrawer = () => {
    setVisible(true);
  };

  const onClose = () => {
    setVisible(false);
  };

  const columns: ProColumns<API.CaseListItem>[] = [
    {
      title: <FormattedMessage id="pages.caseManager.id" defaultMessage="Case ID" />,
      dataIndex: 'case_id',
      sorter: (a: { case_id: number }, b: { case_id: number }) => a.case_id - b.case_id,
    },
    {
      title: <FormattedMessage id="pages.caseManager.case_name" defaultMessage="Case Name" />,
      dataIndex: 'case_name',
      sorter: (a: { case_name: string }, b: { case_name: string }) =>
        a.case_name.localeCompare(b.case_name),
      hideInForm: true,
    },
  ];

  const infoColumns: ProColumns<API.CaseInfoItem>[] = [
    {
      title: <FormattedMessage id="pages.caseManager.info.version" defaultMessage="Version" />,
      dataIndex: 'solver_version',
      sorter: (a, b) => a.solver_version - b.solver_version,
    },
    {
      title: <FormattedMessage id="pages.caseManager.info.ori" defaultMessage="Ori" />,
      dataIndex: 'result_evaluation_ori',
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.caseManager.info.pre" defaultMessage="Pre" />,
      dataIndex: 'result_evaluation_pre',
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.caseManager.info.runtime" defaultMessage="runtime" />,
      dataIndex: 'run_time',
      hideInForm: true,
    },
  ];
  return (
    <PageContainer>
      <ProTable<API.CaseListItem>
        params={{ type: activeKey }}
        actionRef={actionRef}
        rowKey="case_id"
        search={false}
        request={async (params) => {
          // 这里需要返回一个 Promise,在返回之前你可以进行数据转化
          // 如果需要转化参数可以在这里进行修改
          const msg = await cases(params);
          return {
            data: msg.results,
            // success 请返回 true，
            // 不然 table 会停止解析数据，即使有数据
            success: true,
          };
        }}
        toolbar={{
          menu: {
            type: 'tab',
            activeKey: activeKey,
            items: [
              {
                key: 'integrationCase',
                label: <span>集成测试{activeKey === 'integrationCase'}</span>,
              },
              {
                key: 'systemCase',
                label: <span>系统测试{activeKey === 'systemCase'}</span>,
              },
            ],
            onChange: (key) => {
              setActiveKey(key as string);
            },
          },
        }}
        columns={columns}
        onRow={(record) => ({
          onClick: () => {
            setCaseName(record.case_name);
            setCaseID(record.case_id);
            showDrawer();
          },
        })}
      />
      <Drawer width={640} placement="right" closable={false} onClose={onClose} visible={visible}>
        <p className="site-description-item-profile-p" style={{ marginBottom: 24 }}>
          {caseName}
        </p>
        <ProTable<API.CaseInfoItem>
          params={{ type: activeKey, case_id: caseID }}
          actionRef={actionRef}
          rowKey="solver_version"
          toolBarRender={false}
          search={false}
          request={async (params) => {
            const msg = await caseinfo(params);
            return {
              data: msg.results,
              success: true,
            };
          }}
          columns={infoColumns}
        />
      </Drawer>
    </PageContainer>
  );
};

export default CaseIndex;
