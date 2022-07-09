import { useState } from "react";

function App() {

  const { ethereum } = window;

  let [account, setAccount] = useState("");

  const connectMetamask = async () => {
    if(window.ethereum !== "undefined") {
      const accounts = await ethereum.request({ method: "eth_requestAccounts"});
      setAccount(accounts[0]);
    }
  }

  return (
    <div className="App">
        <header className="App-header">
          <button onClick={connectMetamask}>CONNECT TO METAMASK</button>
          <p id="areaMetamask">{account}</p>
        </header>
    </div>
  );
}
export default App;