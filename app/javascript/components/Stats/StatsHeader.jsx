import React, { useState, useEffect } from 'react';
import axios from 'axios';
import StatsCard from "./StatsCard";

function StatsHeader() {
  const [data, setData] = useState({});
  const fetchData = async () => {
    const resp = await axios.get('/api/stats/accumulate_amounts');
    setData(resp.data);
  };
  useEffect(() => {
    fetchData();
  }, [])

  return (
    <div className="
      stats 
      row 
      justify-content-center 
      mb-3">
      <h3 className="
        text-start 
        pb-1 
        my-2 
        border-bottom 
        border-2">
        これまでの記録
      </h3>
      <StatsCard title={'いままでの累計記録時間'} data={data.total}/>
      <StatsCard title={'今月の記録時間'} data={data.monthly}/>
      <StatsCard title={'今週の記録時間'} data={data.weekly}/>
    </div>
  )
}

export default StatsHeader