import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiduara_intern/Network/PODO.dart';
import 'package:kiduara_intern/uI/datailedCard.dart';

class customCard extends StatelessWidget {
  Country country;
  customCard({this.country});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>detailedCard(country: country,)));
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 100,
                alignment: Alignment.center,
                height: 100,
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFf4f9f9)
                ),
                child: SvgPicture.network(country.flag,alignment: Alignment.center,fit: BoxFit.fill,)),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    child: Text("Name:  ${country.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Colors.black
                    ),),
                    width: MediaQuery.of(context).size.width*0.62,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.62,
                    child: Text("Capital:  ${country.capital}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),textAlign: TextAlign.start,),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.62,
                    child: Text("Region: ${country.region}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.09),
                    alignment: Alignment.bottomRight,
                      width: MediaQuery.of(context).size.width*0.5,
                      height: 20,
                      child: Text("Press me for more info"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
