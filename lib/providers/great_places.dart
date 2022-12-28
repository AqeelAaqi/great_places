import 'dart:io';

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage){
    final newPlace = Place(id: DateTime.now().toString(), title: pickedTitle, location: PlaceLocation(latitude: 0.0, longitude: 0.0), image: pickedImage);
    _items.add(newPlace);
    notifyListeners();
  }
}
