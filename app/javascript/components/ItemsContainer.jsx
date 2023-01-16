import React, { useState, useEffect }from "react";
import ItemCard from "./ItemCard";
import Modal  from "./Modal";
import axios from "axios";

const ItemsContainer = () => {
  const [isShown, setIsShown] = useState(false);
  const toggleModal = () => setIsShown(prev => !prev);

  const [items, setItems] = useState([]);
  const fetch  = async () => {
    const resp = await axios.get('/api/items')
    setItems(resp.data);
  }
  useEffect(() => {
    fetch();
  }, [])
  
  const [currentItem, setCurrentItem] = useState({});

  return (
    <div className="text-start">
      <h1>記録中の活動項目一覧</h1>
      <div className="row mt-4">
        {items.map(item => {
          return (
            <ItemCard 
              key={item.id}
              item={item}
              openModal={toggleModal}
              setCurrentItem={setCurrentItem}
              />
          )
          })}
      </div>
      {isShown ? <Modal
                  closeModal={toggleModal}
                  title="項目名を編集する"
                  currentItem={currentItem}
                  fetch={fetch}/>
              : <></>}
    </div>
  )
};

export default ItemsContainer;