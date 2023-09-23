class Color {
  final int red;
  final int green;
  final int blue;

  const Color({
    required this.red,
    required this.green,
    required this.blue,
  });

  @override
  String toString() {
    return 'Color(red: $red, green: $green, blue: $blue)';
  }
}
