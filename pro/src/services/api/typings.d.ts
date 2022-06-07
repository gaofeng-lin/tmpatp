// @ts-ignore
/* eslint-disable */

declare namespace API {
  type PageParams = {
    current?: number;
    pageSize?: number;
  };

  type ResultCaseInfoListItem = {
    test_case_id?: number;
    case_id?: number;
    test_id?: number;
    project_dirpath?: string;
    case_name?: string;
    run_time?: string;
    end_time?: string;
    is_worked?: number;
    state?: number;
    result_evaluation_ori?: string;
    result_evaluation_pre?: string;
  };

  type ResultCaseInfoList = {
    data?: ResultCaseInfoListItem[];
    success?: boolean;
  };

  type ResultListItem = {
    idsolver_info?: number;
    solver_version?: number;
    update_author?: string;
    gitProject?: string;
    branchName?: string;
    svnDate?: string;
    update_Log?: string;
    next_Hashs?: string;
    test_id?: number;
    system_case_errornum?: number;
    system_case_over?: number;
    system_case_num?: number;
    integration_case_errornum?: number;
    integration_case_over?: number;
    integration_case_num?: number;
    state?: number;
  };

  type ResultList = {
    data?: ResultListItem[];
    success?: boolean;
  };

  type CaseListItem = {
    case_id?: number;
    user_name?: string;
    case_name?: string;
    add_time?: string;
    parameter?: string;
    configfile?: string;
    reference_mach_number?: string;
    attackd?: string;
    gridfile?: string;
    iviscous?: string;
    maxsimustep?: number;
    solver_name?: string;
    parameterFile?: string;
    visible?: number;
    caption?: string;
    evaluation?: string;
    priority?: number;
    sort?: number;
    tags?: string;
    process_num?: number;
  };

  type CaseList = {
    data?: CaseListItem[];
    success?: boolean;
  };

  type CaseInfoItem = {
    solver_version?: number;
    result_evaluation_ori?: string;
    result_evaluation_pre?: string;
    run_time?: string;
  };

  type CaseInfo = {
    data?: CaseInfoItem[];
    success?: boolean;
  };

  type JobListItem = {
    test_case_id?: number;
    solver_version?: number;
    case_name?: string;
    end_time?: string;
  };

  type JobList = {
    data?: JobListItem[];
    success?: boolean;
  };

  type NoticeIconList = {
    data?: NoticeIconItem[];
    /** 列表的内容总数 */
    total?: number;
    success?: boolean;
  };

  type NoticeIconItemType = 'notification' | 'message' | 'event';

  type NoticeIconItem = {
    id?: string;
    extra?: string;
    key?: string;
    read?: boolean;
    avatar?: string;
    title?: string;
    status?: string;
    datetime?: string;
    description?: string;
    type?: NoticeIconItemType;
  };
}
