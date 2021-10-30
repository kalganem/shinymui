import { reactShinyInput } from 'reactR';
import * as React from 'react';
import Rating from '@mui/material/Rating';
import Checkbox from '@mui/material/Checkbox';


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

reactShinyInput('.mui_rating', 'shinymui.shinymui', RatingUI);


const CheckboxUI = ({ configuration, value, setValue }) => {
  return (
      <Checkbox
        value={value}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
      />
  );
};

reactShinyInput('.mui_checkbox', 'shinymui.shinymui', CheckboxUI);
