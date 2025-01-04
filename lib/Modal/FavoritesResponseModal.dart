class FavoritesResponseModel {
  late final String title;
  late final String images;
  late final String ratings;
  late final String amount;
  final bool isFavorite;

  FavoritesResponseModel({
    required this.title,
    required this.images,
    required this.ratings,
    required this.amount,
    this.isFavorite = false, // Default value
  });

  // Add copyWith method
  FavoritesResponseModel copyWith({
    String? title,
    String? images,
    String? ratings,
    String? amount,
    bool? isFavorite,
  }) {
    return FavoritesResponseModel(
      title: title ?? this.title,
      images: images ?? this.images,
      ratings: ratings ?? this.ratings,
      amount: amount ?? this.amount,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
