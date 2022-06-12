import { getLoadFile, results } from '@/services/api/api';
import { createFromIconfontCN } from '@ant-design/icons';
import type { ActionType, ProColumns } from '@ant-design/pro-table';
import ProTable from '@ant-design/pro-table';
import { Button, Modal, notification, PaginationProps, Space, Tooltip } from 'antd';
import TextArea from 'antd/lib/input/TextArea';
import React, { useRef, useState } from 'react';
import { FormattedMessage, history } from 'umi';
import FileInfoBox from '../FileInfoBox';
import { localStorageSet } from '../Storage';

const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_2678397_niqkd3j7udk.js',
});

export interface TableProps {
  branchFilters: any;
  curPage: number;
}

const ResultIndex: React.FC<TableProps> = (props) => {
  const branchFilters = props.branchFilters;
  const actionRef = useRef<ActionType>();
  const infoTitle = '错误日志';
  const tabList = [
    {
      key: 'MakeError',
      tab: 'MakeError',
    },
    {
      key: 'Make',
      tab: 'Make',
    },
  ];
  const activeTabKey = 'MakeError';
  const [contentList, setContentList] = useState({});
  const [isModalVisible, setIsModalVisible] = useState(false);
  const [loading, setLoading] = useState(false);

  const openModel = () => {
    setIsModalVisible(true);
  };
  const aftercloseModel = () => {
    setIsModalVisible(false);
  };
  const linkToCaseInfo = (record: any, type: string) => {
    history.push({
      pathname: '/results/caseinfo',
      query: {
        type: type,
        commit: record.update_Log,
        solver_version: record.solver_version,
        test_id: record.test_id,
      },
    });
  };

  const openErrorInfoNotification = () => {
    notification.open({
      message: `错误`,
      description: '错误日志不存在.',
      duration: 2,
    });
  };

  const fetchShowErrorInfo = (record: any) => {
    setLoading(true);
    setContentList({});
    let errorLog = '';
    let makeLog = '';
    const makeErrorDate = getLoadFile({ filename: record.solver_version + '_makeError.log' });
    makeErrorDate.then((data: any) => {
      if (data?.status == 404) {
        openErrorInfoNotification();
        setLoading(false);
        return;
      } else {
        errorLog = data;

        const makeDate = getLoadFile({ filename: record.solver_version + '_make.log' });
        makeDate.then((data2: any) => {
          if (data2?.status == 404) {
            openErrorInfoNotification();
            setLoading(false);
            return;
          } else {
            makeLog = data2;
            setContentList({
              MakeError: (
                <TextArea value={errorLog} autoSize={{ minRows: 9, maxRows: 9 }} bordered={false} />
              ),
              Make: (
                <TextArea value={makeLog} autoSize={{ minRows: 9, maxRows: 9 }} bordered={false} />
              ),
            });
            setLoading(false);
            openModel();
          }
        });
      }
    });
  };
  const formatterResults = (val: number, record: any) => {
    let spanCompent = null;
    switch (val) {
      case 0:
        spanCompent = <span>未编译</span>;
        break;
      case 1:
        spanCompent = <span>正在编译</span>;
        break;
      case 2:
        spanCompent = <span>通过</span>;

        break;
      case 3:
        spanCompent = (
          <a onClick={() => fetchShowErrorInfo(record)}>
            <span style={{ color: 'red' }}>
              不通过
              <IconFont style={{ fontSize: 18 }} type="icon-iconsearch-copy" />
            </span>
          </a>
        );
        break;
      default:
        break;
    }
    return spanCompent;
  };

  const handlePageChange: PaginationProps['onChange'] = (page: number) => {
    localStorageSet('resultsTablePage', page);
  };

  const columns: ProColumns<API.ResultListItem>[] = [
    {
      title: <FormattedMessage id="pages.resultsManager.id" defaultMessage="Result ID" />,
      dataIndex: 'solver_version',
      width: 120,
      align: 'center',
      sorter: (a, b) => a.solver_version - b.solver_version,
      defaultSortOrder: 'descend',
    },
    {
      title: <FormattedMessage id="pages.resultsManager.gitProject" defaultMessage="Git Project" />,
      dataIndex: 'gitProject',
      width: 120,
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.resultsManager.branchName" defaultMessage="BranchName" />,
      dataIndex: 'branchName',
      width: 120,
      hideInForm: true,
      render: (val: any) => {
        if (val == 'ActiveBranch') return <span style={{ color: 'blue' }}>{val}</span>;
        else return <span>{val}</span>;
      },
      filters: branchFilters,
      onFilter: (value, record) => record.branchName.toString().indexOf(value) === 0,
    },
    {
      title: (
        <FormattedMessage id="pages.resultsManager.updateAuthor" defaultMessage="Update Author" />
      ),
      dataIndex: 'update_author',
      hideInForm: true,
      width: 120,
      render: (value: any, record: any) => {
        return record.branchName == 'ActiveBranch' ? (
          <span style={{ color: 'blue' }}>{value}</span>
        ) : (
          <span>{value}</span>
        );
      },
    },
    {
      title: <FormattedMessage id="pages.resultsManager.svnDate" defaultMessage="Commit Date" />,
      dataIndex: 'svnDate',
      width: 200,
      valueType: 'dateTime',
      hideInForm: true,
    },
    {
      title: <FormattedMessage id="pages.resultsManager.updateLog" defaultMessage="Commit Log" />,
      dataIndex: 'update_Log',
      hideInForm: true,
      width: 200,
      render: (value: any) => (
        <Tooltip placement="topLeft" title={value}>
          {value}
        </Tooltip>
      ),
    },
    {
      title: <FormattedMessage id="pages.resultsManager.state" defaultMessage="State" />,
      dataIndex: 'state',
      align: 'center',
      width: 180,
      hideInForm: true,
      render: (value: number, record: any) => {
        return formatterResults(value, record);
      },
      filters: [
        {
          text: '不通过',
          value: '3',
        },
        {
          text: '通过',
          value: '2',
        },
        {
          text: '正在编译',
          value: '1',
        },
        {
          text: '未编译',
          value: '0',
        },
      ],
      onFilter: (value, record) => record.state.toString().indexOf(value) === 0,
    },
    {
      title: (
        <FormattedMessage
          id="pages.resultsManager.integrationCase"
          defaultMessage="Integration Case"
        />
      ),
      hideInForm: true,
      align: 'center',
      width: 280,
      render: (record: any) => (
        <Space size="middle">
          <a onClick={() => linkToCaseInfo(record, 'integration')}>
            <Tooltip placement="topRight" title={'错误：' + record.integration_case_errornum}>
              <span style={{ color: 'red' }}>{record.integration_case_errornum}</span>
            </Tooltip>
            /
            <Tooltip placement="top" title={'已完成：' + record.integration_case_over}>
              <span style={{ color: 'green' }}>{record.integration_case_over}</span>
            </Tooltip>
            /
            <Tooltip placement="topLeft" title={'总数：' + record.integration_case_num}>
              <span>{record.integration_case_num}</span>
            </Tooltip>
          </a>
        </Space>
      ),
    },
    {
      title: <FormattedMessage id="pages.resultsManager.systemCase" defaultMessage="System Case" />,
      hideInForm: true,
      align: 'center',
      width: 280,
      render: (record: any) => (
        <Space size="middle">
          <a onClick={() => linkToCaseInfo(record, 'system')}>
            <Tooltip placement="topRight" title={'错误：' + record.system_case_errornum}>
              <span style={{ color: 'red' }}>{record.system_case_errornum}</span>
            </Tooltip>
            /
            <Tooltip placement="top" title={'已完成：' + record.system_case_over}>
              <span style={{ color: 'green' }}>{record.system_case_over}</span>
            </Tooltip>
            /
            <Tooltip placement="topLeft" title={'总数：' + record.system_case_num}>
              <span>{record.system_case_num}</span>
            </Tooltip>
          </a>
        </Space>
      ),
    },
    {
      title: <FormattedMessage id="pages.resultsManager.nextHashs" defaultMessage="Hash" />,
      dataIndex: 'next_Hashs',
      hideInForm: true,
      width: 120,
      render: (value: any) => {
        const tempList = value.split(':');
        return tempList.length > 1 ? tempList[1].substr(0, 10) : tempList[0].substr(0, 10);
      },
    },
  ];

  return (
    <>
      <Modal
        width={window.innerWidth * 0.8 + 'px'}
        footer={[
          <Button key="back" onClick={aftercloseModel}>
            关闭
          </Button>,
        ]}
        visible={isModalVisible}
        closable={false}
        afterClose={aftercloseModel}
      >
        <FileInfoBox
          title={infoTitle}
          tabList={tabList}
          activeTabKey={activeTabKey}
          contentList={contentList}
        />
      </Modal>
      <ProTable<API.ResultListItem>
        loading={loading}
        actionRef={actionRef}
        rowKey="solver_version"
        search={false}
        request={async () => {
          const msg = await results();
          return {
            data: msg.results,
            success: true,
          };
        }}
        pagination={{
          defaultCurrent: props.curPage,
          onChange: handlePageChange,
        }}
        columns={columns}
      />
    </>
  );
};

export default ResultIndex;
