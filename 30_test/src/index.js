import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

//using react-redux
import { Provider } from 'react-redux';
import store from './state/store';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);

