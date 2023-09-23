import 'coordinate.dart';

class Viewport {
  final Coordinate center;
  final int width;
  final int height;

  Viewport({
    required this.center,
    required this.width,
    required this.height,
  });

  @override
  String toString() => 'Viewport(width: $width, height: $height)';
}
