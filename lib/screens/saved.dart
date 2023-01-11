import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project_hh/models/SavedHotels.dart';
import 'package:sample_project_hh/widgets/HotelWidget.dart';

/*
* The saved hotel page is intended only to demonstrate the use of provider.
* The saved items are only stored in the app's memory while running.
* In an actual scenario the items will have to be persisted in a remote or local data store
* To add hotels to saved list long press the hotel tile in the find menu.
* The saved list can be cleared using the delete button available in the app bar
* */

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedHotels>(
      builder: (context, savedHotels, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: const Text(
                              'Remove all saved items from the list?'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text("This cannot be undone")
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                savedHotels.removeAll();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete_forever),
              ),
            ],
          ),
          body: savedHotels.hotels.isEmpty
              ? const Center(
                  child: Text(
                    "No Saved Hotels",
                    style: TextStyle(fontSize: 25),
                  ),
                )
              : ListView.builder(
                  itemCount: savedHotels.hotels.length,
                  itemBuilder: (context, index) {
                    return HotelWidget(hotel: savedHotels.hotels[index]);
                  },
                ),
        );
      },
    );
  }
}
