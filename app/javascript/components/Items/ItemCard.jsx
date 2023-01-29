import React from "react";
import Button from "../Button";

const ItemCard = ({item, openModal, setSelectedItem, itemNumber}) => {
  return (
    <div className="col-md-3">
      <div className={`card my-1 item-bg-${itemNumber}`}>
        <div className="card-body">
          <h5 className="card-title">{item.name}</h5>
          <Button
            text="名前を変更"
            className="btn-sm btn-secondary"
            onClick={() => {
              openModal(), setSelectedItem(item)
              }}/>
          <a
            href={`/items/${item.id}`}
            className="badge text-reset ms-1 text-wrap">
            記録を見る
          </a>
        </div>
      </div>
  </div>
  )
};

export default ItemCard;