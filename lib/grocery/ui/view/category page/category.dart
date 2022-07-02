import 'package:bpp_shop/models/grocery/categories.dart';
import 'package:bpp_shop/view_model/grocery/http_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/controller/app_state_controller.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  _AllCategoryState createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
  @override
  Widget build(BuildContext context) {
    final pageState=Provider.of<AppStateController>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            pageState.setAppBarViewState(true);
            pageState.setPrimaryPageState(true);
          },
          child: Icon(
            Icons.arrow_back_ios_outlined,
            size: 25,
            color: Colors.black,
          ),
        ),
        title: Center(
          child: Text(
            "All categories",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.search, size: 30, color: Colors.grey),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getGroceryCategories(),
        builder: (BuildContext context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            List<GCategory> get= snapshot.data??<GCategory>[];
            return    GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3
              ),
              itemCount: get.length,
              itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: (){
                    pageState.setTertiaryCurrentIndex(1);
                    pageState.setTertiaryPageState(true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: Image(
                            image:get[index].categoryImage!=null? NetworkImage("https://bppshops.com/${get[index].categoryImage}"):
                            NetworkImage('https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'),
                            fit: BoxFit.cover,
                          ),
                          radius: 35,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${get[index].categoryName}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
    
      ),
    );
  }
}
