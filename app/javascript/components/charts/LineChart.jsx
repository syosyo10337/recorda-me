import React,{ useEffect, useState } from "react";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import { Line } from 'react-chartjs-2';
import axios from 'axios';
import { ITEM_COLORS, allLineOptions } from './chartConfig';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
);

function LineChart() {
  const [data, setData] = useState({
    "months": [],
    "contents": []
  });
  // FIXME: const datasets等の変数初期化とfectchData()の非同期処理の制御を理解しきれていない
  const fetchData = async () => {
    const resp = await axios.get('/api/stats/all_lines')
    setData({
      "months": resp.data.timeline,
      "contents": resp.data.content
    });
  };
  useEffect(() => {
    fetchData()
  }, []);

  const datasets = data.contents.map((ele, i) => (
      {
        label: ele.name,
        data: Object.values(ele.data),
        borderColor: ITEM_COLORS[i],
        backgroundColor: ITEM_COLORS[i],
        tension: 0.3,
      }
    ))
  const chartData = {
    labels: data.months,
    datasets
  };

  return <Line data={chartData}  options={allLineOptions} height={400}/>;
}

export default LineChart;