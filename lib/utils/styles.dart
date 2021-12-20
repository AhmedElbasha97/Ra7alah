import 'package:flutter/material.dart';
import 'package:ra7alah/utils/utils.dart';


import 'colors.dart';

class Styles {
  static final kTextStyleRegular = TextStyle(
      fontSize: 16, fontFamily: kFontFamily, fontWeight: FontWeight.normal);
  static final kTextStyleDescription = extend(
      kTextStyleRegular,
      const TextStyle(
        fontSize: 14,
      ));
  static final kTextStyleSmallDescription = extend(
      kTextStyleRegular,
      const TextStyle(
        fontSize: 8,
      ));
  static final kTextStyleDescriptive = extend(
      kTextStyleDescription,
      const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ));
  static final kTextStyleHelperText = extend(
      kTextStyleRegular,
      const TextStyle(
        color: kGrayColor,
        fontSize: 11,
      ));
  static final kTextStyleHeadline = extend(
      kTextStyleRegular,
      const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 34,
      ));
  static final kTextStyleitemHeadline = extend(
      kTextStyleRegular,
      const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ));
  static final kTextStyleMassiveHeadline = extend(
      kTextStyleRegular,
      const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 48,
      ));
  static final kTextStyleSubheads = extend(
      kTextStyleRegular,
      const TextStyle(
        fontWeight: FontWeight.w600,
      ));
  static final kTextStyleHeadline2 = extend(
      kTextStyleSubheads,
      const TextStyle(
        fontSize: 24,
      ));
  static final kTextStyleHeadline3 = extend(
      kTextStyleSubheads,
      const TextStyle(
        fontSize: 18,
      ));

  static final TextTheme textTheme = TextTheme(
    headline1: kTextStyleHeadline,
    headline2: kTextStyleHeadline2,
    headline6: kTextStyleHeadline3,
    subtitle1: kTextStyleSubheads,
    button: kTextStyleDescriptive,
    caption: kTextStyleHelperText,
    overline: kTextStyleHelperText,
    bodyText1: kTextStyleRegular,
    bodyText2: kTextStyleDescription,
  );
}
