import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_hh/models/Hotel.dart';

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
        child: InkWell(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: hotel.imageUrl!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 50,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(hotel.name),
                  Text('Only ${hotel.pricesLeft} of these prices left'),
                  hotel.creditCardNeededForCancellation!
                      ? const Text(
                          'Reservation Possible without a credit card. FREE cancellation.')
                      : const Text('Credit card needed for cancellation'),
                  hotel.breakfastIncluded! ?
                      const Text("Breakfast Included") :
                      const Text('Breakfast not included'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
