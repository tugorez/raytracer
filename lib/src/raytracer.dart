import 'coordinate.dart';
import 'viewport.dart';
import 'canvas.dart';
import 'scene.dart';
import 'color.dart';

class Raytracer {
  final Coordinate origin;
  final Viewport viewport;
  final Scene scene;

  static const tMin = 0;
  static const tMax = 100000;

  Raytracer({
    required this.origin,
    required this.viewport,
    required this.scene,
  });

  Canvas render() {
    final canvas = Canvas(
      rows: viewport.width + 1,
      columns: viewport.height + 1,
    );
    for (var row = 0; row < canvas.rows; row++) {
      for (var column = 0; column < canvas.columns; column++) {
        final viewportCoordinates = _viewportCoordinateFor(
          row: row,
          column: column,
        );
        final color = _traceRay(viewportCoordinates);
        canvas[row][column] = color;
      }
    }
    return canvas;
  }

  Coordinate _viewportCoordinateFor({required int row, required int column}) {
    return Coordinate(
      x: column - viewport.width / 2,
      y: viewport.height / 2 - row,
      z: (viewport.center - origin).z,
    );
  }

  Color _traceRay(Coordinate viewportCoordinate) {
    return Color(red: 0, green: 0, blue: 0);
  }
}
