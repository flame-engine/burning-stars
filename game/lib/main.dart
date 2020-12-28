import 'dart:math';

import 'package:flame/anchor.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/position_component.dart';
import 'package:flame/game.dart';
import 'package:flame/extensions/vector2.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class ShipComponent extends PositionComponent with HasGameRef<MyGame> {
  static final _white = BasicPalette.white.paint;

  @override
  Future<void> onLoad() async {
    this.position = gameRef.size / 2;
    this.size = Vector2.all(20.0);
    this.anchor = Anchor.center;
    this.angle = pi / 4;
  }

  @override
  void render(Canvas c) {
    super.render(c);
    c.drawRect(size.toRect(), _white);
  }
}

class MyGame extends BaseGame {
  @override
  Future<void> onLoad() async {
    add(ShipComponent());
  }
}
