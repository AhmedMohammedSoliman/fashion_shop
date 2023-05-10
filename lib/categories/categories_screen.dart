import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoriesScreen extends StatefulWidget {

  static const String routeName = AppRoutes.categoriesRoute;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int touchIndex = -1 ;
  List <PieChartSectionData> getSections () => PieData.data.asMap()
  .map<int , PieChartSectionData>((index, data) {

    final value = PieChartSectionData(
   color: data.color ,
      value: data.percent ,
      title: "${data.percent} %" ,
      titleStyle: TextStyle (
        color: Colors.white ,
        fontSize: 16 ,
        fontWeight: FontWeight.bold
      )
    );
    return MapEntry(index, value);
  }).values.toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (flTouchEvent, pieTouchResponse){
                        setState(() {

                        });
                    } ,
                    ),
                    centerSpaceRadius: 60,
                    sectionsSpace: 6,
                    sections: getSections ()
                  )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IndicatorWidget () ,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget indicatorIcon ({required String text , required Color color ,
      Color textColor = Colors.white}){
    return Container(
      margin: EdgeInsets.all(20),
      child: Row (
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration (
              color: color ,
              shape: BoxShape.circle
            ),
          )
        ],
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: PieData.data.map((data) {
        return indicatorIcon (color: data.color , text: data.name);
      }).toList(),
    );
  }

  Widget indicatorIcon ({required String text , required Color color ,
    Color textColor = Colors.black}){
    return Row (
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration (
              color: color ,
              shape: BoxShape.circle
          ),
        ) ,
        SizedBox(width: 10,),
        Text (text , style: TextStyle (color: textColor),)
      ],
    );
  }

}

class PieData {

  static List <Data> data = [
    Data(name: "blue", color: Colors.blue, percent: 38),
    Data(name: "green", color: Colors.green, percent: 20),
    Data(name: "red", color: Colors.red, percent: 15),
    Data(name: "black", color: Colors.black, percent: 34),
  ];
}

class Data {

  String name ;
  double percent ;
  Color color ;

  Data ({required this.name , required this.color , required this.percent});
}