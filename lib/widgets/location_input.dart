import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget{
  @override
  _LocationInput createState() => _LocationInput();
}
class _LocationInput extends State<LocationInput>{
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        height: 150,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.greenAccent, border: Border.all(width: 1, color: Colors.grey)),
        child: _previewImageUrl == null ? Text('No location Choosen', textAlign: TextAlign.center,) : Image.network(_previewImageUrl!, fit: BoxFit.cover, width: double.infinity,),
      ),
      Row(children: <Widget>[
        TextButton.icon(onPressed: (){}, icon: Icon(Icons.location_on), label: Text('Current Location', style: TextStyle(color: Theme.of(context).primaryColor),),),
        TextButton.icon(onPressed: (){}, icon: Icon(Icons.map), label: Text('Select on Map', style: TextStyle(color: Theme.of(context).accentColor),),),
      ],)
    ],
    );
  }
}