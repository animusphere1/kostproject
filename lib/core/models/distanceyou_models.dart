class DistanceYouModel {
  final bool? isBookmark;
  final String? name;

  DistanceYouModel({this.isBookmark, this.name});

  factory DistanceYouModel.fromMap(Map<String, dynamic> map) {
    return DistanceYouModel(isBookmark: true, name: map['name'] ?? 'Kosong');
  }
}
