import * as React from 'react';
import { reactShinyInput } from 'reactR';
import RatingUI from './mui_rating.jsx';
import CheckboxUI from './mui_checkbox.jsx';
import TransferList from './mui_transferlist.jsx';
import SkeletonUI from './mui_skeleton.jsx';

reactShinyInput('.mui_rating', 'shinymui.shinymui', RatingUI);
reactShinyInput('.mui_checkbox', 'shinymui.shinymui', CheckboxUI);
reactShinyInput('.mui_transferlist', 'shinymui.shinymui', TransferList);
reactShinyInput('.mui_skeleton', 'shinymui.shinymui', SkeletonUI);
