import React from 'react';
import ReactDOM from 'react-dom/client';
import "../stylesheets/application.scss";
import Stats from "../components/pages/Stats";

const root = ReactDOM.createRoot(document.getElementById('app'));

root.render(
  <Stats />
);