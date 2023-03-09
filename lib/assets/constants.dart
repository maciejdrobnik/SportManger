import 'package:flutter/material.dart';

//TODO: Set the reboto as a theme font for whole application
//* Home Page Component
const double bigWhiteBoxHeight = 180;
const double bigWhiteBoxWidth = 354;
const double homePageHeight = 770;
const double homePageWidth = 390;
const int primaryBlue = 0xff082140;
const int primaryYellow = 0xffEFCA3E;
const double homePagePaddingVertical = 17 / homePageHeight;
const double homePagePaddingHorizontal = 18 / homePageWidth;
const double homePageContainerBorderRadius = 10;
const int bigWhiteBoxFlex = 180;
const int smallWhiteBoxFlex = 124;
const Color backgroundBox = Colors.white;
const int homePageBackground = 0xffE4E6EB;
const int homePageTextColor = 0xff333333;
const double homePageLowerOpacity = 0.6;

//Font Sizes
//program
const double minYellowButtonFontSize = 5;
const double maxYellowButtonFontSize = 13;
const double minBlueButtonFontSize = 5;
const double maxBlueButtonFontSize = 15;
const double programMinDateFontSize = 17;
const double programMaxDateFontSize = 30;
const double programMinHourFontSize = 20;
const double programMaxHourFontSize = 30;

//chores
const double choresMinDateFontSize = 17;
const double choresMaxDateFontSize = 30;
const double choresMinAssigneesFontSize = 15;
//I don't know proper value for Max
const double choresMaxAssigneesFontSize = 40;

/// Program Component
/// The idea of saving font size and padding values like that is to have it in
/// proportions as in Figma but using Layout Builder we will obtain universal font size

const double programPaddingTop = 10 / bigWhiteBoxHeight;
const double programDateVerticalPadding = 7 / bigWhiteBoxHeight;
const double programRowPaddingLeft = 45 / bigWhiteBoxWidth;
const double programRowPaddingRight = 25 / bigWhiteBoxWidth;
const double programPaddingBottom = 8 / bigWhiteBoxHeight;
const double programHourPaddingTop = 20 / bigWhiteBoxHeight;

// Those 2 will need to be changed. I will think about it later
const double programIconSize = 20;
const double programRaiseDateAndIcon = 20;

// Flex values for main column
const int programBlueButtonFlex = 24;
const int programDateFlex = 17;
const int programTeamsRowFlex = 42;
const int programYellowButtonFlex = 17;

// Flex values for team row
const int programTeamLogoFlex = 56;
const int programBreakBetweenLogAndNameFlex = 3;
const int programTeamNameFlex = 16;

// Flex values for arrows
const int programLeftArrowFlex = 0;
const int programRightArrowFlex = 0;

//Buttons
const double widthFactorYellowButton = 0.36;
const double widthFactorBlueButton = 0.46;
const double buttonsBorderRadius = 50;

//* Calendar component

// Flex values for calendar_main widget
const int calendarBlueButtonFlex = 43;
const int calendarMonthFlex = 23;
const int calendarFlex = 56;
const int calendarTaskFlex = 58;

// Padding values
const double calendarPaddingTop = 9 / bigWhiteBoxHeight;
const double calendarMonthTextPaddingLeft = 12 / bigWhiteBoxWidth;
const double calendarMonthTextPaddingTop = 3 / bigWhiteBoxHeight;
const double calendarBetweenHoursPadding = 4 / bigWhiteBoxHeight;
const double calendarTaskNamePaddingLeft = 7 / bigWhiteBoxWidth;

// Auto Size Month Text
const double calendarMonthTextMinFontSize = 12;
const double calendarMonthTextMaxFontSize = 18;

//! I will need to think about this one. It is not responsive for now
const double calendarRowHeight = 36;

// Flex values for task row
const int calendarTaskWhiteBoxFlex = 13;
const int calendarTaskYellowBoxFlex = 4;
const int calendarTaskNameFlex = 287;
const int calendarTaskTimeFlex = 46;

// Yellow Box
const double calendarTaskYellowBoxHeight = 22 / bigWhiteBoxHeight;
const double calendarYellowBoxBorderRadius = 2;

// Font Sizes
const double calendarTaskNameMaxFontSize = 17;
const double calendarTaskNameMinFontSize = 16;
const double calendarTaskDescriptionMaxFontSize = 17;
const double calendarTaskDescriptionMinFontSize = 16;

///Chores component
const double choresPaddingTop = 10 / bigWhiteBoxHeight;
const double choresAssigneesVerticalPadding = 10 / bigWhiteBoxHeight;
const double choresAssigneesLineHeight = 3 / bigWhiteBoxHeight;
const double choresDateVerticalPadding = 7 / bigWhiteBoxHeight;
const double choresRowPaddingLeft = 45 / bigWhiteBoxWidth;
const double choresRowPaddingRight = 25 / bigWhiteBoxWidth;
const double choresPaddingBottom = 8 / bigWhiteBoxHeight;
const double choresHourPaddingTop = 20 / bigWhiteBoxHeight;

//Flex
const int choresBlueButtonFlex = 24;
const int choresDateFlex = 17;
const int choresAssigneesFlex = 42;
const int choresYellowButtonFlex = 17;
