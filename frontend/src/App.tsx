import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Sidebar from './Components/Sidebar';
import Repairing from './Page/Repairing/index';
import Enteringandexitingdorm from './Page/Enteringandexitingdorm/index';
import RequestDelayingPayment from './Page/RequestDelayingPayment/index';
import ResigningForm from './Page/ResigningForm/index';
import Announcement from './Page/Announcement/index';
import PaymentConfirmation from './Page/PaymentConfirmation/index'; // เปลี่ยนชื่อเป็น PaymentConfirmation

const App: React.FC = () => {
  return (
    <BrowserRouter>
      <Sidebar>
        <Routes>
          <Route path='/' element={<Announcement />} />
          <Route path='/Repairing' element={<Repairing />} />
          <Route path='/Enteringandexitingdorm' element={<Enteringandexitingdorm />} />
          <Route path='/ResigningForm' element={<ResigningForm />} />
          <Route path='/Announcement' element={<Announcement />} />
          <Route path='/RequestDelayingPayment' element={<RequestDelayingPayment />} />
          <Route path='/PaymentConfirmation' element={<PaymentConfirmation />} />
        </Routes>
      </Sidebar>
    </BrowserRouter>
  );
};

export default App;
