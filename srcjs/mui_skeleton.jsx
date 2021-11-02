import * as React from 'react';
import Skeleton from '@mui/material/Skeleton';


const SkeletonUI = ({ configuration, value, setValue }) => {
  return (
  <Skeleton {...configuration} />
  );
};

export default SkeletonUI;
