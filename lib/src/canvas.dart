import 'color.dart';

class Canvas {
  final int rows;
  final int columns;
  late final _values = [
    for (var i = 0; i < rows; i++)
      [
        for (var j = 0; j < columns; j++)
          Color(
            red: 255,
            green: 255,
            blue: 255,
          ),
      ],
  ];

  Canvas({required this.rows, required this.columns});

  @override
  String toString() => 'Canvas(rows: $rows, columns: $columns)';

  List<Color> operator [](int row) => _values[row];
}
