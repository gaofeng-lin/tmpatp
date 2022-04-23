import React,{useState} from 'react';
import { Modal ,Button} from 'antd';
import FileInfoBox from '../FileInfoBox';



export default (props:any) => {
  const [isModalVisible, setIsModalVisible] = useState(props.visible);
  const handleCancel = () => {
    setIsModalVisible(false);
  };
  return (
    <>
      <Modal width={window.innerWidth*0.8 + 'px'} 
      footer={[<Button key="back" onClick={handleCancel}>
              关闭
            </Button>]}  visible={isModalVisible} closable={false} afterClose={props.afterClose}>
        <FileInfoBox 
            title={props.infoTitle} 
            tabList={props.tabList}
            activeTabKey={props.activeTabKey}
            contentList={props.contentList}
        />
      </Modal>
    </>
  );
};