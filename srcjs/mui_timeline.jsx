import * as React from 'react';
import Timeline from '@mui/lab/Timeline';
import TimelineItem from '@mui/lab/TimelineItem';
import TimelineSeparator from '@mui/lab/TimelineSeparator';
import TimelineConnector from '@mui/lab/TimelineConnector';
import TimelineContent from '@mui/lab/TimelineContent';
import TimelineDot from '@mui/lab/TimelineDot';


const TimelineUI = ({ configuration, value, setValue }) => {

  const listLength = value.length;

  return (
  <Timeline {...configuration}>
  {value.map((item, i) => {
    if (listLength === i + 1) {

      return (
            <TimelineItem>
              <TimelineSeparator>
                <TimelineDot />
                </TimelineSeparator>
        <TimelineContent>{item}</TimelineContent>
      </TimelineItem>
          )
          } else {
            return (
              <TimelineItem>
                <TimelineSeparator>
                  <TimelineDot />
                  <TimelineConnector />
                </TimelineSeparator>
                <TimelineContent>{item}</TimelineContent>
              </TimelineItem>
          )}

        })}
    </Timeline>
  );
};


export default TimelineUI;
