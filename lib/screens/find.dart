import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_hh/widgets/HotelWidget.dart';
import '../services/HotelService.dart' as hotel_service;

import '../models/Hotel.dart';

class Find extends StatefulWidget {
  const Find({Key? key}) : super(key: key);

  @override
  State<Find> createState() => _FindState();
}

class _FindState extends State<Find> {
  //initialize the hotel list future
  late Future<List<Hotel>> futureListHotels;

  @override
  void initState() {
    super.initState();

    //fetch all hotels into the Future list
    futureListHotels = hotel_service.fetchAllHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: const [],
      ),
      body: FutureBuilder<List<Hotel>>(
        future: futureListHotels,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //if the snapshot has data render them

            //assign the data to a list of hotels
            List<Hotel>? hotels = snapshot.data;

            //return a list view
            return ListView.builder(
              //get the hotel list length as the item count
              //itemCount: hotels!.length,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                //return the hotel widget with the current hotel of the list
                return HotelWidget(hotel: hotels![index]);
              },
            );
          } else if (snapshot.hasError) {
            //if the snapshot has no data show the related message
            return Text('{${snapshot.error}');
          }
          return const Center(
            child: Text('loading'),
          );
        },
      ),
    );
  }
}
