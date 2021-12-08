part of styles;

class AppFonts {
  static TextStyle getAppFont({
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
    required double letterSpacing,
    double height = 1.2,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return GoogleFonts.lato(
        textStyle: TextStyle(
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    ));
  }

  static final primaryHeader = getAppFont(
    fontSize: 35,
    fontWeight: FontWeight.normal,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
  static final title = getAppFont(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
  static final note = getAppFont(
    fontSize: 25,
    fontWeight: FontWeight.normal,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
  static final boldprimaryHeader = getAppFont(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: TextColors.primaryTextColor,
    letterSpacing: -0.5,
  );

  static final secondaryHeader = getAppFont(
    fontSize: 23,
    fontWeight: FontWeight.normal,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
  static final hintText = getAppFont(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: TextColors.hintTextColor,
    letterSpacing: 0,
  );
  static final hintTextOne = getAppFont(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: TextColors.hintTextColor,
    letterSpacing: 0,
  );
  static final notesHeader = getAppFont(
    fontSize: 27,
    fontWeight: FontWeight.bold,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
  static final save = getAppFont(
    height: 1,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: TextColors.primaryTextColor,
    letterSpacing: 0,
  );
}
