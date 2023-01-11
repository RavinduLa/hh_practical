class Hotel {
  late String id;
  late String name;
  late bool? breakfastIncluded;
  late bool? creditCardNeededForCancellation;
  late String? imageUrl;

  Hotel({required this.id, required this.name, this.breakfastIncluded,
      this.creditCardNeededForCancellation, this.imageUrl});

  factory Hotel.fromjson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['title'],
      breakfastIncluded: true,
      creditCardNeededForCancellation: false,
      imageUrl: json['url']
    );
  }
}
