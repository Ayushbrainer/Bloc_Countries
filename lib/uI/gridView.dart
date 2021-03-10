import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiduara_intern/Network/PODO.dart';

class gridCard extends StatelessWidget {
  gridCard({this.country});
  Country country;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.95,
      width: MediaQuery.of(context).size.width*1,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.45,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: SvgPicture.network(country.flag,)),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(8),
            child: Text("Name: ${country.name}",style: TextStyle(
              fontSize: 22,
              color: Colors.black
            ),),),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            child: Text("Region: ${country.region}",style: TextStyle(
              color: Colors.black,
              fontSize: 22
            ),),),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            child: Text("Sub Region:  ${country.subregion}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22),),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            child: Text("Population: ${country.population}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22),),
          ),
          Container(
            padding: EdgeInsets.all(6),
            margin: EdgeInsets.all(5),
            child: Text("Languages: ",style: TextStyle(
              color: Colors.black,
              fontSize: 22
            ),),
          ),
          Container(
            height: 110,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(10),
            child: ListView.builder(itemBuilder: (context,index){
              return Text("${country.languages[index].name}",style: TextStyle(
                color: Colors.black,
                fontSize: 24
              ),);
            },
            itemCount: country.languages.length,),
          )
        ],
      ),
    );
  }
}
