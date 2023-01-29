import React, { useState, useEffect }from "react";
import axios from "axios";
import ItemCard from "./ItemCard";
import Modal  from "./Modal";
import Alert from "./Alert";

const ItemsContainer = () => {
  const [isModalShown, setIsModalShown] = useState(false);
  const toggleModal = () => setIsModalShown(prev => !prev);

  const [items, setItems] = useState([]);
  const fetchData  = async () => {
    const resp = await axios.get('/api/items')
    setItems(resp.data);
  }
  useEffect(() => {
    fetchData();
  }, [])
  
  const [selectedItem, setSelectedItem] = useState({});

  const [alert, setAlert] = useState({
    "isShown": false,
    "status": "success",
    "message": "名前を更新しました。"
  });

  return (
    <>
    {alert.isShown ? <Alert alert={alert} /> : <></>}
    <div className="text-start">
      <h1>記録中の活動項目一覧</h1>
      <div className="row mt-4">
        {items.map((item, index) => {
          return (
            <ItemCard 
              key={item.id}
              item={item}
              itemNumber={index + 1}
              openModal={toggleModal}
              setSelectedItem={setSelectedItem}
              />
          )
          })}
      </div>
      {isModalShown ? <Modal
                  closeModal={toggleModal}
                  title="項目名を編集する"
                  selectedItem={selectedItem}
                  alert={alert}
                  setAlert={setAlert}
                  fetchData={fetchData}/> : <></>}
    </div>
    </>
  )
};

export default ItemsContainer;