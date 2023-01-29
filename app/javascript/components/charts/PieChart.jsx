import React, { useEffect, useState } from "react";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";
import { Pie } from "react-chartjs-2";
import axios from "axios";
import { ITEM_COLORS, allPieOptions } from "./chartConfig"

ChartJS.register(ArcElement, Tooltip, Legend);

function PieChart() {
  const [data, setData] = useState([]);
  const fetchData = async () => {
    const resp = await axios.get("/api/charts/all_pies");
    setData(resp.data);
  };
  useEffect(() => {
    fetchData();
  }, []);

  const chartData = {
    labels: data.map(ele => ele[0]),
    datasets: [
      {
        label: data.map(ele => ele[0]),
        data: data.map(ele => ele[1]),
        backgroundColor: ITEM_COLORS,
      },
    ],
  };

  return <Pie data={chartData} options={allPieOptions} height={400} />;
}

export default PieChart;
