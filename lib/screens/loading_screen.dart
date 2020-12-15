import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getlocationData();
  }


  void getlocationData()async{
  WeatherModel weatherModel=WeatherModel();
  var weatherdata=await weatherModel.getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder:(context){
    return LocationScreen(locationWeather: weatherdata,);
  }),);
  }



  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter, colors: [Color(0xff81cde7), Color(0xff9dd7ea)]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:Column(
          children: [
            SizedBox(height: 250,),
            Expanded(
              flex: 2,
                child: Image.asset('images/1.png')),
            Expanded(
              flex: 4,
                child: SpinKitFadingCircle(color:Colors.white)),
          ],
        )
      ),
    );
  }
}
