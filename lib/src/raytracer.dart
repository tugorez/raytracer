import 'dart:math';
import 'coordinate.dart';
import 'sphere.dart';
import 'viewport.dart';
import 'canvas.dart';
import 'scene.dart';
import 'color.dart';

class Raytracer {
  final Coordinate origin;
  final Viewport viewport;
  final Scene scene;

  static const tMin = 0.0;
  static const tMax = double.infinity;

  Raytracer({
    required this.origin,
    required this.viewport,
    required this.scene,
  });

  Canvas render({
    required int canvasWidth,
    required int canvasHeight,
  }) {
    final canvas = Canvas(
      rows: canvasWidth,
      columns: canvasHeight,
    );
    for (var row = 0; row < canvas.rows; row++) {
      for (var column = 0; column < canvas.columns; column++) {
        final viewportCoordinates = _viewportCoordinateFor(
          row: row,
          column: column,
          canvasWidth: canvasWidth,
          canvasHeight: canvasHeight,
        );
        final color = _traceRay(viewportCoordinates);
        canvas[row][column] = color;
      }
    }
    return canvas;
  }

  Coordinate _viewportCoordinateFor({
    required int row,
    required int column,
    required int canvasWidth,
    required int canvasHeight,
  }) {
    var x = (column - canvasWidth / 2);
    var y = (canvasHeight / 2 - row);
    return Coordinate(
      x: x * viewport.width / canvasWidth,
      y: y * viewport.height / canvasHeight,
      z: (viewport.center - origin).z,
    );
  }

  Color _traceRay(Coordinate viewportCoordinate) {
    var closestT = double.infinity;
    Sphere? closestSphere;
    for (final sphere in scene.spheres) {
      final (t1, t2) = _intersectRaySphere(viewportCoordinate, sphere);
      if ((t1 >= tMin && t1 <= tMax) && t1 < closestT) {
        closestT = t1;
        closestSphere = sphere;
      }
      if ((t2 >= tMin && t2 <= tMax) && t2 < closestT) {
        closestT = t2;
        closestSphere = sphere;
      }
    }
    if (closestSphere == null) return Color(red: 255, green: 255, blue: 255);
    return closestSphere.color;
  }

  (double, double) _intersectRaySphere(
    Coordinate d,
    Sphere sphere,
  ) {
    final r = sphere.radius;
    final co = origin - sphere.center;
    final a = d.dot(d);
    final b = 2 * co.dot(d);
    final c = co.dot(co) - pow(r, 2);
    final discriminant = b * b - 4 * a * c;
    if (discriminant < 0) return (double.infinity, double.infinity);

    final t1 = (-b + sqrt(discriminant)) / (2 * a);
    final t2 = (-b - sqrt(discriminant)) / (2 * a);
    return (t1, t2);
  }
}

extension on Coordinate {
  double dot(Coordinate o) => x * o.x + y * o.y + z * o.z;
}
