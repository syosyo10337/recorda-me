import React from 'react';
import ReactDOM from 'react-dom/client';
import Items from '../components/pages/Items';
import "../stylesheets/application.scss";

const root = ReactDOM.createRoot(document.getElementById('app'));

root.render(
  <Items />
);