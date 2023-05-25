import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductHomeWidget extends StatelessWidget {

  String image ;
  String title ;
  double price ;

  ProductHomeWidget ({required this.price , required this.title , required this.image});
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration (
       borderRadius: BorderRadius.circular(20),
       color: Colors.grey.shade200 ,
     ),
     child: Column (
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Expanded(
           flex: 3,
           child: Image(image: NetworkImage(image) ,
             fit: BoxFit.fill,
             width: MediaQuery.of(context).size.width*0.4,
            ),
         ),
         SizedBox(height: 10,),
         Expanded(
           child: Text (title , style: TextStyle (color: Colors.black, fontWeight: FontWeight.bold,
           fontSize: 12),),
         ),
         Expanded(child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 10),
           child: Row (
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text ("${price}" , style: TextStyle (color: Colors.black , fontWeight: FontWeight.normal),),
               Icon(Icons.favorite)
             ],
           ),
         ))
       ],
     ),
   );
  }
}