class Plant {
  final String name;
  final String type;
  final List<String> image;
  final String price;
  final int minHeight;
  final int maxHeight;
  final int minTemperature;
  final int maxTemperature;
  final String potType;
  final String description;

  Plant({
    required this.minHeight,
    required this.maxHeight,
    required this.minTemperature,
    required this.maxTemperature,
    required this.potType,
    required this.name,
    required this.type,
    required this.image,
    required this.price,
    required this.description,
  });
}
