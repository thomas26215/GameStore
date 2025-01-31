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
        'assets/images/ori1.jpg',
        'assets/images/ori2.jpg',
        'Ori and the Forest',
        'Adventure',
        2.0,
        382,
        324,
        72,
        'Ori and the Blind Forest is a platform-adventure Metroidvania video game developed by Moon Studios and published by Microsoft Studios. The game was released for Microsoft Windows and Xbox One in March 2015, and for Nintendo Switch in September 2019.',
        [
          'assets/images/ori1.jpg',
          'assets/images/ori2.jpg',
          'assets/images/ori3.jpg',
          'assets/images/ori4.jpg',
        ],
      ),
      Game(
        2,
        'assets/images/rl1.jpg',
        'assets/images/rl_logo.png',
        'Rayman Legends',
        'Adventure',
        4.7,
        1124011,
        324,
        702102,
        'Rayman Legends is a platform video game developed by Ubisoft Montpellier and published by Ubisoft. It is the fifth main title in the Rayman series and the direct sequel to the 2011 game Rayman Origins.',
        [
          'assets/images/rl2.jpg',
          'assets/images/rl3.jpg',
          'assets/images/rl4.jpg',
          'assets/images/rl5.jpg',
        ],
      ),
    ];
  }
}

