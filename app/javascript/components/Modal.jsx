import React, { useState } from 'react';
import Button from "./Button";

const Modal = ({closeModal, title, currentItem}) => {
  const [inputVaule, setInputVaule] = useState("新しい名前");
  
  return (
    <div id="overlay">
      <div id="modalContent" className="col-10 col-md-6 col-xl-5">
        <div className="modal-header">
          <h1 className="text-center">{title}</h1>
        </div>
        <div className="modalMessage my-3">
          <h5>登録中の名前 : {currentItem.name}</h5>
          <input 
            className="form-control" 
            type="text" 
            placeholder={inputVaule}
            name="item[name]" 
            id="item_name_input"
            onChange={e => setInputVaule(e.target.value)} 
          />
        </div>
        <div className="text-end">
          <Button text="更新する" />
          <Button 
            text="閉じる" className="btn-outline-secondary ms-1"
            onClick={closeModal} 
          />
        </div>
      </div>
    </div>
  )
};


export default Modal;


//errorメッセージが出なくなっているよ