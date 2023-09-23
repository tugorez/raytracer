import 'coordinate.dart';
import 'viewport.dart';
import 'canvas.dart';
import 'scene.dart';

class Raytracer {
  final Coordinate origin;
  final Viewport viewport;
  final Scene scene;
  final Canvas canvas;

  Raytracer({
    required this.origin,
    required this.viewport,
    required this.scene,
    required this.canvas,
  });

  void render() {}
}
