import React from 'react';

const Modal = ({closeModal, title, currentName}) => {
  return (
    <div id="overlay">
      <div id="modalContent" class="col-10 col-md-6">
        <div class="modal-header">
          <h1 class="text-center">{title}</h1>
        </div>
        <div class="modal-message my-3">
          <input class="form-control d-inline" type="text" value={currentName} name="item[name]" id="item_name" />
        </div>
        <div class="text-end">
          <input type="submit" name="commit" value="更新する" class="btn btn-secondary" />
          <a className="btn btn-outline-secondary" onClick={closeModal}>閉じる</a>
        </div>
      </div>
    </div>
  )
};


export default Modal;


//errorメッセージが出なくなっているよ