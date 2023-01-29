import React, { useState } from 'react';
import axios from 'axios';
import StatsCard from "./StatsCard";

const StatsHeader = () => {
  // TODO: apiを設計して、受け取ったデータを各StatsCardに渡す
  // <%= @items.sum('logs.amount / 60') %>
  // <%= @items.where('logs.created_at > ?', Time.zone.now.beginning_of_month).sum('amount / 60') %>
  // <%= @items.where('logs.created_at > ?', Time.zone.now.beginning_of_week).sum('amount / 60')%>

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
      <StatsCard title={'いままでの累計記録時間'}/>
      <StatsCard title={'今月の記録時間'}/>
      <StatsCard title={'今週の記録時間'}/>
    </div>
  )
}

export default StatsHeader