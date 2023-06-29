import 'dart:io';

import 'package:igdb_client/igdb_client.dart';

void main() async {
  final file = File('cred.txt').readAsStringSync().split('_');
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
  );

  final response = await client
      .search(const IGDBRequestParameters(search: 'Counter Strike'));

  print(response.toProto3Json());
  final gamesResponse = await client.games(
    const IGDBRequestParameters(
      search: 'infamous',
      fields: ['name', 'release_dates.*', 'platforms.*'],
    ),
  );
  print(gamesResponse.toProto3Json());

  // Find games that are not yet released but are releasing soon in the
  // North American, Worlwide, or Unspecified regions, then sort by
  // release date.
  final int msecSinceEpoch = DateTime.now().millisecondsSinceEpoch;
  final int secsSinceEpoch = msecSinceEpoch ~/ 1000;
  final String timeNow = secsSinceEpoch.toString();
  final releaseResponse = await client.releaseDate(
    IGDBRequestParameters(
      where:
          'date > $timeNow & (region = ${IGDBRegions.NORTH_AMERICA.id} | region = ${IGDBRegions.NONE.id} | region = ${IGDBRegions.WORLDWIDE.id})',
      sort: 'date asc',
    ),
  );
  print(releaseResponse.toProto3Json());

  final gameIdResponse = await client.games(
    const IGDBRequestParameters(
      ids: [43378],
    ),
  );
  print(gameIdResponse.toProto3Json());
}
