// ignore_for_file: constant_identifier_names

enum IGDBEndpoints {
  GAME_ENGINES._private('game_engines'),
  AGE_RATING_CONTENT_DESCRIPTIONS._private('age_rating_content_descriptions'),
  ALTERNATIVE_NAMES._private('alternative_names'),
  ARTWORKS._private('artworks'),
  CHARACTERS._private('characters'),
  CHARACTER_MUG_SHOTS._private('character_mug_shots'),
  COLLECTIONS._private('collections'),
  COMPANIES._private('companies'),
  COMPANY_LOGOS._private('company_logos'),
  COMPANY_WEBSITES._private('company_websites'),
  COVERS._private('covers'),
  EXTERNAL_GAMES._private('external_games'),
  FRANCHISES._private('franchises'),
  GAMES._private('games'),
  AGE_RATINGS._private('age_ratings'),
  GAME_ENGINE_LOGOS._private('game_engine_logos'),
  GAME_LOCALIZATION._private('game_localizations'),
  GAME_MODES._private('game_modes'),
  GAME_VERSIONS._private('game_versions'),
  GAME_VERSION_FEATURES._private('game_version_features'),
  GAME_VERSION_FEATURE_VALUES._private('game_version_feature_values'),
  GAME_VIDEOS._private('game_videos'),
  GENRES._private('genres'),
  INVOLVED_COMPANIES._private('involved_companies'),
  KEYWORDS._private('keywords'),
  LANGUAGE._private('languages'),
  LANGUAGE_SUPPORT._private('language_supports'),
  LANGUAGE_SUPPORT_TYPE._private('language_support_types'),
  WEBSITES._private('websites'),
  PLATFORMS._private('platforms'),
  PLATFORM_FAMILIES._private('platform_families'),
  PLATFORM_LOGOS._private('platform_logos'),
  PLATFORM_VERSIONS._private('platform_versions'),
  PLATFORM_VERSION_COMPANIES._private('platform_version_companies'),
  PLATFORM_VERSION_RELEASE_DATES._private('platform_version_release_dates'),
  PLATFORM_WEBSITES._private('platform_websites'),
  PLAYER_PERSPECTIVES._private('player_perspectives'),
  REGION._private('regions'),
  RELEASE_DATE._private('release_dates'),
  RELEASE_DATE_STATUS._private('release_date_statuses'),
  SCREENSHOTS._private('screenshots'),
  SEARCH._private('search'),
  THEMES._private('themes'),
  MULTIPLAYER_MODES._private('multiplayer_modes');

  const IGDBEndpoints._private(this.value);
  final String value;

  @override
  String toString() {
    return value;
  }
}
