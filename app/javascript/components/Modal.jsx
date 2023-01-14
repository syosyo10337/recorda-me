import React from 'react';

const Modal = ({closeModal, title, currentItem}) => {
  return (
    <div id="overlay">
      <div id="modalContent" class="col-10 col-md-6 col-xl-5">
        <div class="modal-header">
          <h1 class="text-center">{title}</h1>
        </div>
        <div class="modalMessage my-3">
          <h5>登録中の名前 : {currentItem.name}</h5>
          <input class="form-control" type="text" placeholder={currentItem.name} name="item[name]" id="item_name_input" />
        </div>
        <div class="text-end">
          <input type="submit" name="commit" value="更新する" class="btn btn-secondary me-1" />
          <a className="btn btn-outline-secondary" onClick={closeModal}>閉じる</a>
        </div>
      </div>
    </div>
  )
};


export default Modal;


//errorメッセージが出なくなっているよ