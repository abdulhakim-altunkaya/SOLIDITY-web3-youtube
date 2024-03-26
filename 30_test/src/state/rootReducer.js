import { combineReducers } from '@reduxjs/toolkit';
import sliceApple from "./sliceApple";

const rootReducer = combineReducers({
    apple : sliceApple,
})

export default rootReducer;
