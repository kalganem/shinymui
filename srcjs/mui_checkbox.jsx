import * as React from 'react';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';

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

export default CheckboxUI;
