import React,{ useEffect, useState } from "react";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';
import axios from 'axios';

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
ChartJS.register(ArcElement, Tooltip, Legend);

function PieChart() {
  const[data, setData] = useState([]);
  const fetch = async () => {
    const resp = await axios.get('/api/charts/all_pies')
    setData(resp.data)
  }
  useEffect(() => {
    fetch()
  }, [])

  const chartData = {
    labels: data.map(ele => ele[0]),
    datasets: [
      {
        label: data.map(ele => ele[0]),
        data: data.map(ele => ele[1]),
        backgroundColor: ITEM_COLORS,
      }
    ],
  };
  const options = {
    plugins: {
      tooltip: {
        callbacks: {
          label: context => `${context.label}: ${context.parsed}時間`
        }
      }
    },
    maintainAspectRatio: false
  }

  return (
    <Pie data={chartData} options={options} height={300}/>
  )
}

export default PieChart;
