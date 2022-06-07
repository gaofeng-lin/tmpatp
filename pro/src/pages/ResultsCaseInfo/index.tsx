import {
  applydownload,
  checkResultsDirExists,
  checkShouldDownload,
  getResults,
  restart,
  resultIntegrationCaseInfo,
  resultSystemCaseInfo,
} from '@/services/api/api';
import { createFromIconfontCN } from '@ant-design/icons';
import type { ActionType, ProColumns } from '@ant-design/pro-table';
import ProTable from '@ant-design/pro-table';
import { notification, PageHeader, Space, Tooltip } from 'antd';
import React, { useRef, useState } from 'react';
import { FormattedMessage, history, useLocation } from 'umi';
const IconFont = createFromIconfontCN({
  scriptUrl: '//at.alicdn.com/t/font_2678397_niqkd3j7udk.js',
});

export interface QueryType {
  type?: string;
  commit?: string;
  solver_version?: number;
  test_id?: number;
}

const valueEnum = {
  0: '未开始',
  2: '等待计算',
  5: '正在排队',
  6: '正在计算',
  7: '等待分析',
  8: '等待续算',
  9: '分析完毕',
  10: '等待取消',
  11: '已取消',
};

const ResultCaseInfo: React.FC = () => {
  const ref = useRef<ActionType>();
  const location = useLocation();
  const query: QueryType = location.query;
  const { type, commit, solver_version, test_id } = query;
  const [loading, setLoading] = useState(false);

  /**
   * 格式化秒
   * @param int  value 总秒数
   * @return string result 格式化后的字符串
   */
  const formatSeconds = (value: any) => {
    let theTime: number = parseInt(value); // 需要转换的时间秒
    let theTime1: number = 0; // 分
    let theTime2 = 0; // 小时
    if (theTime > 60) {
      theTime1 = parseInt(theTime / 60);
      theTime = parseInt(theTime % 60);
      if (theTime1 > 60) {
        theTime2 = parseInt(theTime1 / 60);
        theTime1 = parseInt(theTime1 % 60);
      }
    }
    let result: string;
    if (theTime1 > 0) {
      let timeValue = '';
      if (theTime1 < 10) timeValue = '0' + theTime1.toString();
      else timeValue = theTime1.toString();
      result = '' + timeValue;
    } else {
      result = '00';
    }
    if (theTime2 > 0) {
      let timeValue = '';
      if (theTime2 < 10) timeValue = '0' + theTime2.toString();
      else timeValue = theTime2.toString();
      result = '' + timeValue + ':' + result;
    } else {
      result = '00:' + result;
    }
    return result;
  };

  const checkIsErrorCase = (record: any) => {
    let error_ori = false,
      error_pre = false;
    if (
      record.result_evaluation_ori &&
      (record.result_evaluation_ori.includes('Error') ||
        record.result_evaluation_ori.includes('Terrible'))
    )
      error_ori = true;
    if (
      record.result_evaluation_pre &&
      (record.result_evaluation_pre.includes('Error') ||
        record.result_evaluation_pre.includes('Terrible'))
    )
      error_pre = true;
    return error_ori || error_pre;
  };

  const formatterWorkState = (val: number) => {
    return valueEnum[val];
  };

  const openNotification = () => {
    notification.open({
      message: `警告`,
      description: '算例结果文件夹不存在.',
      duration: 2,
    });
  };

  const openNotification2 = () => {
    notification.open({
      message: `错误`,
      description: '申请下载出错.',
      duration: 2,
    });
  };

  const openNotification3 = () => {
    notification.open({
      message: `提示`,
      description: '下载申请正在处理，请耐心等待.',
      duration: 2,
    });
  };

  const download = (filename: string) => {
    setLoading(true);
    getResults(filename).then(() => {
      setLoading(false);
    });
  };

  const fetchApplyDownload = (test_case_id: number) => {
    setLoading(true);
    applydownload({ test_case_id: test_case_id, type: type }).then((data: any) => {
      setLoading(false);
      if (data?.status == 500) {
        openNotification2();
      } else {
        ref?.current?.reload();
      }
    });
  };

  const fetchResults = (case_name: any) => {
    setLoading(true);
    let currentType = type;
    const tmpType = currentType.charAt(0).toUpperCase() + currentType.slice(1);
    const filename = 'PHengLEI_' + tmpType + '__' + solver_version + '_' + case_name + '.zip';
    checkResultsDirExists({ filename: filename }).then((data: any) => {
      setLoading(false);
      if (data.status == 404) {
        openNotification();
      } else {
        download(filename);
      }
    });
  };

  const handleApplyDownload = (record: any) => {
    fetchApplyDownload(record.test_case_id);
  };
  const handleDownloadResults = (record: any) => {
    fetchResults(record.case_name);
  };

  const fetchCheckDownload = (record: any) => {
    setLoading(true);
    checkShouldDownload({ test_case_id: record.test_case_id, type: type }).then((data: any) => {
      setLoading(false);
      if (data[0]?.state == 2) {
        handleDownloadResults(record);
      } else {
        openNotification3();
      }
      ref?.current?.reload();
    });
  };

  const handleCheckDownload = (record: any) => {
    fetchCheckDownload(record);
  };

  const fetchReStart = (paramData: any) => {
    setLoading(true);
    restart(paramData).then((data: any) => {
      setLoading(false);
      if (data.status == 200) {
        ref?.current?.reload();
      }
    });
  };
  const handleReStart = (record: any) => {
    let paramData;
    if (checkIsErrorCase(record)) {
      const test_case_id = record.test_case_id;
      const is_error_case = true;
      paramData = {
        test_case_id: test_case_id,
        is_error_case: is_error_case,
        test_id: test_id,
        type: type,
      };
    } else {
      const test_case_id = record.test_case_id;
      paramData = { test_case_id: test_case_id, test_id: test_id, type: type };
    }

    fetchReStart(paramData);
  };

  const columns: ProColumns<API.ResultCaseInfoListItem>[] = [
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.id" defaultMessage="Case ID" />,
      dataIndex: 'case_id',
      width: 90,
      align: 'center',
      sorter: (a: { case_id: number }, b: { case_id: number }) => a.case_id - b.case_id,
      fixed: 'left',
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.casename" defaultMessage="Case Name" />,
      dataIndex: 'case_name',
      ellipsis: {
        showTitle: false,
      },
      sorter: (a: { case_name: number }, b: { case_name: number }) =>
        a.case_name < b.case_name ? -1 : 1,
      defaultSortOrder: 'ascend',
      render: (value: any) => (
        <Tooltip placement="topLeft" title={value}>
          {value}
        </Tooltip>
      ),
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.endtime" defaultMessage="End Time" />,
      dataIndex: 'end_time',
      width: 200,
      valueType: 'dateTime',
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.runtime" defaultMessage="Run Time" />,
      dataIndex: 'run_time',
      width: 140,
      render: (value: any) => {
        return formatSeconds(value);
      },
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.workstate" defaultMessage="Work State" />,
      dataIndex: 'is_worked',
      align: 'center',
      width: 120,
      render: (value: any) => {
        return formatterWorkState(value);
      },
      filters: [
        {
          text: '未开始',
          value: '0',
        },
        {
          text: '等待计算',
          value: '2',
        },
        {
          text: '正在排队',
          value: '5',
        },
        {
          text: '正在计算',
          value: '6',
        },
        {
          text: '等待分析',
          value: '7',
        },
        {
          text: '等待续算',
          value: '8',
        },
        {
          text: '分析完毕',
          value: '9',
        },
        {
          text: '等待取消',
          value: '10',
        },
        {
          text: '已取消',
          value: '11',
        },
      ],
      onFilter: (value: any, record: { is_worked: any }) =>
        record.is_worked.toString().indexOf(value) === 0,
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.results" defaultMessage="Results" />,
      align: 'center',
      colSpan: 2,
      children: [
        {
          dataIndex: 'result_evaluation_ori',
          width: 140,
          title: 'ori',
          filters: [{ text: '异常', value: '异常' }],
          onFilter: (value: any, record: any) => {
            return record.result_evaluation_ori == null
              ? true
              : record.result_evaluation_ori.toString().indexOf('OK') != 0;
          },
          render: (value: any) => {
            return value?.indexOf('Error') != -1 ? (
              <span style={{ color: 'red' }}>{value}</span>
            ) : value == 'Terrible' ? (
              <span style={{ color: '#1890ff' }}>{value}</span>
            ) : (
              <span>{value}</span>
            );
          },
        },
        {
          dataIndex: 'result_evaluation_pre',
          width: 140,
          title: 'pre',
          filters: [{ text: '异常', value: '异常' }],
          onFilter: (value: any, record: any) => {
            return record.result_evaluation_ori == null
              ? true
              : record.result_evaluation_ori.toString().indexOf('OK') != 0;
          },
          render: (value: any) => {
            return value?.indexOf('Error') != -1 ? (
              <span style={{ color: 'red' }}>{value}</span>
            ) : value == 'Terrible' ? (
              <span style={{ color: '#1890ff' }}>{value}</span>
            ) : (
              <span>{value}</span>
            );
          },
        },
      ],
    },
    {
      title: <FormattedMessage id="pages.resultsCaseInfo.actions" defaultMessage="Actions" />,
      align: 'center',
      width: 160,
      render: (record: any) => {
        let button = null;

        if (record.state == 0) {
          button = (
            <Tooltip placement="top" title="申请下载">
              <a onClick={() => handleApplyDownload(record)}>
                <IconFont style={{ fontSize: 18 }} type="icon-cloud-download" />
              </a>
            </Tooltip>
          );
        } else if (record.state == 1) {
          button = (
            <Tooltip placement="top" title="正在处理">
              <a onClick={() => handleCheckDownload(record)}>
                <IconFont style={{ fontSize: 18 }} type="icon-cloud-sync-green" />
              </a>
            </Tooltip>
          );
        } else if (record.state == 2) {
          button = (
            <Tooltip placement="top" title="下载结果">
              <a onClick={() => handleDownloadResults(record)}>
                <IconFont style={{ fontSize: 16 }} type="icon-direction-down-circle-red" />
              </a>
            </Tooltip>
          );
        }
        return (
          <Space size="middle">
            <Tooltip placement="top" title="重算">
              <a onClick={() => handleReStart(record)}>
                <IconFont style={{ fontSize: 16 }} type="icon-switch" />
              </a>
            </Tooltip>
            {button}
          </Space>
        );
      },
    },
  ];

  return (
    <>
      <PageHeader
        className="site-page-header"
        onBack={() => history.goBack()}
        title={'版本：' + solver_version}
        subTitle={commit}
      />
      <ProTable<API.ResultCaseInfoListItem>
        actionRef={ref}
        loading={loading}
        params={{ test_id: test_id }}
        rowKey="case_id"
        search={false}
        request={async (params) => {
          const msg =
            type == 'system'
              ? await resultSystemCaseInfo(params)
              : await resultIntegrationCaseInfo(params);
          return {
            data: msg.results,
            success: true,
          };
        }}
        columns={columns}
      />
    </>
  );
};

export default ResultCaseInfo;
