import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/app_routes.dart';
import 'package:my_app/home/home_cubit.dart';
import 'package:my_app/home/product_home_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = AppRoutes.homeRoute;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();



  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    bloc.bannerFun();
    bloc.categoryFun();
    bloc.productsHomeFun();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessState){
          print("banner data");
        }else if (state is FailedState){
          showDialog(context: context, builder: (context) => AlertDialog(
            backgroundColor: Colors.red,
            content: Text (state.message , style: TextStyle(color: Colors.white),),
          ));
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: state is LoadingState? Center(child: CircularProgressIndicator(
                color: Colors.red))
                : Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (text){
                       bloc.searchFun(text) ;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                      ),
                      hintText: "Search" ,
                      prefixIcon: Icon (Icons.search , color: Colors.green,) ,
                      suffixIcon: Icon(Icons.cancel, color: Colors.green) ,
                      filled: true ,
                      fillColor: Colors.grey.withOpacity(0.2),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)
                      ),
                    ),
                  ),
                ),
                
                Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                     itemCount: 3,
                      controller: controller,
                        itemBuilder: (context , index) => Container(
                          child: Image(image: NetworkImage(bloc.bannersModel!.data![index].image)
                            ,fit: BoxFit.fill,),
                        )),
                  ),
                ),
                SizedBox(height: 10,),
                SmoothPageIndicator(
                  controller: controller,
                  count:  3,
                  axisDirection: Axis.horizontal,
                  effect:  WormEffect(
                      spacing:  8.0,
                      radius:  30,
                      dotWidth:  15,
                      dotHeight:  16.0,
                      paintStyle:  PaintingStyle.stroke,
                      strokeWidth:  1.5,
                      dotColor:  Colors.grey,
                      activeDotColor:  Colors.green
                  ),
                ) ,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text ("Categories" , style: Theme.of(context).textTheme.bodyLarge,),
                      Text ("View all" , style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height*0.12,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index) => CircleAvatar(
                        radius: 37,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(bloc.categoriesModel!.data.data[index].image),
                      ),
                      separatorBuilder: (context , index) => SizedBox(width: 10,),
                      itemCount: bloc.categoriesModel!.data.data.length),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text ("Products" , style: Theme.of(context).textTheme.bodyLarge,),
                      Text ("View all" , style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
               Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: GridView.builder(
                       itemCount: bloc.filteredList.isEmpty ?
                       bloc.productsHomeModel?.data.products.length : bloc.filteredList.length,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2 ,
                           crossAxisSpacing: 10 ,
                           mainAxisSpacing: 10,
                           childAspectRatio: 0.7
                         ),
                         itemBuilder: (context , index) => Container(
                           child: bloc.filteredList.isEmpty ?
                           ProductHomeWidget (
                             image: bloc.productsHomeModel!.data.products[index].image,
                             title: bloc.productsHomeModel!.data.products[index].name,
                             price: bloc.productsHomeModel!.data.products[index].price,
                           ) : ProductHomeWidget (
                             image: bloc.filteredList[index].image,
                             title: bloc.filteredList[index].name,
                             price: bloc.filteredList[index].price,
                           )))
                   ))
              ],
            )
          ),
        );
      },
    );
  }
}