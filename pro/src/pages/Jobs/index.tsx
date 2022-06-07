import { cancelJobs, getRunningJobs } from '@/services/api/api';
import { createFromIconfontCN } from '@ant-design/icons';
import { PageContainer } from '@ant-design/pro-layout';
import type { ActionType, ProColumns } from '@ant-design/pro-table';
import ProTable from '@ant-design/pro-table';
import { Space, Table, Tooltip } from 'antd';
import React, { useRef, useState } from 'react';
import { FormattedMessage } from 'umi';

const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_2678397_niqkd3j7udk.js',
});
const CaseIndex: React.FC = () => {
  const actionRef = useRef<ActionType>();
  const [activeKey, setActiveKey] = useState<React.Key>('integrationCase');

  const canCelJob = (test_case_ids: any) => {
    cancelJobs({ type: activeKey, test_case_ids: test_case_ids });
    actionRef.current?.reload();
  };
  const columns: ProColumns<API.JobListItem>[] = [
    {
      title: <FormattedMessage id="pages.jobManager.id" defaultMessage="ID" />,
      dataIndex: 'test_case_id',
      sorter: (a: { test_case_id: number }, b: { test_case_id: number }) =>
        a.test_case_id - b.test_case_id,
    },
    {
      title: (
        <FormattedMessage id="pages.jobManager.solver_version" defaultMessage="Solver Version" />
      ),
      dataIndex: 'solver_version',
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.jobManager.case_name" defaultMessage="Case Name" />,
      dataIndex: 'case_name',
      sorter: (a: { case_name: string }, b: { case_name: string }) =>
        a.case_name.localeCompare(b.case_name),
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.jobManager.starttime" defaultMessage="Start Time" />,
      dataIndex: 'start_time',
      width: 200,
      valueType: 'dateTime',
    },
    {
      title: <FormattedMessage id="pages.jobManager.actions" defaultMessage="Actions" />,
      align: 'center',
      width: 160,
      render: (record: any) => {
        return (
          <Space size="middle">
            <Tooltip placement="top" title="取消作业">
              <a
                onClick={() => {
                  let arr = [];
                  arr.push(record.test_case_id);
                  canCelJob(arr);
                }}
              >
                <IconFont style={{ fontSize: 16 }} type="icon-close" />
              </a>
            </Tooltip>
          </Space>
        );
      },
    },
  ];

  return (
    <PageContainer>
      <ProTable<API.JobListItem>
        params={{ type: activeKey }}
        actionRef={actionRef}
        rowKey="test_case_id"
        search={false}
        request={async (params) => {
          const msg = await getRunningJobs(params);
          return {
            data: msg.results,
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
        rowSelection={{
          selections: [Table.SELECTION_ALL, Table.SELECTION_INVERT],
          defaultSelectedRowKeys: [],
        }}
        tableAlertRender={({ selectedRowKeys, onCleanSelected }) => (
          <Space size={24}>
            <span>
              已选 {selectedRowKeys.length} 项
              <a style={{ marginLeft: 8 }} onClick={onCleanSelected}>
                取消选择
              </a>
            </span>
          </Space>
        )}
        tableAlertOptionRender={(selectedRowKeys) => {
          return (
            <Space size={16}>
              <a
                onClick={() => {
                  canCelJob(selectedRowKeys.selectedRowKeys);
                  selectedRowKeys.onCleanSelected();
                }}
              >
                批量取消作业
              </a>
            </Space>
          );
        }}
      />
    </PageContainer>
  );
};

export default CaseIndex;
