import 'coordinate.dart';

class Viewport {
  final Coordinate center;
  final double width;
  final double height;

  Viewport({
    required this.center,
    required this.width,
    required this.height,
  });

  @override
  String toString() => 'Viewport(width: $width, height: $height)';
}
