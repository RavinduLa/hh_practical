class Hotel {
  late int id;
  late String name;
  late int pricesLeft;
  late bool? breakfastIncluded;
  late bool? creditCardNeededForCancellation;
  late String? imageUrl;

  Hotel({required this.id, required this.name, required this.pricesLeft, this.breakfastIncluded,
      this.creditCardNeededForCancellation, this.imageUrl});

  //some of the values had to be hardcoded since the dummy API used did not have relatable data.
  factory Hotel.fromjson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['title'],
      pricesLeft: 2,
      breakfastIncluded: true,
      creditCardNeededForCancellation: false,
      imageUrl: json['url']
    );
  }
}
