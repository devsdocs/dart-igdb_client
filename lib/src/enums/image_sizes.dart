// ignore_for_file: constant_identifier_names

enum IGDBImageSizes {
  COVER_SMALL._private('cover_small', 90, 28),
  SCREENSHOT_MED._private('screenshot_med', 569, 320),
  COVER_BIG._private('cover_big', 227, 320),
  LOGO_MED._private('logo_med', 284, 160),
  SCREENSHOT_BIG._private('screenshot_big', 889, 500),
  SCREENSHOT_HUGE._private('screenshot_huge', 1280, 720),
  THUMB._private('thumb', 90, 90),
  MICRO._private('micro', 35, 35),
  HD720P._private('720p', 1280, 720),
  HD1080P._private('1080p', 1920, 1080);

  const IGDBImageSizes._private(this.name, this.width, this.height);
  final String name;
  final int width;
  final int height;
}
