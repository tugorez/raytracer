import 'color.dart';
import 'coordinate.dart';

class Sphere {
  final Coordinate center;
  final double radius;
  final Color color;

  Sphere({
    required this.center,
    required this.radius,
    required this.color,
  });

  @override
  String toString() {
    return 'Sphere(center: $center, radius: $radius, color: $color)';
  }
}
