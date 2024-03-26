import { create } from "zustand";
import { ethers } from "ethers";
import { contractABI } from "./AddressABI/contractABI";
import { contractAddress } from "./AddressABI/contractAddress";

let contractApple1;
let provider;
let signer;

const connectContract = async () => {
    provider = new ethers.BrowserProvider(window.ethereum);
    signer = await provider.getSigner();
    contractApple1 = new ethers.Contract(contractAddress, contractABI, signer);
}

connectContract();

export const useAccount = create(() => ({
    contractApple2: contractApple1,
}));