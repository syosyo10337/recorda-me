import React, { useState }from "react";
import ItemCard from "./ItemCard";
import Modal  from "./Modal";


const ItemsContainer = () => {
  const [isShown, setIsShown] = useState(false);
  const openModal = () => setIsShown(true);
  const closeModal = () => setIsShown(false);

  return (
    <div className="text-start">
      <h1>記録中の活動項目一覧</h1>
      
      <div className="row mt-4">
        <ItemCard openModal={openModal}/>
        <ItemCard openModal={openModal}/>
        <ItemCard openModal={openModal}/>
        <ItemCard openModal={openModal}/>
        <ItemCard openModal={openModal}/>
        {isShown ? <Modal 
                      closeModal={closeModal}
                      title={"項目名を編集する"}
                      currentName={"ピーエイチピー"}/> : <></>}
      </div>
    </div>
  )
};

export default ItemsContainer;