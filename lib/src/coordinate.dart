class Coordinate {
  final double x;
  final double y;
  final double z;

  Coordinate({
    required this.x,
    required this.y,
    required this.z,
  });

  @override
  String toString() => 'Coordinate(x: $x, y: $y, z: $z)';
}
