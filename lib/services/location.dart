import 'package:geolocator/geolocator.dart';
class Location{
  double longitude;
  double latitude;

  Future<void> getcurrentlocation() async{
    try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    longitude=position.longitude;
    latitude=position.latitude;
    }
    catch(e){

    }
  }
}