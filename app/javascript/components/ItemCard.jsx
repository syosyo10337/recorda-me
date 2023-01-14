import React from "react";
import Button from "./Button";

const ItemCard = ({item, openModal, setCurrentItem}) => {
  return (
    <div className="col-md-3">
      <div className="card my-1 item-bg-<%= item_num(item) %>">
        <div className="card-body">
          <h5 className="card-title" id="item-<%= item_num(item) %>">{item.name}</h5>
          <Button 
            text="編集する"
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


         //erbの部分
//<%= link_to item.name, item_path(item), class:'text-dark'%>
//<% link_to "編集する", edit_item_path(item), class: "btn btn-secondary btn-sm", id: "edit-item-#{item_num(item)}" %>
