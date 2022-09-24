import { ethers } from "ethers";
import { useState } from "react";

function App() {
  

  let [account, setAccount] = useState("");
  let [contractData, setContractData] = useState("");

  const { ethereum } = window;
  const connectMetamask = async () => {
	  if(window.ethereum !== "undefined") {
      const accounts = await ethereum.request({ method: "eth_requestAccounts"});
      setAccount(accounts[0]);
    }
  }

  let contract;
  const connectContract = async () => {
    const Address = "0x0B9D0a96A76b41bCc31b0E338ebe9E052c044880";
    const ABI = [
      {
        "inputs": [],
        "name": "changeWord",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
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
    ]
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    const signer = provider.getSigner();
    contract = new ethers.Contract(Address, ABI, signer);
    console.log(contract.address);
  }

  const getData = async () => {
    const phrase = await contract.myFlower();
    setContractData(phrase)
  }

  const changeData = async () => {
    const txResponse = await contract.changeWord();
    const txReceipt = await txResponse.wait();
    console.log(txReceipt)
  }
  
  return (
    <div className="App">
          <button onClick={connectMetamask}>CONNECT TO METAMASK</button>
          <p>{account}</p>
          <button onClick={connectContract}>CONNECT TO CONTRACT</button> <br /> <br />
          <button onClick={changeData}>CHANGE DATA</button> <br /> <br />
          <button onClick={getData}>READ FROM CONTRACT</button>
          <p>{contractData}</p>
    </div>
  );
}
export default App;