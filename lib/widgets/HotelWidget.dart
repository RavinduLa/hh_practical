import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_hh/models/Hotel.dart';
import 'package:sample_project_hh/models/SavedHotels.dart';

class HotelWidget extends StatelessWidget {
  const HotelWidget({
    Key? key,
    required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Image url: ${hotel.imageUrl}');
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 5,
        child: InkWell(
          onLongPress: () {
            _addToSaved(hotel, context);
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text("Added to saved"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 140,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: hotel.imageUrl!,
                    height: 200,
                    width: 150,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Image(
                      image: AssetImage('assets/image_placeholder.jpg'),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LimitedBox(
                  maxWidth: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          hotel.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text('• Only ${hotel.pricesLeft} of these prices left'),
                      hotel.creditCardNeededForReservation!
                          ? const Text('• Credit card needed for reservation')
                          : const Text(
                              '• Reservation Possible without a credit card. FREE cancellation.',
                              textAlign: TextAlign.start,
                            ),
                      hotel.breakfastIncluded!
                          ? const Text("• Breakfast Included")
                          : const Text('• Breakfast not included'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //save the hotel to the saved list calling the provider method
  void _addToSaved(Hotel hotel, BuildContext context) {
    Provider.of<SavedHotels>(context, listen: false).add(hotel);
  }
}
