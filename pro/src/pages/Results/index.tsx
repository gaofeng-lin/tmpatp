import { PageContainer } from '@ant-design/pro-layout';
import React from 'react';
import { request } from 'umi';
import { localStorageGet } from './components/Storage';
import ResultIndex from './components/TableAjax';

const Results: React.FC = () => {
  const curPage = localStorageGet('resultsTablePage') || 1;
  let branchFilters: any = [];
  request('/api/search', {
    method: 'get',
  }).then((data: any) => {
    let branchArr: any = [];
    data.results.map((item: any) => {
      branchArr.push(item.branchName);
    });
    [...new Set(branchArr)].map((item: any) => {
      branchFilters.push({ text: item, value: item });
    });
  });
  console.log(branchFilters[0])
  return (
    <PageContainer>
      <ResultIndex branchFilters={branchFilters} curPage={curPage} />
    </PageContainer>
  );
};

export default Results;
