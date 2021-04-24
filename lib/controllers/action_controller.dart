import 'dart:math';

import 'package:circle_action2021/models/action_model.dart';

class ActionController {
  int colorChoice = 0;
  List<ActionModel> _actionList = [
    ActionModel(
        description: 'Speak without using a letter defined by others',
        colorID: 0),
    // Parler sans utiliser une lettre définie par les autres
    ActionModel(description: 'Repeat your words without duplicate', colorID: 1),
    // Répéter ses paroles en double
    ActionModel(description: 'Dance to an imposed song', colorID: 2),
    // Danser sur une chanson imposée
    ActionModel(description: 'Give a glowing speech on friendship', colorID: 3),
    // Faire un discours élogieux sur l’amitié
    ActionModel(description: 'Getting around on a moonwalk ', colorID: 4),
    // Se déplacer en moonwalk
    ActionModel(description: "Become everyone's Marjordome", colorID: 5),
    // Devenir le Marjordome de tout le monde
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
