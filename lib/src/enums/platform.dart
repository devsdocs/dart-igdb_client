// ignore_for_file: constant_identifier_names, avoid_dynamic_calls

enum IGDBPlatforms {
  SUPER_NINTENDO._private(
      'Super Nintendo Entertainment System (SNES)', _snesId,),
  N64._private('Nintendo 64', _n64Id),
  WII._private('Wii', _wiiId),
  PC_WINDOWS._private('PC (Microsoft Windows)', _pcId),
  PLAYSTATION._private('Playstation', _ps1Id),
  PLAYSTATION_2._private('Playstation 2', _ps2Id),
  PLAYSTATION_3._private('Playstation 3', _ps3Id),
  XBOX._private('Xbox', _xboxId),
  XBOX_360._private('Xbox 360', _xbox360Id),
  PC_DOS._private('PC DOS', _pcdosId),
  MAC._private('Mac', _macId),
  COMMODORE_C64._private('Commodore C64/128', _commodoreId),
  NES._private(
      'Nintendo Entertainment System (NES)', _nesId,),
  LINUX._private('Linux', _linuxId),
  DS._private('Nintendo DS', _dsId),
  GAMECUBE._private('Nintendo Gamecube', _gamecubeId),
  GAMEBOY_COLOR._private('Game Boy Color', _gbcId),
  DREAMCAST._private('Dreamcast', _dreamcastId),
  GAMEBOY_ADVANCE._private('Game Boy Advance', _gbaId),
  AMSTRAD_CPC._private('Amstrad CPC', _amstradCpcId),
  MSX._private('MSX', _msxId),
  SEGA_GENESIS._private('Sega Mega Drive/Genesis', _segaGenesisId),
  SEGA_SATURN._private('Sega Saturn', _segaSaturnId),
  GAMEBOY._private('Game Boy', _gameBoyId),
  ANDROID._private('Android', _androidId),
  XBOX_LIVE_ARCADE._private('Xbox Live Arcade', _xboxLiveArcadeId),
  NINTENDO_3DS._private('Nintendo 3DS', _3dsId),
  NONE._private('None', 0),
  IOS._private('iOS', _iosId),
  WIIU._private('Wii U', _wiiUId),
  PLAYSTATION_NETWORK._private('Playstation Network', _psnId),
  PLAYSTATION_VITA._private('Playstation Vita', _psVitaId),
  VIRTUAL_CONSOLE._private('Virtual Console (Nintendo)', _vcId),
  PLAYSTATION_4._private('Playstation 4', _ps4Id),
  XBOX_ONE._private('Xbox One', _xboxOneId),
  FAMILY_COMPUTER_DISK_SYSTEM._private(
          'Family Computer Disk System', _familyComputerDiskId,),
  SWITCH._private('Switch', _switchId),
  ESHOP._private('Nintendo eShop', _nintendoEshopId),
  STEAMVR._private('SteamVR', _steamVrId),
  DAYDREAM._private('Daydream', _daydreamId),
  PLAYSTATION_VR._private('Playstation VR', _psVrId),
  PLAYSTATION_PORTABLE._private('Playstation Portable', _pspId);

  const IGDBPlatforms._private(this.name, this.id);
  final String name;
  final int id;

  static const int _linuxId = 3;
  static const int _n64Id = 4;
  static const int _wiiId = 5;
  static const int _pcId = 6;
  static const int _ps1Id = 7;
  static const int _ps2Id = 8;
  static const int _ps3Id = 9;
  static const int _xboxId = 11;
  static const int _xbox360Id = 12;
  static const int _pcdosId = 13;
  static const int _macId = 14;
  static const int _commodoreId = 15;
  static const int _nesId = 18;
  static const int _snesId = 19;
  static const int _dsId = 20;
  static const int _gamecubeId = 21;
  static const int _gbcId = 22;
  static const int _dreamcastId = 23;
  static const int _gbaId = 24;
  static const int _amstradCpcId = 25;
  static const int _msxId = 27;
  static const int _segaGenesisId = 29;
  static const int _segaSaturnId = 32;
  static const int _gameBoyId = 33;
  static const int _androidId = 34;
  static const int _xboxLiveArcadeId = 36;
  static const int _3dsId = 37;
  static const int _pspId = 38;
  static const int _iosId = 39;
  static const int _wiiUId = 41;
  static const int _psnId = 45;
  static const int _psVitaId = 46;
  static const int _vcId = 47;
  static const int _ps4Id = 48;
  static const int _xboxOneId = 49;
  static const int _familyComputerDiskId = 51;
  static const int _switchId = 130;
  static const int _nintendoEshopId = 160;
  static const int _steamVrId = 163;
  static const int _daydreamId = 164;
  static const int _psVrId = 165;

  static const Map<int, IGDBPlatforms> _map = {
    _wiiId: WII,
    _pcId: PC_WINDOWS,
    _ps1Id: PLAYSTATION,
    _ps2Id: PLAYSTATION_2,
    _ps3Id: PLAYSTATION_3,
    _xboxId: XBOX,
    _xbox360Id: XBOX_360,
    _dsId: DS,
    _gamecubeId: GAMECUBE,
    _gbcId: GAMEBOY_COLOR,
    _dreamcastId: DREAMCAST,
    _gbaId: GAMEBOY_ADVANCE,
    _3dsId: NINTENDO_3DS,
    _pspId: PLAYSTATION_PORTABLE,
    _wiiUId: WIIU,
    _psVitaId: PLAYSTATION_VITA,
    _ps4Id: PLAYSTATION_4,
    _xboxOneId: XBOX_ONE,
    _androidId: ANDROID,
    _iosId: IOS,
    _linuxId: LINUX,
    _macId: MAC,
    _switchId: SWITCH,
  };

  static IGDBPlatforms fromInt(int? id) {
    return _map[id!] ?? NONE;
  }

  static List<IGDBPlatforms> listFromMapList(List maps) {
    return maps.map((m) => IGDBPlatforms.fromInt(m['id'] as int?)).toList();
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
