import 'dart:collection';

import 'package:flutter/cupertino.dart';
import './Hotel.dart';

class SavedHotels extends ChangeNotifier {
  //the list of saved hotels
  final List<Hotel> _hotels = [];

  //an unmodifiable view of hotels in the saved list
  UnmodifiableListView<Hotel> get hotels => UnmodifiableListView(_hotels);

  //method to add an hotel to the saved list
  void add(Hotel hotel){
    _hotels.add(hotel);
    notifyListeners();
  }

  //method to delete a specified hotel object from the list
  void removeHotel(Hotel hotel){
    _hotels.remove(hotel);
    notifyListeners();
  }

  //method to clear the current saved items list
  void removeAll(){
    _hotels.clear();
    notifyListeners();
  }
}
