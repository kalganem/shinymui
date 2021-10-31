import { reactShinyInput } from 'reactR';
import * as React from 'react';
import Rating from '@mui/material/Rating';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';

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

reactShinyInput('.mui_rating', 'shinymui.shinymui', RatingUI);

const CheckboxUI = ({ configuration, value, setValue }) => {
  return (

  <FormControlLabel control={
  <Checkbox
        value={value}
        {...configuration}
        onChange={(event, newValue) => {
          setValue(newValue);
        }}
      />
  } label={configuration.label} labelPlacement={configuration.labelPlacement} />
  );
};

reactShinyInput('.mui_checkbox', 'shinymui.shinymui', CheckboxUI);
