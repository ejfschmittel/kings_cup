import {useState} from "react";

import "./styles/main.scss";
import {Card} from "./components/Card";
import {Menu} from "./components/Menu";


function App() {

  return (
    <div className="App">
      <header style={{ display: "flex", justifyContent: "space-between", alignItems: "center"}}>

        <h1>Kings cup</h1>
          <Menu />
      </header>
      <main>
          <div>
              <Card title={"test"} description={"Do something crazy"} cardValue={""}/>
          </div>
          <div className={"button__container"}>
              <button className={"button"}>Next</button>
          </div>
      </main>
    </div>
  );
}

export default App;
