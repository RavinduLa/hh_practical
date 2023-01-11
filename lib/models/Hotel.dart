/*
* Class for hotel
* */

class Hotel {
  late int id;
  late String name;
  late int pricesLeft;
  late bool? breakfastIncluded;
  late bool? creditCardNeededForReservation;
  late String? imageUrl;

  Hotel({required this.id, required this.name, required this.pricesLeft, this.breakfastIncluded,
      this.creditCardNeededForReservation, this.imageUrl});

  factory Hotel.fromjson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      name: json['name'],
      pricesLeft: json['pricesLeft'],
      breakfastIncluded: json['breakfastIncluded'],
      creditCardNeededForReservation: json['creditCardNeededForReservation'],
      imageUrl: json['imageUrl']
    );
  }
}
