import {useState} from "react";

function App() {

    const [name, setName] = useState("")

    const onClick = () => {
    console.log("button clicked")
    }

  return (
    <div className="App">
        <h1 data-testid="main-headline">Hello (New): Anonymous User</h1>
        <input data-testid="main-input" placeholder={"name"}/>
        <button onClick={onClick}>Click me</button>
    </div>
  );
}

export default App;
