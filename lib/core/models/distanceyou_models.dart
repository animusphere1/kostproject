class DistanceYouModel {
  final bool? isBookmark;
  final String? name;

  DistanceYouModel({this.isBookmark, this.name});

  factory DistanceYouModel.fromMap(Map<String, dynamic> map) {
    String? nameLocal;

    if (map.containsKey('name')) {
      nameLocal = map['name'];
    }

    return DistanceYouModel(
      isBookmark: map['isBookmark'] ?? false,
      name: nameLocal ?? '',
    );
  }
}
