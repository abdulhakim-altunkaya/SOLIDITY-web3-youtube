import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  value: "Shrimp is tasty",
}

const sliceApple = createSlice({
  name: "apple",
  initialState,
  reducers: {},
})

export default sliceApple.reducer;