import 'package:bpp_shop/fashion/view/home_page/component/app_color.dart';
import 'package:flutter/material.dart';

class MostPopularProduct extends StatefulWidget {
  const MostPopularProduct({Key? key}) : super(key: key);

  @override
  State<MostPopularProduct> createState() => _MostPopularProductState();
}

class _MostPopularProductState extends State<MostPopularProduct> {
  bool isLatest = true;
  bool isSale = false;
  bool isRate = false;

  List productsList = [
    {
      'image': 'assets/banner.png',
      'name': 'Men',
      'price': '\$2000',
      'discount': '\$2500'
    },
    {
      'image': 'assets/banner.png',
      'name': 'Women',
      'price': '\$2000',
      'discount': '\$2500'
    },
    //{'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    //{'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Men','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/banner.png', 'name': 'Women','price':'\$2000','discount':'\$2500'},
    // {'image': 'assets/pic3.png', 'name': 'Kids','price':'\$2000','discount':'\$2500'},
    {
      'image': 'assets/banner.png',
      'name': 'Men',
      'price': '\$2000',
      'discount': '\$2500'
    },
    {
      'image': 'assets/banner.png',
      'name': 'Women',
      'price': '\$2000',
      'discount': '\$2500'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: appColor().mainColor,
                  height: 35,
                  child: Center(
                      child: Text(
                    'Most Popular Products',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  height: 35,
                  child: Text(''),
                ),
              ),
            ],
          ),
   SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        isLatest = true;
                        isSale = false;
                        isRate = false;
                      });
                    }),
                    child: Text(
                      'All Products',
                      style: TextStyle(
                          color: isLatest
                              ? appColor().mainColor
                              : appColor().soft_grey_color,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
             
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLatest = false;
                        isSale = true;
                        isRate = false;
                      });
                    },
                    child: Text(
                      'Fashion',
                      style: TextStyle(
                          fontSize: 15,
                          color: isSale
                              ? appColor().mainColor
                              : appColor().soft_grey_color),
                    ),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Container(
                  //   height: 2,
                  //   width: 55,
                  //   color: appColor().mainColor,
                  // )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLatest = false;
                        isSale = false;
                        isRate = true;
                      });
                    },
                    child: Text(
                      'Electronics',
                      style: TextStyle(
                          fontSize: 15,
                          color: isRate
                              ? appColor().mainColor
                              : appColor().soft_grey_color),
                    ),
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  // Container(
                  //   height: 2,
                  //   width: 70,
                  //   color: appColor().mainColor,
                  // )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 3,
          ),
          // Stack(
          //   children: [
          //     Container(height: 2, color: Colors.white),
          //     Container(
          //         height: 2,
          //         width: 97,
          //         color: isLatest
          //             ? appColor().mainColor
          //             : appColor().soft_grey_color),
          //     Positioned(
          //       left: 188,
          //       child: Container(
          //           height: 2,
          //           width: 55,
          //           color: isSale
          //               ? appColor().mainColor
          //               : appColor().soft_grey_color),
          //     ),
          //     Positioned(
          //       left: 335,
          //       child: Container(
          //           height: 2,
          //           width: 80,
          //           color: isRate
          //               ? appColor().mainColor
          //               : appColor().soft_grey_color),
          //     )
          //   ],
          // ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
            // 2
            //addAutomaticKeepAlives: true,
            itemCount: productsList.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLatest
                    ? 2
                    : isSale
                        ? 3
                        : isRate
                            ? 4
                            : 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: isRate ? 0.7 : 0.8),
            // padding: EdgeInsets.all(8),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // 3
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 10.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            width: double.infinity,
                            //height: (MediaQuery.of(context).size.width - 36) / 3.5,
                            height:
                                (MediaQuery.of(context).size.width - 36) / 3.8,
                            // height: 200,

                            child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.zero),
                                child: Image.asset(
                                  productsList[index]['image'],
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                ))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              productsList[index]['name'],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 15,
                                  height: 1.2,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text(
                                  productsList[index]['price'],
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              isRate == false
                                  ? Padding(
                                      padding: EdgeInsets.fromLTRB(8, 0, 8, 3),
                                      child: Text(
                                        productsList[index]['discount'],
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 13,
                                            color: appColor().red_color,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                                width: 88,
                               // height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: appColor().buttonColor,
                                ),
                           padding: EdgeInsets.only(bottom: 4),
                                child: Center(
                                    child: Text(
                                  'Shop Now',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ))),
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      )
                    ]),
              );
            },
          ),
        SizedBox(
            height: 16,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Text('View All',style: TextStyle(fontSize: 16,color: appColor().mainColor),),
          Icon(Icons.arrow_forward,color: appColor().mainColor)
        ],)],
      ),
    );
  }
}
