import React from "react";

const Alert = ({alert}) => {
  return (
    <div id="alert_container" className={`alert alert-${alert.status} w-50`}>
      {alert.message}
    </div>
  )
}

export default Alert