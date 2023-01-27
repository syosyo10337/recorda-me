import React, { useState } from "react";
import PieChart from "../charts/PieChart";
import LineChart from "../charts/LineChart";

const Stats = () => {
  const [toggle, switchToggle] = useState({
    "switch" : 1,
    "pieStatus": "active",
    "lineStatus": ""
  });
  const activatePie = () => {
    switchToggle({
      "switch" : 1,
      "pieStatus": "active",
      "lineStatus": ""
    })
  };
  const activateLine = () => {
    switchToggle({
      "switch" : 0,
      "pieStatus": "",
      "lineStatus": "active"
    })
  };
  return (
    <div className="card text-center">
      <div className="card-header">
        <ul className="nav nav-tabs card-header-tabs">
          <li className="nav-item">
            <button
              onClick={activatePie}
              className={`nav-link ${toggle.pieStatus}`}>
              比率を見る
              </button>
          </li>
          <li className="nav-item">
            <button
              onClick={activateLine}
              className={`nav-link ${toggle.lineStatus}`}>
              遷移を見る
              </button>
          </li>
        </ul>
      </div>
      <div className="card-body">
        {toggle.switch ? <PieChart /> : <LineChart />}
      </div>
    </div>
  )
};

export default Stats