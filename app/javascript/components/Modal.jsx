import React, { useState } from 'react';
import axios from 'axios';
import Button from "./Button";

const Modal = (
  {
    closeModal,
    title,
    selectedItem,
    setIsAlerted,
    fetch,
  }
  ) => {
  const [inputVaule, setInputVaule] = useState("");

  const updateItem = async () => {
    const csrfToken = document.querySelector('[name="csrf-token"]').content
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

    await axios.patch(`/api/items/${selectedItem.id}`, {name: inputVaule});
    closeModal();
    setIsAlerted(true);
    setTimeout(() => setIsAlerted(false), 2000)
    fetch();
  };


  return (
    <div id="overlay">
      <div id="modalContent" className="col-10 col-md-6 col-xl-5">
        <div className="modal-header">
          <h1 className="text-center">{title}</h1>
        </div>
        <div className="modalMessage my-3">
          <h5>登録中の名前 : {selectedItem.name}</h5>
          <input 
            type="text" 
            placeholder="新しい名前"
            id="item_name_input"
            className="form-control"
            value={inputVaule}
            onChange={e => setInputVaule(e.target.value)} 
          />
        </div>
        <div className="text-end">
          <Button
            text="更新する"
            onClick={updateItem} />
          <Button
            text="閉じる"
            className="btn-outline-secondary ms-1"
            onClick={closeModal} 
          />
        </div>
      </div>
    </div>
  )
};


export default Modal;


//errorメッセージが出なくなっているよ