import 'dart:math';

class ActionController {
  // String _decodeColor(int color) {
  //   switch (color) {
  //     case 0:
  //       return "vert";
  //       break;
  //     case 1:
  //       return "bleu clair";
  //       break;
  //     case 2:
  //       return "violet";
  //       break;
  //     case 3:
  //       return "rose";
  //       break;
  //     case 4:
  //       return "jaune";
  //       break;
  //     case 5:
  //       return "bleu foncé";
  //       break;
  //     case 6:
  //       return "rouge";
  //       break;
  //     case 7:
  //       return "orange";
  //       break;
  //     default:
  //       return "erreur";
  //       break;
  //   }
  // }

  getRandomPosition() {
    int minTurns = 6;
    int maxTurns = 10;
    int colorChoice = Random().nextInt(8);
    double colorAlgo = (1.0 / 8.0) * colorChoice;

    double position = (Random().nextInt(maxTurns - minTurns) + minTurns)
        //calculate turns number
        +
        colorAlgo;
    print(position);
    return position;
  }
}
