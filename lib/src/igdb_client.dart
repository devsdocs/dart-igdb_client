import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:igdb_client/src/enums/enums.dart';
import 'package:igdb_client/src/igdb_token.dart';
import 'package:igdb_client/src/request_parameters.dart';
import 'package:igdb_dart_protobuff/igdb_dart_protobuff.dart';

/// A client for calling IGDB's API.
///
/// See IGDB's documentation of their API at https://api-docs.igdb.com/.
/// There you'll find more details on how to interact with their API, as well
/// as the structure of response objects.
///
/// Note: As of the v4 API, this is not meant to be used directly within web
/// or mobile applications. IGDB recommends instead using a proxy.
/// See latest documentation at: https://api-docs.igdb.com/#web-and-mobile-applications
class IGDBClient {
  /// Requires your twitch developer [clientId]
  /// and an oauth [token] obtained from twitch or via
  /// [getOauthToken].
  IGDBClient(this.clientId, this.token);
  final String clientId;

  final String? token;
  static const String tokenUrl = 'https://id.twitch.tv/oauth2/token';

  static const apiUrl = 'https://api.igdb.com/v4';

  /// Static helper method to get an oauthToken from the provided Twitch developer [clientId] and
  /// [clientSecret]. This should be called once, you should save the token
  /// somewhere, then use that to instantiate IGDBClient. These expire after
  /// ~60 days, so if you are using IGDBClient and get 401 errors, you should
  /// refresh your token and reinstantiate IGDBClient.
  ///
  /// See full documentation at igdb https://api-docs.igdb.com/#breaking-changes
  /// or twitch https://dev.twitch.tv/docs/authentication.
  static Future<IGDBToken> getOauthToken(
    String clientId,
    String clientSecret,
  ) async {
    final String url =
        '$tokenUrl?client_id=$clientId&client_secret=$clientSecret&grant_type=client_credentials';
    final response = await http.post(Uri.tryParse(url)!);

    if (response.statusCode != 200) {
      throw Exception(
        'Attempted to get oauth token failed: (${response.statusCode}) ${response.body}',
      );
    }

    final Map responseMap = jsonDecode(response.body) as Map;
    return IGDBToken.fromMap(responseMap);
  }

  /// Makes a POST request to the [url] with provided [body].
  ///
  /// You generally shouldn't need to use this method directly, and instead
  /// it's recommended to use the endpoint you're trying to reach.
  Future<Uint8List> makeRequest(String url, String body) async {
    final uri = Uri.parse(url);

    final headers = {
      'Client-ID': clientId,
      'Authorization': 'Bearer $token',
    };

    final post = await http.post(uri, headers: headers, body: body);

    return post.bodyBytes;
  }

  Future<Uint8List> _requestByEndpoint(
    IGDBEndpoints endpoint,
    IGDBRequestParameters params,
  ) async {
    return makeRequest(
      '$apiUrl/$endpoint.pb',
      params.toBody(),
    );
  }

  Future<AgeRating> ageRatings(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.AGE_RATINGS, params);
    return AgeRating.fromBuffer(res);
  }

  Future<AgeRatingContentDescription> ageRatingContentDescriptions(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.AGE_RATING_CONTENT_DESCRIPTIONS,
      params,
    );
    return AgeRatingContentDescription.fromBuffer(res);
  }

  Future<AlternativeName> alternativeNames(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.ALTERNATIVE_NAMES, params);
    return AlternativeName.fromBuffer(res);
  }

  Future<Artwork> artworks(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.ARTWORKS, params);
    return Artwork.fromBuffer(res);
  }

  Future<Character> characters(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.CHARACTERS, params);
    return Character.fromBuffer(res);
  }

  Future<CharacterMugShot> characterMugShots(
    IGDBRequestParameters params,
  ) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.CHARACTER_MUG_SHOTS, params);
    return CharacterMugShot.fromBuffer(res);
  }

  Future<Collection> collections(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.COLLECTIONS, params);
    return Collection.fromBuffer(res);
  }

  Future<Company> companies(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.COMPANIES, params);
    return Company.fromBuffer(res);
  }

  Future<CompanyLogo> companyLogos(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.COMPANY_LOGOS, params);
    return CompanyLogo.fromBuffer(res);
  }

  Future<CompanyWebsite> companyWebsites(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.COMPANY_WEBSITES, params);
    return CompanyWebsite.fromBuffer(res);
  }

  Future<Cover> covers(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.COVERS, params);
    return Cover.fromBuffer(res);
  }

  Future<ExternalGame> externalGames(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.EXTERNAL_GAMES, params);
    return ExternalGame.fromBuffer(res);
  }

  Future<Franchise> franchises(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.FRANCHISES, params);
    return Franchise.fromBuffer(res);
  }

  Future<Game> games(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GAMES, params);
    return Game.fromBuffer(res);
  }

  Future<GameEngine> gameEngines(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GAME_ENGINES, params);
    return GameEngine.fromBuffer(res);
  }

  Future<GameEngineLogo> gameEngineLogos(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.GAME_ENGINE_LOGOS, params);
    return GameEngineLogo.fromBuffer(res);
  }

  Future<GameLocalization> gameLocalization(
    IGDBRequestParameters params,
  ) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.GAME_LOCALIZATION, params);
    return GameLocalization.fromBuffer(res);
  }

  Future<GameMode> gameModes(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GAME_MODES, params);
    return GameMode.fromBuffer(res);
  }

  Future<GameVideo> gameVideos(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GAME_VIDEOS, params);
    return GameVideo.fromBuffer(res);
  }

  Future<GameVersion> gameVersions(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GAME_VERSIONS, params);
    return GameVersion.fromBuffer(res);
  }

  Future<GameVersionFeature> gameVersionFeatures(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.GAME_VERSION_FEATURES,
      params,
    );
    return GameVersionFeature.fromBuffer(res);
  }

  Future<GameVersionFeatureValue> gameVersionFeatureValues(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.GAME_VERSION_FEATURE_VALUES,
      params,
    );
    return GameVersionFeatureValue.fromBuffer(res);
  }

  Future<Genre> genres(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.GENRES, params);
    return Genre.fromBuffer(res);
  }

  Future<InvolvedCompany> involvedCompanies(
    IGDBRequestParameters params,
  ) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.INVOLVED_COMPANIES, params);
    return InvolvedCompany.fromBuffer(res);
  }

  Future<Keyword> keywords(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.KEYWORDS, params);
    return Keyword.fromBuffer(res);
  }

  Future<Language> language(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.LANGUAGE, params);
    return Language.fromBuffer(res);
  }

  Future<LanguageSupport> languageSupport(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.LANGUAGE_SUPPORT, params);
    return LanguageSupport.fromBuffer(res);
  }

  Future<LanguageSupportType> languageSupportType(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.LANGUAGE_SUPPORT_TYPE,
      params,
    );
    return LanguageSupportType.fromBuffer(res);
  }

  Future<MultiplayerMode> multiplayerModes(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.MULTIPLAYER_MODES, params);
    return MultiplayerMode.fromBuffer(res);
  }

  Future<Platform> platforms(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.PLATFORMS, params);
    return Platform.fromBuffer(res);
  }

  Future<PlatformLogo> platformLogos(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.PLATFORM_LOGOS, params);
    return PlatformLogo.fromBuffer(res);
  }

  Future<PlatformVersion> platformVersions(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.PLATFORM_VERSIONS, params);
    return PlatformVersion.fromBuffer(res);
  }

  Future<PlatformVersionCompany> platformVersionCompanies(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.PLATFORM_VERSION_COMPANIES,
      params,
    );
    return PlatformVersionCompany.fromBuffer(res);
  }

  Future<PlatformVersionReleaseDate> platformVersionReleaseDates(
    IGDBRequestParameters params,
  ) async {
    final res = await _requestByEndpoint(
      IGDBEndpoints.PLATFORM_VERSION_RELEASE_DATES,
      params,
    );
    return PlatformVersionReleaseDate.fromBuffer(res);
  }

  Future<PlatformWebsite> platformWebsites(IGDBRequestParameters params) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.PLATFORM_WEBSITES, params);
    return PlatformWebsite.fromBuffer(res);
  }

  Future<PlayerPerspective> playerPerspectives(
    IGDBRequestParameters params,
  ) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.PLAYER_PERSPECTIVES, params);
    return PlayerPerspective.fromBuffer(res);
  }

  Future<Region> region(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.REGION, params);
    return Region.fromBuffer(res);
  }

  Future<ReleaseDate> releaseDate(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.RELEASE_DATE, params);
    return ReleaseDate.fromBuffer(res);
  }

  Future<ReleaseDateStatus> releaseDateStatus(
    IGDBRequestParameters params,
  ) async {
    final res =
        await _requestByEndpoint(IGDBEndpoints.RELEASE_DATE_STATUS, params);
    return ReleaseDateStatus.fromBuffer(res);
  }

  Future<Search> search(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.SEARCH, params);
    return Search.fromBuffer(res);
  }

  Future<Theme> themes(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.THEMES, params);
    return Theme.fromBuffer(res);
  }

  Future<Website> websites(IGDBRequestParameters params) async {
    final res = await _requestByEndpoint(IGDBEndpoints.WEBSITES, params);
    return Website.fromBuffer(res);
  }
}
