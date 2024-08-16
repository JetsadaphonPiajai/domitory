import React, { useState } from 'react';
import { Input, Button, message, Space } from 'antd';
const { TextArea } = Input;

const Announcement: React.FC = () => {
  const [value, setValue] = useState('');
  const [messageApi, contextHolder] = message.useMessage();

  const success = () => {
    messageApi.open({
      type: 'success',
      content: 'This is a success message',
    });
  };

  return (
    <div style={{ padding: '20px' }}>
      {/* Header with underline */}
      <div
        style={{
          display: 'flex',
          justifyContent: 'center',
          marginBottom: '20px',
          position: 'relative',
        }}
      >
        <span
          style={{
            fontSize: '25px',
            position: 'relative',
            paddingBottom: '10px',
          }}
        >
          แจ้งข่าวสาร
        </span>
        <div
          style={{
            position: 'absolute',
            bottom: 0,
            left: 0,
            right: 0,
            borderBottom: '3px solid #000',
          }}
        />
      </div>

      {/* Title TextArea with label */}
      <div style={{ marginBottom: '24px' }}>
        <label style={{ display: 'block', fontSize: '18px', marginBottom: '8px' }}>Title</label>
        <TextArea
          placeholder="Enter title here"
          autoSize
          style={{ marginLeft: '20px', width: 'calc(100% - 20px)' }}
        />
      </div>

      {/* Announcement TextArea with label */}
      <div>
        <label style={{ display: 'block', fontSize: '18px', marginBottom: '8px' }}>Announcement</label>
        <TextArea
          value={value}
          onChange={(e) => setValue(e.target.value)}
          placeholder="Enter announcement here"
          autoSize={{ minRows: 3, maxRows: 10 }}
          style={{ marginLeft: '20px', width: 'calc(100% - 20px)' }}
        />
      </div>
      <>
        {contextHolder}
        <Space style={{ display: 'flex', justifyContent: 'center', marginTop: '20px' }}>
          <Button 
            onClick={success} 
            style={{ backgroundColor: '#1890ff', color: 'white' }}  // ปรับสไตล์ปุ่มตรงนี้
          >
            ยืนยัน
          </Button>
        </Space>
      </>
    </div>
  );
};

export default Announcement;
