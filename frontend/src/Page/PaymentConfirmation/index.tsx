import React, { useState } from 'react';
import { Table, Button, Modal } from 'antd';
import { ColumnsType } from 'antd/es/table';
import { FileImageOutlined } from '@ant-design/icons';
import './index.css'; // รวมสไตล์ของคุณ

interface PaymentData {
  key: string;
  time: string;
  amount: number;
  slip: string; // ใช้เป็น URL ของสลิป
}

const data: PaymentData[] = [
  {
    key: '1',
    time: '10:00 AM',
    amount: 1500,
    slip: '/path/to/slip1.jpg', // เส้นทางหรือ URL ของสลิป
  },
  {
    key: '2',
    time: '11:30 AM',
    amount: 2000,
    slip: '/path/to/slip2.jpg', // เส้นทางหรือ URL ของสลิป
  },
  // เพิ่มข้อมูลเพิ่มเติมที่นี่
];

const PaymentConfirmation: React.FC = () => {
  const [visible, setVisible] = useState<boolean>(false);
  const [currentImage, setCurrentImage] = useState<string>('');
  const [selectedKey, setSelectedKey] = useState<string>('');

  const handleViewSlip = (url: string) => {
    if (url) {
      setCurrentImage(url);
      setVisible(true);
    } else {
      console.error('URL ของสลิปไม่ถูกต้อง');
    }
  };

  const handleCancel = () => {
    setVisible(false);
    setCurrentImage('');
  };

  const handleConfirm = (key: string) => {
    setSelectedKey(key);
    // ทำการยืนยันที่นี่
    console.log(`ยืนยันการชำระเงินสำหรับรายการ ${key}`);
  };

  const columns: ColumnsType<PaymentData> = [
    {
      title: 'เวลา',
      dataIndex: 'time',
      key: 'time',
    },
    {
      title: 'จำนวนเงิน',
      dataIndex: 'amount',
      key: 'amount',
      render: (text) => `${text} บาท`,
    },
    {
      title: 'สลิป',
      dataIndex: 'slip',
      key: 'slip',
      render: (text) => (
        <Button
          icon={<FileImageOutlined />}
          onClick={() => handleViewSlip(text)}
        >
          ดูภาพ
        </Button>
      ),
    },
    {
      title: 'การดำเนินการ',
      key: 'action',
      render: (_, record) => (
        <Button
          type="primary"
          onClick={() => handleConfirm(record.key)}
        >
          ยืนยัน
        </Button>
      ),
    },
  ];

  return (
    <div style={{ padding: '20px' }}>
      {/* Header with underline */}
      <div
        style={{
          display: 'flex',
          justifyContent: 'center',
          marginBottom: '20px', // ระยะห่างด้านล่างของหัวข้อ
          position: 'relative',
        }}
      >
        <span
          style={{
            fontSize: '25px',
            fontWeight: 'bold', // เพิ่มความหนาของฟอนต์
            position: 'relative',
            paddingBottom: '10px', // ระยะห่างระหว่างข้อความและขีดล่าง
          }}
        >
          การยืนยันการชำระเงิน
        </span>
        <div
          style={{
            position: 'absolute',
            bottom: 0,
            left: 0,
            right: 0,
            borderBottom: '3px solid #000', // ขีดล่างหนา 3px
          }}
        />
      </div>

      <Table
        dataSource={data}
        columns={columns}
        pagination={false}
        bordered
        style={{ marginBottom: '20px' }} // เพิ่มระยะห่างด้านล่างของตาราง
      />
      <Modal
        visible={visible}
        footer={null}
        onCancel={handleCancel}
        width={600}
      >
        <img
          alt="Slip"
          style={{ width: '100%', height: 'auto' }}
          src={currentImage}
        />
      </Modal>
    </div>
  );
};

export default PaymentConfirmation;
