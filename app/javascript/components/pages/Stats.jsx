import React from "react";
import Pie from "../charts/Pie";

const Stats = () => {
  return (
    <div className="card text-center">
      <div className="card-header">
        <ul className="nav nav-tabs card-header-tabs">
          <li className="nav-item">
            <a href="#" className="nav-link active">比率を見る</a>
          </li>
          <li className="nav-item">
            <a href="#" className="nav-link">遷移を見る</a>
          </li>
        </ul>
      </div>
      <div className="card-body">
        <Pie />
        {/* <%= pie_chart charts_all_pies_path, suffix: "時間" %> */}
      </div>
    </div>
  )
};

export default Stats