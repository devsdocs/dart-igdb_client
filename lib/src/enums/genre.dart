// ignore_for_file: constant_identifier_names, avoid_dynamic_calls

enum IGDBGenres {
  POINT_AND_CLICK._private('Point-and-click', _pointAndClickId),
  FIGHTING._private('Fighting', _fightingId),
  SHOOTER._private('Shooter', _shooterId),
  MUSIC._private('Music', _musicId),
  PLATFORM._private('Platform', _platformId),
  PUZZLE._private('Puzzle', _puzzleId),
  RACING._private('Racing', _racingId),
  REAL_TIME_STRATEGY._private('RTS', _rtsId),
  ROLE_PLAYING_GAME._private('RPG', _rpgId),
  SIMULATOR._private('Simulator', _simulatorId),
  SPORT._private('Sport', _sportId),
  STRATEGY._private('Strategy', _strategyId),
  TURN_BASED_STRATEGY._private('TBS', _tbsId),
  TACTICAL._private('Tactical', _tacticalId),
  HACK_AND_SLASH._private("Hack and slash/Beat 'em up", _hackAndSlashId),
  QUIZ_TRIVIA._private('Quiz/Trivia', _quizTriviaId),
  PINBALL._private('Pinball', _pinballId),
  ADVENTURE._private('Adventure', _adventureId),
  INDIE._private('Indie', _indieId),
  ARCADE._private('Arcade', _arcadeId),
  NONE._private('None', 0);

  const IGDBGenres._private(this.name, this.id);
  final String name;
  final int id;

  static const int _pointAndClickId = 2;
  static const int _fightingId = 4;
  static const int _shooterId = 5;
  static const int _musicId = 7;
  static const int _platformId = 8;
  static const int _puzzleId = 9;
  static const int _racingId = 10;
  static const int _rtsId = 11;
  static const int _rpgId = 12;
  static const int _simulatorId = 13;
  static const int _sportId = 14;
  static const int _strategyId = 15;
  static const int _tbsId = 16;
  static const int _tacticalId = 24;
  static const int _hackAndSlashId = 25;
  static const int _quizTriviaId = 26;
  static const int _pinballId = 30;
  static const int _adventureId = 31;
  static const int _indieId = 32;
  static const int _arcadeId = 33;

  static const Map<int, IGDBGenres> _map = {
    _simulatorId: SIMULATOR,
    _sportId: SPORT,
    _strategyId: STRATEGY,
    _tbsId: TURN_BASED_STRATEGY,
    _hackAndSlashId: HACK_AND_SLASH,
    _quizTriviaId: QUIZ_TRIVIA,
    _pinballId: PINBALL,
    _adventureId: ADVENTURE,
    _indieId: INDIE,
    _arcadeId: ARCADE,
    _pointAndClickId: POINT_AND_CLICK,
    _fightingId: FIGHTING,
    _shooterId: SHOOTER,
    _musicId: MUSIC,
    _platformId: PLATFORM,
    _puzzleId: PUZZLE,
    _racingId: RACING,
    _rtsId: REAL_TIME_STRATEGY,
    _rpgId: ROLE_PLAYING_GAME
  };

  static IGDBGenres fromInt(int? id) {
    return _map[id!] ?? NONE;
  }

  static List<IGDBGenres> listFromMapList(List maps) {
    return maps.map((m) => IGDBGenres.fromInt(m['id'] as int)).toList();
  }
}
