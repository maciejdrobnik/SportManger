import 'package:flutter/material.dart';

// Home Page  Constants
const double bigWhiteBoxHeight = 180;
const double bigWhiteBoxWidth = 354;
const double homePageHeight = 770;
const double homePageWidth = 390;
const int primaryBlue = 0xff082140;
const int primaryYellow = 0xffEFCA3E;
const double homePagePaddingVertical = 17 / homePageHeight;
const double homePagePaddingHorizontal = 18 / homePageWidth;
const double homePageContainerBorderRadius = 10;
const int bigWhiteBoxFlex = 2;
const int smallWhiteBoxFlex = 1;
const Color backgroundBox = Colors.white;
const int homePageBackground = 0xffE4E6EB;
const int homePageTextColor = 0xff333333;

//Font Sizes
const double minYellowButtonFontSize = 5;
const double maxYellowButtonFontSize = 13;
const double minBlueButtonFontSize = 5;
const double maxBlueButtonFontSize = 15;
const double programMinDateFontSize = 17;
const double programMaxDateFontSize = 30;
const double programMinHourFontSize = 20;
const double programMaxHourFontSize = 30;

/// Program Component
/// The idea of saving font size and padding values like that is to have it in
/// proportions as in Figma but using Layout Builder we will obtain universal font size

const double programPaddingTop = 10 / bigWhiteBoxHeight;
const double programDateVerticalPadding = 7 / bigWhiteBoxHeight;
const double programRowPaddingLeft = 45 / bigWhiteBoxWidth;
const double programRowPaddingRight = 25 / bigWhiteBoxWidth;
const double programPaddingBottom = 8 / bigWhiteBoxHeight;
const double programHourPaddingTop = 20 / bigWhiteBoxHeight;

/// Those 2 will need to be changed. I will think about it later
const double programIconSize = 20;
const double programRaiseDateAndIcon = 20;

/// Flex values for main column
const int programBlueButtonFlex = 24;
const int programDateFlex = 17;
const int programTeamsRowFlex = 42;
const int programYellowButtonFlex = 17;

/// Flex values for team row
const int programTeamLogoFlex = 56;
const int programBreakBetweenLogAndNameFlex = 3;
const int programTeamNameFlex = 16;

///Buttons
const double widthFactorYellowButton = 0.36;
const double widthFactorBlueButton = 0.46;
const double buttonsBorderRadius = 50;

///Chores
const double widthNameContainer = 250;
const double heightNameContainer = 70;

const double choresAssgineesPaddingTop = 3 / bigWhiteBoxHeight;
const double choresAssigneesFontSize = 15;
