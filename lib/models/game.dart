class Game {
  int id;
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  num comment;
  String description;
  List<String> images;

  Game(
    this.id,
    this.bgImage,
    this.icon,
    this.name,
    this.type,
    this.score,
    this.download,
    this.review,
    this.comment,
    this.description,
    this.images,
  );

  static List<Game> games() {
    return [
      Game(
        1,
        'assets/images/captures/ori1.jpg',
        'assets/images/icon/ori_logo.png',
        'Ori and the Forest',
        'Adventure',
        2.0,
        382,
        324,
        72,
        'Ori and the Blind Forest is a platform-adventure Metroidvania video game developed by Moon Studios and published by Microsoft Studios. The game was released for Microsoft Windows and Xbox One in March 2015, and for Nintendo Switch in September 2019.',
        [
          'assets/images/captures/ori1.jpg',
          'assets/images/captures/ori2.jpg',
          'assets/images/captures/ori3.jpg',
          'assets/images/captures/ori4.jpg',
        ],
      ),
      Game(
        2,
        'assets/images/rl1.jpg',
        'assets/images/icon/rl_logo.png',
        'Rayman Legends',
        'Adventure',
        4.7,
        1124011,
        324,
        702102,
        'Rayman Legends is a platform video game developed by Ubisoft Montpellier and published by Ubisoft. It is the fifth main title in the Rayman series and the direct sequel to the 2011 game Rayman Origins.',
        [
          'assets/images/rl1.jpg',
          'assets/images/rl2.jpg',
          'assets/images/rl3.jpg',
          'assets/images/rl4.jpg',
          'assets/images/rl5.jpg',
        ],
      ),
      Game(
        3,
        'assets/images/legend1.jpg',
        'assets/images/icon/legend_logo.jpg',
        'League of Legends',
        'MOBA',
        4.3,
        13482276,
        2411021,
        1422520,
        'League of Legends is a multiplayer online battle arena video game developed and published by Riot Games for Microsoft Windows and macOS. Inspired by Defense of the Ancients, the game follows a freemium model.',
        [
          'assets/images/legend1.jpg',
          'assets/images/legend2.jpg',
          'assets/images/legend3.jpg',
          'assets/images/legend4.jpg',
        ],
      ),

      
    ];
  }
}

