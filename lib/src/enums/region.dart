// ignore_for_file: constant_identifier_names

enum IGDBRegions {
  EUROPE._private('Europe', _europeId),
  NORTH_AMERICA._private('North America', _naId),
  AUSTRALIA._private('Australia', _australiaId),
  NEW_ZEALAND._private('New Zealand', _newZealandId),
  JAPAN._private('Japan', _japanId),
  CHINA._private('China', _chinaId),
  ASIA._private('Asia', _asiaId),
  WORLDWIDE._private('Worldwide', _worldwideId),
  NONE._private('None', null);

  const IGDBRegions._private(this.name, this.id);
  final String name;
  final int? id;

  static const int _europeId = 1;
  static const int _naId = 2;
  static const int _australiaId = 3;
  static const int _newZealandId = 4;
  static const int _japanId = 5;
  static const int _chinaId = 6;
  static const int _asiaId = 7;
  static const int _worldwideId = 8;

  static const Map<int, IGDBRegions> _map = {
    _europeId: EUROPE,
    _naId: NORTH_AMERICA,
    _australiaId: AUSTRALIA,
    _newZealandId: NEW_ZEALAND,
    _japanId: JAPAN,
    _chinaId: CHINA,
    _asiaId: ASIA,
    _worldwideId: WORLDWIDE
  };

  static IGDBRegions? fromInt(int? id) {
    if (id == null) {
      return WORLDWIDE;
    } else if (_map[id] == null) {
      return NONE;
    }

    return _map[id];
  }

  static List<IGDBRegions> all() {
    return _map.values.toList();
  }

  @override
  String toString() {
    return toMap().toString();
  }

  Map toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
