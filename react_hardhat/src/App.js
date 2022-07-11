import { ethers } from "ethers";
import { useState } from "react";

function App() {
  const { ethereum } = window;
  let [account, setAccount] = useState("");
  let [contractData, setContractData] = useState("");

  const connectMetamask = async () => {
    if(window.ethereum !== "undefined") {
      const accounts = await ethereum.request({ method: "eth_requestAccounts"});
      setAccount(accounts[0]);
    }
  }

  let contract;
  const connectContract = async () => {
    const Address = "0x1889D2ab8a447Ec0E51709C980661a5f2029B53C";
    const ABI = [
      {
        "inputs": [],
        "name": "myFlower",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ];
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    contract = new ethers.Contract(Address, ABI, signer);
    console.log(contract.address);
  }

  const getData = async () => {
    const phrase = await contract.myFlower();
    setContractData(phrase);
  }

  return (
    <div className="App">
          <button onClick={connectMetamask}>CONNECT TO METAMASK</button>
          <p>{account}</p>
          <button onClick={connectContract}>CONNECT TO CONTRACT</button> <br /><br />
          <button onClick={getData}>READ FROM CONTRACT</button>
          <p>{contractData}</p>
    </div>
  );
}
export default App;