import 'dart:developer';
import 'dart:io';

import 'package:igdb_client/igdb_client.dart';

void main() async {
  final file = File('cred.txt').readAsStringSync().split('\n');
  final clientId = file[0];
  final secret = file[1];
  // You should only run this once, then save it somewhere. It will eventually
  // expire after ~60 days, at which point you will need to getOauthToken again
  //
  // The reason for this is that there is a limit of roughly 25 app tokens
  // active at any time. See https://api-docs.igdb.com/#web-and-mobile-applications
  final token = await IGDBClient.getOauthToken(clientId, secret);

  final client = IGDBClient(
    
    clientId,
    token.accessToken,
    logger: IGDBConsoleLogger(),
  );

  // Find games with 'infamous' in their name and return
  // the results' name and expand their release_dates and platforms.
  final gamesResponse = await client.games(
    const IGDBRequestParameters(
      search: 'infamous',
      fields: ['name', 'release_dates.*', 'platforms.*'],
    ),
  );
  printResponse(gamesResponse);

  // Find games that are not yet released but are releasing soon in the
  // North American, Worlwide, or Unspecified regions, then sort by
  // release date.
  final int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  final int secsSinceEpoch = msecSinceEpoch ~/ 1000;
  final String timeNow = secsSinceEpoch.toString();
  final releaseResponse = await client.releaseDate(
    IGDBRequestParameters(
      filters:
          'date > $timeNow & (region = ${IGDBRegions.NORTH_AMERICA.id} | region = ${IGDBRegions.NONE.id} | region = ${IGDBRegions.WORLDWIDE.id})',
      order: 'date asc',
    ),
  );
  printResponse(releaseResponse);

  final gameIdResponse = await client.games(
    const IGDBRequestParameters(
      ids: [43378],
    ),
  );
  printResponse(gameIdResponse);
}

void printResponse(IGDBResponse resp) {
  log(IGDBHelpers.getPrettyStringFromMap(resp.toMap()));
}
