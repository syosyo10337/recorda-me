import React from 'react';
import ReactDOM from 'react-dom/client';
import Items from '../components/pages/Items';
import "../stylesheets/items";


const App = () => {
  return  <Items />
}

const root = ReactDOM.createRoot(document.getElementById('app'));

root.render(
  <App />
);