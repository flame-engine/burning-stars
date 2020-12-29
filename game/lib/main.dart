import 'dart:math';

import 'package:flame/anchor.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/position_component.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: BurningStarsGame()));
}

class ShipComponent extends PositionComponent
    with HasGameRef<BurningStarsGame> {
  static final _white = BasicPalette.white.paint;

  @override
  Future<void> onLoad() async {
    position = gameRef.size / 2;
    size = Vector2.all(20.0);
    anchor = Anchor.center;
    angle = pi / 4;
  }

  @override
  void render(Canvas c) {
    super.render(c);
    c.drawRect(size.toRect(), _white);
  }
}

class BurningStarsGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    add(ShipComponent());
  }
}
