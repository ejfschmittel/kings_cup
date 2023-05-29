import {useState} from "react";

import "./styles/main.scss";
import {Card} from "./components/Card";

function App() {

  return (
    <div className="App">
    <h1>Kings cup</h1>
      <div style={{width: "100%", height: "600px", background: "#ddd", display: "flex", justifyContent: "center", alignItems: "center"}}>
        <Card title={"test"} description={"Do something crazy"} cardValue={""}/>
      </div>
    </div>
  );
}

export default App;
