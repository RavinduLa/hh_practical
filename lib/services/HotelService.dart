import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:sample_project_hh/models/Hotel.dart';

//A dummy backend API was used.
//Some of the data was hardcoded since the dummy API did not have the exact type of data
//const baseApiLink = "https://jsonplaceholder.typicode.com/photos?albumId=3";
const baseApiLink = "https://68acc110-b4d6-4a27-a822-3db30a9bf219.mock.pstmn.io/hotels";

/*
* Fetches all the hotel entries from the backend API
* */
Future<List<Hotel>> fetchAllHotels() async {
  //get the response asynchronously
  final response = await http.get(Uri.parse(baseApiLink));

  //check if the status code is 200
  if (response.statusCode == 200) {

    //if successful convert the JSON body into Hotel objects and return
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => Hotel.fromjson(e)).toList();
  } else {
    //In case of failed response throw an exception
    throw Exception('Failed to retrieve hotels');
  }
}
