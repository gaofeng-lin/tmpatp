// @ts-ignore
/* eslint-disable */
import { request } from 'umi';

/** 获取编译测试列表 GET /api/search */
export async function results(params = {}) {
  return request<{ results: API.ResultList }>('/api/search', {
    method: 'GET',
    params,
  });
}

/** 获取编译测试中版本详情 GET /api/searchSystemCaseInfo */
export async function resultSystemCaseInfo(params = {}) {
  return request<{ results: API.ResultList }>('/api/searchSystemCaseInfo', {
    method: 'GET',
    params,
  });
}

export async function resultIntegrationCaseInfo(params = {}) {
  return request<{ results: API.ResultList }>('/api/searchIntegrationCaseInfo', {
    method: 'GET',
    params,
  });
}

/** 申请下载文件 GET /api/applydownload */
export async function applydownload(params = {}) {
  return request('/api/applydownload', {
    method: 'GET',
    params,
  });
}

/** 检测是否可以下载 GET /api/checkShouldDownload */
export async function checkShouldDownload(params = {}) {
  return request('/api/checkShouldDownload', {
    method: 'GET',
    params,
  });
}

/** 检测结果文件是否存在 GET /api/checkResultsDirExists */
export async function checkResultsDirExists(params = {}) {
  return request('/api/checkResultsDirExists', {
    method: 'GET',
    params,
  });
}

/** 重算作业 GET /api/checkResultsDirExists */
export async function restart(params = {}) {
  return request('/api/restart', {
    method: 'post',
    data: { ...params },
  });
}

/** 获取文件流 GET /api/getLoadFile */
export async function getLoadFile(params = {}) {
  return request('/api/getLoadFile', {
    method: 'GET',
    params,
  });
}

/** 获取算例列表 GET /api/searchCases */
export async function cases(params = {}) {
  return request<{ results: API.CaseList }>('/api/searchCases', {
    method: 'GET',
    params,
  });
}

/** 获取单个算例详情 GET /api/searchCaseByID */
export async function caseinfo(params = {}) {
  return request<{ results: API.CaseList }>('/api/searchCaseByID', {
    method: 'GET',
    params,
  });
}

/** 获取正在计算的作业列表 GET /api/getRunningJobs */
export async function getRunningJobs(params = {}) {
  return request<{ results: API.JobList }>('/api/getRunningJobs', {
    method: 'GET',
    params,
  });
}

/** 停止正在计算的作业 GET /api/cancelJobs */
export async function cancelJobs(params = {}) {
  return request('/api/cancelJobs', {
    method: 'post',
    data: { ...params },
  });
}

/** 获取结果文件 GET /api/getResults */
export async function getResults(filename = '') {
  const a = document.createElement('a');
  a.href = '/api/getResults?filename=' + filename;
  a.download = filename;
  a.click();
  a.remove();
}


export async function getTestParam(params = {}) {
  return request('/api/testparam', {
    method: 'GET',
    params,
  });
}


export async function getTestProduct(params = {}) {
  return request('/api/testproduct', {
    method: 'GET',
    params,
  });
}

export async function sendProductInfo(params = {}) {
  console.log({...params})
  return request('/api/testproductinfo', {
    method: 'post',
    data: {...params},
  })
}

export async function sendEditProduct(params = {}) {
  console.log({...params})
  return request('/api/sendeditproduct', {
    method: 'post',
    data: {...params},
  })
}
