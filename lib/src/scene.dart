import 'sphere.dart';

class Scene {
  final List<Sphere> spheres;

  const Scene({required this.spheres});

  @override
  String toString() {
    return 'Scene(spheres: $spheres);';
  }
}
