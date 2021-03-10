import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiduara_intern/Network/PODO.dart';

class detailedCard extends StatelessWidget {
  detailedCard({this.country});
  Country country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${country.name}",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white
        ),),
        backgroundColor: Colors.purpleAccent,
      ),
      backgroundColor: Colors.purpleAccent,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(6),
              child: SvgPicture.network(country.flag,fit: BoxFit.fill,)),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.5,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("Capital:  ${country.capital}",style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("Region:  ${country.region}",style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("Sub-Region:  ${country.subregion}",style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("Population:  ${country.population}",style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  child: Text("Borders:  ${(country.borders.isEmpty)?"There are no bordering countries":country.borders}",style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),),
                ),
                Text("Languages spoken here:",style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),),
                Container(
                  margin: EdgeInsets.all(6),
                  height: 150,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Text("${country.languages[index].name}",
                    style:  TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                      ),);
                  },
                  itemCount: country.languages.length,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
