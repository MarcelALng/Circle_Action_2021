import 'dart:math';

import 'package:circle_action2021/models/action_model.dart';

class ActionController {
  int colorChoice = 0;
  List<ActionModel> _actionList = [
    ActionModel(
        description: 'Parler sans utiliser une lettre définie par les autres',
        colorID: 0),
    ActionModel(description: 'Répéter ses paroles en double', colorID: 1),
    ActionModel(description: 'Danser sur une chanson imposée', colorID: 2),
    ActionModel(
        description: 'Faire un discours élogieux sur l’amitié', colorID: 3),
    ActionModel(description: 'Se déplacer en moonwalk', colorID: 4),
    ActionModel(description: 'Faire une série de pompe', colorID: 5),
    ActionModel(
        description: 'Devenir le Marjordome de tout le monde', colorID: 6),
    ActionModel(description: "Imiter le cris d'un animal", colorID: 7),
  ];

  ActionModel getActions() {
    return _actionList[colorChoice];
  }

  String _decodeColor(int color) {
    switch (color) {
      case 0:
        return "vert";
        break;
      case 1:
        return "bleu clair";
        break;
      case 2:
        return "violet";
        break;
      case 3:
        return "rose";
        break;
      case 4:
        return "jaune";
        break;
      case 5:
        return "bleu foncé";
        break;
      case 6:
        return "rouge";
        break;
      case 7:
        return "orange";
        break;
      default:
        return "erreur";
        break;
    }
  }

  getRandomPosition() {
    int minTurns = 6;
    int maxTurns = 10;
    colorChoice = Random().nextInt(8);
    double colorAlgo = (1.0 / 8.0) * colorChoice;
    print(_decodeColor(colorChoice));
    double position = (Random().nextInt(maxTurns - minTurns) + minTurns)
        //calculate turns number
        +
        colorAlgo;
    print(position);
    return position;
  }
}
