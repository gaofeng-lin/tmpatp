import React, { useState } from 'react';
import { Card } from 'antd';


const tabList = [
  {
    key: 'tab1',
    tab: 'tab1',
  },
  {
    key: 'tab2',
    tab: 'tab2',
  },
];

const contentList = {
  tab1: <p>content1</p>,
  tab2: <p>content2</p>,
};

export default (props:any) => {
  
  const [activeTabKey, setActiveTabKey] = useState(props.activeTabKey);

  const onMyTabChange = (key:any) => {
    setActiveTabKey(key);
  };

  return (
    <>
      <Card
        style={{ width: '100%' }}
        title={props.title}
        tabList={props.tabList}
        onTabChange={key => {
          onMyTabChange(key);
        }}
      >
        {props.contentList[activeTabKey]}
      </Card>
  </>
  );
};

