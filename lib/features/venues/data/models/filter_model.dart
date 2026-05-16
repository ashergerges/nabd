class FilterModel {
  final double? minPrice;
  final double? maxPrice;
  final String? date;

  const FilterModel({
    this.minPrice,
    this.maxPrice,
    this.date,
  });

  FilterModel copyWith({
    double? minPrice,
    double? maxPrice,
    String? date,
  }) {
    return FilterModel(
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      date: date ?? this.date,
    );
  }
}