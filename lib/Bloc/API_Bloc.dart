import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:kiduara_intern/Network/PODO.dart';

enum eventAction{
  fetch
}

class CountriesBloc {
  final stateStreamController = StreamController<Countries>.broadcast();

  StreamSink<Countries> get _countriesSink => stateStreamController.sink;
  Stream<Countries> get countriesStream => stateStreamController.stream;

  final eventStreamController = StreamController<eventAction>();
  StreamSink<eventAction> get eventSink => eventStreamController.sink;
  Stream<eventAction> get _eventStream => eventStreamController.stream;

  CountriesBloc(){
    _eventStream.listen((event) async{
      if(event == eventAction.fetch){
        try {
          var countries = await getData();
          _countriesSink.add(countries);
        } on Exception catch (e) {
          _countriesSink.addError("Something went wrong");
        }
      }
    });
  }

  Future<Countries> getData() async{
    Response response = await get(Uri.encodeFull("https://restcountries.eu/rest/v2/region/asia"));
    print('got ${response.statusCode}');

    if(response.statusCode==200){
      print("Data Fetch Successful");
      return Countries.fromJSON(jsonDecode(response.body));
    }else{
      throw Exception("There was an error fetching data from server");
    }
  }
}