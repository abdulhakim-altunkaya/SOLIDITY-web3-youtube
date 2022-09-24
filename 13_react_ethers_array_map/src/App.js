import React from 'react';
import { useState } from "react";
import { ethers } from "ethers";
import { ABI } from "./ContractABI";
import { CONTRACT_ADDRESS } from "./ContractAddress";

function App() {

  const {ethereum} = window;

  //CONNECT TO METAMASK
  let[account, setAccount] = useState("");
  const connectMetamask = async () => {
    if(window.ethereum !== "undefined") {
      const accounts = await ethereum.request({ method: "eth_requestAccounts"});
      setAccount(accounts[0]);
    } else {
      alert("install metamask first");
    }
  }

  //CONNECT TO CONTRACT
  let contract;
  let signer;
  const CONTRACT_ABI = ABI;
  const ADDRESS = CONTRACT_ADDRESS;
  const connectContract = async () => {
    const Address = ADDRESS;
    const ABI = CONTRACT_ABI;
    const provider = new ethers.providers.Web3Provider(window.ethereum);
    signer = provider.getSigner();
    contract = new ethers.Contract(Address, ABI, signer);
  }


  //GET ARRAY
  let listItems = [];
  const accessArray = async () => {
    connectContract();
    const txResponse = await contract.getArray();
    listItems = txResponse;
    console.log(listItems);
  }
  //DISPLAY ARRAY
  let[content, setContent] = useState("");
  const displayArray = async () => {
    await accessArray();
    setContent(listItems.map( (city, index) => <li key={index}> <span>{city}</span> </li>));
  }


  return (

    <div className="App">
      <button onClick={connectMetamask}>Connect Metamask</button>
      <p>{account}</p>
      <button onClick={displayArray}>DISPLAY ARRAY </button>
      <ul>{content}</ul>
    </div>

  );
}

export default App;
