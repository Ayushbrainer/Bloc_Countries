import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiduara_intern/Bloc/API_Bloc.dart';
import 'package:kiduara_intern/Network/PODO.dart';
import 'package:kiduara_intern/uI/customCard.dart';
import 'package:kiduara_intern/uI/gridView.dart';

class countriesPage extends StatefulWidget {
  @override
  _countriesPageState createState() => _countriesPageState();
}

class _countriesPageState extends State<countriesPage> {
   final countries = CountriesBloc();
   Country country = Country.fromJson({
     "name": "Afghanistan",
     "topLevelDomain": [
       ".af"
     ],
     "alpha2Code": "AF",
     "alpha3Code": "AFG",
     "callingCodes": [
       "93"
     ],
     "capital": "Kabul",
     "altSpellings": [
       "AF",
       "Afġānistān"
     ],
     "region": "Asia",
     "subregion": "Southern Asia",
     "population": 27657145,
     "latlng": [
       33.0,
       65.0
     ],
     "demonym": "Afghan",
     "area": 652230.0,
     "gini": 27.8,
     "timezones": [
       "UTC+04:30"
     ],
     "borders": [
       "IRN",
       "PAK",
       "TKM",
       "UZB",
       "TJK",
       "CHN"
     ],
     "nativeName": "افغانستان",
     "numericCode": "004",
     "currencies": [
       {
         "code": "AFN",
         "name": "Afghan afghani",
         "symbol": "؋"
       }
     ],
     "languages": [
       {
         "iso639_1": "ps",
         "iso639_2": "pus",
         "name": "Pashto",
         "nativeName": "پښتو"
       },
       {
         "iso639_1": "uz",
         "iso639_2": "uzb",
         "name": "Uzbek",
         "nativeName": "Oʻzbek"
       },
       {
         "iso639_1": "tk",
         "iso639_2": "tuk",
         "name": "Turkmen",
         "nativeName": "Türkmen"
       }
     ],
     "translations": {
       "de": "Afghanistan",
       "es": "Afganistán",
       "fr": "Afghanistan",
       "ja": "アフガニスタン",
       "it": "Afghanistan",
       "br": "Afeganistão",
       "pt": "Afeganistão",
       "nl": "Afghanistan",
       "hr": "Afganistan",
       "fa": "افغانستان"
     },
     "flag": "https://restcountries.eu/data/afg.svg",
     "regionalBlocs": [
       {
         "acronym": "SAARC",
         "name": "South Asian Association for Regional Cooperation",
         "otherAcronyms": [

         ],
         "otherNames": [

         ]
       }
     ],
     "cioc": "AFG"
   });
   bool isGrid = true;
  @override
  void initState() {
    // TODO: implement initState
    countries.eventSink.add(eventAction.fetch);
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Text(""),
        title: Text("Countries in Asia"),
        backgroundColor: Color(0xFF93329e),
        elevation: 0.0,
        actions: [
          PopupMenuButton(itemBuilder: (context){
            return [
              PopupMenuItem(child: InkWell(
                onTap: (){
                  setState(() {
                    isGrid = true;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.grid_view,
                    color: Colors.black,),
                    Text("Grid View")
                  ],
                ),
              ),
              value: true,),
              PopupMenuItem(child: InkWell(
                onTap: (){
                  setState(() {
                    isGrid = false;
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.list,
                    color: Colors.black,),
                    Text("List View")
                  ],
                ),
              ),value: false,)
            ];
          })
        ],
      ),
      backgroundColor: Color(0xFF93329e),
      body: StreamBuilder<Countries>(
        initialData: Countries(countries: [country]),
        stream: countries.countriesStream,
        builder: (context,AsyncSnapshot<Countries> snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              List<Country> countryData = snapshot.data.countries;
              return (isGrid)?PageView.builder(itemBuilder: (context,index){
                return gridCard(country: countryData[index],);
              },
                itemCount: countryData.length,
              ):ListView.builder(itemBuilder: (context,index){
                return customCard(country: countryData[index],);
              },
                itemCount: countryData.length
                ,);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
