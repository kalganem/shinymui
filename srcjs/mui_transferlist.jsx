import * as React from 'react';
import Grid from '@mui/material/Grid';
import List from '@mui/material/List';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import ListItem from '@mui/material/ListItem';
import ListItemText from '@mui/material/ListItemText';
import ListItemIcon from '@mui/material/ListItemIcon';
import Button from '@mui/material/Button';
import Divider from '@mui/material/Divider';
import Typography from '@mui/material/Typography';
import Checkbox from '@mui/material/Checkbox';

function not(a, b) {
  return a.filter((value) => b.indexOf(value) === -1);
}

function intersection(a, b) {
  return a.filter((value) => b.indexOf(value) !== -1);
}

function union(a, b) {
  return [...a, ...not(b, a)];
}

const TransferList = ({ configuration, value, setValue }) => {

  const [checked, setChecked] = React.useState([]);
  const [left, setLeft] = React.useState(configuration.left_list);
  const [right, setRight] = React.useState(configuration.right_list);

  const leftChecked = intersection(checked, left);
  const rightChecked = intersection(checked, right);

  const handleToggle = (value) => () => {
    const currentIndex = checked.indexOf(value);
    const newChecked = [...checked];

    if (currentIndex === -1) {
      newChecked.push(value);
    } else {
      newChecked.splice(currentIndex, 1);
    }

    setChecked(newChecked);
  };

  const numberOfChecked = (items) => intersection(checked, items).length;

  const handleToggleAll = (items) => () => {
    if (numberOfChecked(items) === items.length) {
      setChecked(not(checked, items));
    } else {
      setChecked(union(checked, items));
    }
  };

  const handleCheckedRight = () => {
    setRight(right.concat(leftChecked));
    setLeft(not(left, leftChecked));
    setChecked(not(checked, leftChecked));

    setValue(right.concat(leftChecked));

  };

  const handleCheckedLeft = () => {
    setLeft(left.concat(rightChecked));
    setRight(not(right, rightChecked));
    setChecked(not(checked, rightChecked));

    setValue(not(right, rightChecked));

  };

  const customList = (title, items) => (
    <Card>
      <CardHeader
        sx={{ px: 2, py: 1 }}
        avatar={
          <Checkbox
            onClick={handleToggleAll(items)}
            checked={numberOfChecked(items) === items.length && items.length !== 0}
            indeterminate={
              numberOfChecked(items) !== items.length && numberOfChecked(items) !== 0
            }
            disabled={items.length === 0}
            inputProps={{
              'aria-label': 'all items selected',
            }}
          />
        }
        title={title}
        subheader={`${numberOfChecked(items)}/${items.length} selected`}
      />
      <Divider />
      <List
        sx={{
          width: 200,
          height: 230,
          bgcolor: 'background.paper',
          overflow: 'auto',
        }}
        dense
        component="div"
        role="list"
      >
        {items.map((value) => {
          const labelId = `transfer-list-all-item-${value}-label`;

          return (
            <ListItem
              key={value}
              role="listitem"
              button
              onClick={handleToggle(value)}
            >
              <ListItemIcon>
                <Checkbox
                  checked={checked.indexOf(value) !== -1}
                  tabIndex={-1}
                  disableRipple
                  inputProps={{
                    'aria-labelledby': labelId,
                  }}
                />
              </ListItemIcon>
              <ListItemText id={labelId} primary={`${value}`} />
            </ListItem>
          );
        })}
        <ListItem />
      </List>
    </Card>
  );



  const transfer_buttons = (flag) => {
    if (flag == "row") {

      return(<Grid container direction="column" alignItems="center" >
          <Button
            sx={{ my: 0.5, fontSize: 10, fontWeight: 'bold'  }}
            variant="outlined"
            size="medium"
            onClick={handleCheckedRight}
            disabled={leftChecked.length === 0}
            aria-label="move selected right"
          >
            &rarr;
          </Button>
          <Button
            sx={{ my: 0.5, fontSize: 10, fontWeight: 'bold' }}
            variant="outlined"
            size="medium"
            onClick={handleCheckedLeft}
            disabled={rightChecked.length === 0}
            aria-label="move selected left"
          >
            &larr;
          </Button>
        </Grid>);
    }
    else {
    return(<Grid container direction="row" alignItems="center">

          <Button
            sx={{ my: 0.5, fontSize: 10, fontWeight: 'bold'  }}
            variant="outlined"
            size="medium"
            onClick={handleCheckedRight}
            disabled={leftChecked.length === 0}
            aria-label="move selected down"
          >
            &darr;

          </Button>
          <Button
            sx={{ my: 0.5, fontSize: 10, fontWeight: 'bold'  }}
            variant="outlined"
            size="medium"
            onClick={handleCheckedLeft}
            disabled={rightChecked.length === 0}
            aria-label="move selected up"
          >
            &uarr;
          </Button>

        </Grid>);
    }
    };

  return (
    <Grid container spacing={2} justifyContent={configuration.justifyContent} alignItems="center" direction={configuration.direction}>
      <Grid item>{customList(configuration.left_title, left)}</Grid>
      <Grid item>
        {transfer_buttons(configuration.direction)}
      </Grid>
      <Grid item>{customList(configuration.right_title, right)}</Grid>
    </Grid>
  );
}

export default TransferList;
