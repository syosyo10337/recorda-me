import React from 'react';

const StatsCard = ({title, data}) => {
  // TODO: inline-styleに依存しない書き方に変える
  const CardWidth = {
    width: `18rem`
  }

  return (
    <div className="card m-1" style={CardWidth}>
      <div className="card-body">
        <h5 className="card-title">
          {title}
        </h5>
        <p className="card-text">
          <strong>{data}</strong>時間
        </p>
      </div>
    </div>
  )
}

export default StatsCard