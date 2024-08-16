import React from 'react'
import { Col, Row, Card, Statistic, Table } from "antd";
import {
  LineOutlined,
  BorderOutlined,
  AuditOutlined,
  UserOutlined,
  PieChartOutlined,
  StockOutlined,
} from "@ant-design/icons";
import type { ColumnsType } from "antd/es/table";
import "./index.css";
function Detail() {
  return (
    <div>
      <>
      <div className='title-1-flex'>
        <div className='text-1'>แจ้งซ่อม</div>
        <div className='status-text'>สถานะ</div>
        <div className='status-textbox'>รอดำเนินการ</div>
      </div>
      <br />
      <div className="full-width-line"></div>
      <br />
      <div className = 'title-2-flex'>
      <div className='name-text'>ผู้รับบริการ</div>
          <div className='name-text'>B191563</div>
          <div className='name-text'>มนัสเต</div>
          <div className='name-text'>สวัสดิกะ</div>
      </div>
      <div className = 'title-2-flex'>
          <div className='name-text'>อาคาร</div>
          <div className='name-text'>4</div>
          <div className='name-text'>ห้อง</div>
          <div className='name-text'>414A</div>
      </div>
    </>
    </div>
  )
}

export default Detail