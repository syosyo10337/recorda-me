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

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
);
// TODO: アプリ共通のcolorThemeなので、一箇所で管理できるようにする
const ITEM_COLORS = [
  '#D896AD',
  '#ECA2A3',
  '#F1B996',
  '#F6D699',
  '#E3DE9A',
  '#A6D29A',
  '#93C7B7',
  '#92BFC7',
  '#90B0CA',
  '#B5A4C7',
  '#B5A4C7',
  '#C59DBB',
]

function LineChart() {
  const [data, setData] = useState({
    "months": [],
    "contents": []
  });
  // FIXME: const datasets等の変数初期化とfectchData()の非同期的処理の制御を理解しきれていない。(順序の話)
  const fetchData = async () => {
    const resp = await axios.get('/api/charts/all_lines')
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

  const options = {
    scales: {
      y: {
        ticks: {
            callback: (value) => value + '時間'
          }
      }
    },
    plugins: {
      tooltip: {
        callbacks: {
          label: (context) => {
            return `${context.dataset.label}: ${context.raw}時間`
          },
          title: () => "",
        },
      },
    },
    maintainAspectRatio: false,
  };


  return <Line data={chartData}  options={options} height={400}/>;
}
export default LineChart;