import * as React from 'react';
import Rating from '@mui/material/Rating';


const RatingUI = ({ configuration, value, setValue }) => {
  return (
      <Rating
        value={value}
        {...configuration}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
      />
  );
};

export default RatingUI;
