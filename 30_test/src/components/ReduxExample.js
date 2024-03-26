import React from 'react';
import { useSelector } from 'react-redux';

function ReduxExample() {

    const apple = useSelector((state) => state.apple.value);

    return (
        <div>ReduxExample: {apple}</div>
    )

}

export default ReduxExample