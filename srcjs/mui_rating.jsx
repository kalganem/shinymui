import { reactShinyInput } from 'reactR';
import * as React from 'react';
import Rating from '@mui/material/Rating';


const RatingUI = ({ configuration, value, setValue }) => {
  return (

      <Rating
        value={value}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
      />
  );
};


reactShinyInput('.mui_rating', 'shinymui.mui_rating', RatingUI);
