import React from "react";
import Button from "./Button";

const ItemCard = ({item, openModal, setCurrentItem, itemNumber}) => {
  return (
    <div className="col-md-3">
      <div className={`card my-1 item-bg-${itemNumber}`}>
        <div className="card-body">
          <h5 className="card-title">{item.name}</h5>
          <Button
            text="名前を変更"
            className="btn-sm btn-secondary"
            onClick={() => {
              openModal(), setCurrentItem(item)
              }}/>
        </div>
      </div>
  </div>
  )
};

export default ItemCard;