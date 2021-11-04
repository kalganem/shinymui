import * as React from 'react';
import Timeline from '@mui/lab/Timeline';
import TimelineItem from '@mui/lab/TimelineItem';
import TimelineSeparator from '@mui/lab/TimelineSeparator';
import TimelineConnector from '@mui/lab/TimelineConnector';
import TimelineContent from '@mui/lab/TimelineContent';
import TimelineDot from '@mui/lab/TimelineDot';
import Typography from '@mui/material/Typography';


const TimelineUI = ({ configuration, value, setValue }) => {

  const listLength = value.length;
  console.log(value);

  return (
  <Timeline {...configuration}>
  {value.map((item, i) => {
    if (listLength === i + 1) {

      return (
            <TimelineItem>
              <TimelineSeparator>
                <TimelineDot />
                </TimelineSeparator>
                 <TimelineContent>
                 <Typography variant="h6" component="span">
                  {item.title}
                 </Typography>
                 <Typography>{item.text}</Typography>
                 </TimelineContent>
            </TimelineItem>
          )
          } else {

            return (
              <TimelineItem>
                <TimelineSeparator>
                  <TimelineDot />
                  <TimelineConnector />
                </TimelineSeparator>
                <TimelineContent>
                <Typography variant="h6">
                  {item.title}
                 </Typography>
                 <Typography>{item.text}</Typography>
                </TimelineContent>
              </TimelineItem>
          )}

        })}
    </Timeline>
  );
};


export default TimelineUI;