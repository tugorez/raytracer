import 'package:raytracer/raytracer.dart';

void main() {
  final origin = Coordinate(x: 0, y: 0, z: 0);
  final canvas = Canvas(
    width: 256,
    height: 256,
  );
  final viewport = Viewport(
    center: Coordinate(x: 0, y: 0, z: 1),
    width: 10,
    height: 10,
  );
  final scene = Scene(
    spheres: [
      Sphere(
        center: Coordinate(x: 0, y: 0, z: 10),
        radius: 2,
        color: Color(red: 255, green: 0, blue: 0),
      ),
    ],
  );

  final raytracer = Raytracer(
    origin: origin,
    viewport: viewport,
    scene: scene,
    canvas: canvas,
  );

  print(canvas);
  print(origin);
  print(viewport);
  print(scene);
  print(raytracer);
}
