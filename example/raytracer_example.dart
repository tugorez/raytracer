import 'package:raytracer/raytracer.dart';

void main() {
  final origin = Coordinate(x: 0, y: 0, z: 0);
  final viewport = Viewport(
    center: Coordinate(x: 0, y: 0, z: 1),
    width: 1,
    height: 1,
  );
  final scene = Scene(
    spheres: [
      Sphere(
        center: Coordinate(x: 0, y: -1, z: 3),
        radius: 1,
        color: Color(red: 255, green: 0, blue: 0),
      ),
      Sphere(
        center: Coordinate(x: 2, y: 0, z: 4),
        radius: 1,
        color: Color(red: 0, green: 255, blue: 0),
      ),
      Sphere(
        center: Coordinate(x: -2, y: 0, z: 4),
        radius: 1,
        color: Color(red: 0, green: 0, blue: 255),
      ),
    ],
  );
  final raytracer = Raytracer(
    origin: origin,
    viewport: viewport,
    scene: scene,
  );
  final canvas = raytracer.render(
    canvasWidth: 512,
    canvasHeight: 512,
  );
  var serialized = '';
  for (var row = 0; row < canvas.rows; row++) {
    for (var column = 0; column < canvas.columns; column++) {
      final color = canvas[row][column];
      final r = color.red;
      final g = color.green;
      final b = color.blue;
      serialized += '$r;$g;$b';
      if (column != (canvas.columns - 1)) serialized += ',';
    }
    if (row != (canvas.rows - 1)) serialized += '\n';
  }
  print(serialized);
}
