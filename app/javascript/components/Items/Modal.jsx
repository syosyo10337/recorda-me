import React, { useState } from 'react';
import axios from 'axios';
import Button from "../Button";

const Modal = (
  {
    closeModal,
    title,
    selectedItem,
    alert,
    setAlert,
    fetchData,
  }
  ) => {
  const [inputValue, setInputValue] = useState("");

  const updateItem = () => {
    const csrfToken = document.querySelector('[name="csrf-token"]').content
    axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

    axios.patch(`/api/items/${selectedItem.id}`, {name: inputValue})
      .then(res => {
        setTimeout(() => closeModal(), 500)
        fetchData();
        setAlert({
          "isShown": true,
          "status": "success",
          "message": res.data
        });
      })
      .catch(e => {
        setAlert({
          "isShown": true,
          "status": "danger",
          "message": e.response.data
        })
        setInputValue("");
      })
      setTimeout(() => setAlert({...alert, "isShown": false}), 3000);
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
            autoFocus={true}
            id="item_name_input"
            className="form-control"
            value={inputValue}
            onChange={e => setInputValue(e.target.value)}
          />
        </div>
        <div className="text-end">
          <Button
            text="更新する"
            onClick={updateItem}
          />
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