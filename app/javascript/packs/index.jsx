import React from 'react'
import ReactDOM from 'react-dom/client'
import ItemContainer from '../components/ItemsContainer'

const App = () => {
  return  <ItemContainer />; 
}

const root = ReactDOM.createRoot(document.getElementById('app'));

root.render(
  <App />,
);