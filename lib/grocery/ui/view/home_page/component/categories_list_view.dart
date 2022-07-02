import 'package:bpp_shop/grocery/ui/view/home_page/component/home_page_titles.dart';
import 'package:bpp_shop/models/grocery/categories.dart';
import 'package:bpp_shop/view_model/grocery/http_categories.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class CategoriesListView extends StatelessWidget {
  CategoriesListView({Key? key}) : super(key: key);
  final CarouselController? _carouselSlider = CarouselController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:getGroceryCategories(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      List<GCategory> get = snapshot.data ??
          <GCategory>[];
      return Column(
        children: [
          CustomHomePageTitles(
            leadingTitle: "Categories",
            trailingTitle: "See All",
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 130,
            width: MediaQuery.of(context).size.width,
            child:
            CarouselSlider.builder(

                itemCount:get.length,
                options: CarouselOptions(
                    viewportFraction:.2,
                    initialPage: 0,
                    reverse: false,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(
                      milliseconds: 2000,
                    ),
                    height: MediaQuery.of(context).size.height
                ),
                carouselController: _carouselSlider,
                itemBuilder:
                    (context, int i, int pageViewIndex) {
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                         margin: EdgeInsets.only(top: 4,bottom: 5,left: 10,right:5),
                          // height: 55,
                          // width: 55,
                          child: CircleAvatar(

                            backgroundColor: Colors.white,
                            radius: 40,
                            backgroundImage:get[i].categoryImage!= null? NetworkImage(
                                "https://bppshops.com/${get[i].categoryImage}"):NetworkImage('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,

                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                        ),

                        Center(
                            child: Text(
                                "${get[i].categoryName}",style: TextStyle(fontSize: 12),)),
                      ],
                    ),
                  );
                }
                ),
          ),
        ],
      );
    }
    else {
    return Column(
        children: [
        Shimmer(
        duration: Duration(seconds: 2), //Default value
      interval:
      Duration(seconds: 1), //Default value: Duration(seconds: 0)
      color: Colors.black, //Colors.grey.shade700, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
      height: 30,
      width: double.infinity,
      decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(6),

      ),
      ),
      ),

      Container(
        margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: Shimmer(
      duration: Duration(seconds: 2), //Default value
      interval: Duration(
      seconds: 1), //Default value: Duration(seconds: 0)
      color: Colors
          .black, //Colors.grey.shade700, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: ShimmerDirection.fromLTRB(),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor:Colors.grey.shade300 ,
          radius:30,
          ),
          CircleAvatar(
            backgroundColor:Colors.grey.shade300 ,
            radius:30,
          ),
          CircleAvatar(
            backgroundColor:Colors.grey.shade300 ,
            radius:30,
          ),
          CircleAvatar(
            backgroundColor:Colors.grey.shade300 ,
            radius:30,
          ),
          CircleAvatar(
            backgroundColor:Colors.grey.shade300 ,
            radius:30,
          ),
        ],
      ),
      ),
      ),
      ],)
      ;}
    }
    );
  }
}
