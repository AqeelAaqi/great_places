import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/add_places_screen.dart';
import 'package:great_places/screens/place_details_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Places'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: Provider.of<GreatPlaces>(context, listen: false)
                .fetchAndSetPlaces(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (ctx, greatPlaces, childText) => greatPlaces
                            .items.isEmpty
                        ? const Center(
                            child:
                                Text('No places added yet. Start adding now!'),
                          )
                        : Center(
                            child: ListView.builder(
                              itemCount: greatPlaces.items.length,
                              itemBuilder: (ctx, index) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greatPlaces.items[index].image),
                                ),
                                title: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    greatPlaces.items[index].title,
                                  ),
                                ),
                                subtitle: Text(
                                    greatPlaces.items[index].location.address),
                                onTap: () {
                                  // The arguments here is how we pass data to the detail screen and how we also fulfill the 'id' variable in place_detail_screen which takes from ModalRoute...settings.arguments
                                  Navigator.of(context).pushNamed(
                                      PlaceDetailScreen.routeName,
                                      arguments: greatPlaces.items[index].id);
                                },
                              ),
                            ),
                          ),
                  ),
          ),
        ));
  }
}
