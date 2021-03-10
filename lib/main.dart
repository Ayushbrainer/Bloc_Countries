import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiduara_intern/uI/mainPage.dart';

void main() => runApp(
  MaterialApp(
    home: onBoard(),
  )
);

class onBoard extends StatefulWidget {
  @override
  _onBoardState createState() => _onBoardState();
}

class _onBoardState extends State<onBoard> {
  final int totalPages = 5;
  PageController pageController = new PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildOnBoardingPages(){
    List<Widget> list = [];
    for(int i=0;i<totalPages;i++){
      list.add((i==_currentPage)?indicator(true,false):(i>_currentPage)?indicator(false, true):indicator(false,false));
    }
    return list;
  }

  Widget indicator(bool isActive,bool isGone){
    return AnimatedContainer(duration: Duration(milliseconds: 200),
    height: 30,
    width: 30,
    padding: EdgeInsets.all(3),
    margin: EdgeInsets.all(2),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.purpleAccent,width: 5),
      shape: BoxShape.circle,
      color: Colors.white
    ),
      child: (isActive)?Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
        ),
      ):(isGone)?Text(""):Container(
        height: 22,
        width: 22,
        decoration: BoxDecoration(
          color: Colors.black87,
          shape: BoxShape.circle,
        ),
        child: Container(child: Icon(Icons.check,color: Colors.white,size: 10,)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child:AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: _buildOnBoardingPages(),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: 500,
                margin: EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: PageView(
                  controller: pageController,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.black87,
                      child: Text("Page 1"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.purple,
                      child: Text("Page 2"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      child: Text("Page 3"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.amberAccent,
                      child: Text("Page 4"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.green,
                      child: Text("Page 5"),
                    )
                  ],
                  onPageChanged: (page){
                    setState(() {
                      _currentPage = page;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purpleAccent,
        elevation: 10,
        onPressed: (){
          pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          if(pageController.page==4){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>countriesPage()));
          }
        },
        icon: Icon(Icons.navigate_next),
        label: Text("Next"),
      ),
    );
  }
}
