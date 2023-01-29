import React from 'react';

const Button = ({
  className = "btn-secondary", 
  text = "ボタン",
  onClick
}) => {
  return (
    <button 
      className={`btn ${className}`}
      onClick={onClick}>
      {text}
    </button>
  )
};

export default Button