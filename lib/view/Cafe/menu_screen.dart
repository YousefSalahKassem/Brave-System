import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/category_menu_controller.dart';
import 'package:bravesystem/controller/product_controller.dart';
import 'package:bravesystem/model/ServiceModel/category_menu_model.dart';
import 'package:bravesystem/view/Cafe/product_details.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/routes.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryMenuController());
    Get.put(ProductController());

    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorsApp().primary,
        title: const Icon(FontAwesomeIcons.mugHot,color: Colors.white,),
        actions: const [Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(radius: 30,backgroundImage: AssetImage('assets/images/ps4.png'),),
        )],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: Dimensions.screenWidth,
                height: Dimensions.height30*4,
                padding: EdgeInsets.symmetric(vertical: Dimensions.height30*1.5,horizontal: Dimensions.height30),
                decoration: BoxDecoration(
                  color: ColorsApp().primary,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.height30*2)),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 26)),),
                ),
              ),
              SizedBox(height: Dimensions.height30*1.5,),

              GetBuilder<CategoryMenuController>(
                builder: (controller){
                  return SizedBox(
                    width: Dimensions.screenWidth,
                    height: Dimensions.height30*1.2,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryMenu.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              controller.selectCurrentIndex(index);
                            },
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                    child: Text(categoryMenu[index].category,style: TextStyle(color: controller.currentIndex==index?ColorsApp().primary:ColorsApp().greyIcon,fontWeight: FontWeight.bold,fontSize: 18),),
                                  ),
                                ),
                                controller.currentIndex==index?Container(
                                  height: 3,
                                  margin: const EdgeInsets.only(top: 3),
                                  width: Dimensions.height30*1.5,
                                  decoration: BoxDecoration(
                                      color: ColorsApp().primary,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                ):Container()
                              ],
                            ),
                          );
                        }),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.only(right: 15.0,top: 8),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('see more..', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 14),),
                ),
              ),
              GetBuilder<ProductController>(
                builder: (controller){
                  return CarouselSlider.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context,index,_){
                        return InkWell(
                          onTap: (){
                            AppRoute.push(const ProductDetails(),name: 'productDetails');
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  height: Dimensions.height30*8,
                                  width: Dimensions.height30*50,
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: Dimensions.height30*6,
                                        width: Dimensions.width30*20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: const[
                                            BoxShadow(
                                              color: Colors.black45,
                                              offset: Offset(0, 7),
                                              blurRadius: 7,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:  [
                                            Padding(
                                              padding: EdgeInsets.only(top: Dimensions.height20,left: 15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Icon(controller.products[index].like==true?FontAwesomeIcons.solidHeart:FontAwesomeIcons.heart,color: ColorsApp().primary,),
                                                  SizedBox(height: Dimensions.height10,),
                                                  Text(controller.products[index].name, style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 16),),
                                                  SizedBox(height: Dimensions.height10,),
                                                  Text('${controller.products[index].price} LE',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
                                                  Text(controller.products[index].description, style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w500,fontSize: 12),maxLines: 3,),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Image.asset(controller.products[index].image,width: Dimensions.height30*5,)),

                                Positioned(
                                    bottom: 0,
                                    right: Dimensions.height15,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: ColorsApp().primary,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Icon(Icons.add,color: Colors.white,),
                                    ))

                              ],
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: Dimensions.height30*8.5,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: .9,

                      ));
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 8),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('Popular', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0,top: 8),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text('see more..', style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.w700,fontSize: 14),),
                    ),
                  ),

                ],
              ),
              SizedBox(height: Dimensions.height10,),
              GetBuilder<ProductController>(
                builder: (controller){
                  return SizedBox(
                      width: Dimensions.screenWidth,
                      height: Dimensions.height30*3.5,
                      child:InkWell(
                        onTap: (){
                          // AppRoute.push(const RoomDetails(),name: 'RoomDetails');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                height: Dimensions.height30*3,
                                width: Dimensions.screenWidth,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: Dimensions.height30*2.3,
                                      margin: EdgeInsets.symmetric(horizontal: Dimensions.height30),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: const[
                                          BoxShadow(
                                            color: Colors.black45,
                                            offset: Offset(0, 7),
                                            blurRadius: 7,
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          Padding(
                                            padding: EdgeInsets.only(top: Dimensions.height10,left: Dimensions.height30*2),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(controller.products[0].name, style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 16),),
                                                SizedBox(
                                                    width: Dimensions.height30*5,
                                                    child: Text(controller.products[0].description, style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w500,fontSize: 12),maxLines: 2,)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: Dimensions.height20,left: Dimensions.height10),
                                            child: Text('${controller.products[0].price} LE',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: Dimensions.height30,
                                  left: Dimensions.height30,
                                  child: Image.asset(controller.popularProducts[0].image,width: Dimensions.height30*2,)),

                              Positioned(
                                  bottom: 0,
                                  right: Dimensions.height15,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: ColorsApp().primary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Icon(Icons.add,color: Colors.white,),
                                  ))

                            ],
                          ),
                        ),
                      )
                  );
                },
              ),
            ],
          ),
          GetBuilder<ProductController>(
            builder: (controller){
              return Positioned(
                  top: Dimensions.height30*3.3,
                  left: Dimensions.height20*3,
                  right: Dimensions.height20*2.5,
                  child: Container(
                    height: Dimensions.height30*1.3,
                    width: Dimensions.screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const[
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 3),
                          blurRadius: 7,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.search,color: ColorsApp().primary,),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: TextFormField(
                            controller: controller.search,
                            style: TextStyle(
                              color: ColorsApp().primary
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Search..',
                              hintStyle: TextStyle(
                                color: ColorsApp().greyIcon,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          ),
                        )
                      ],),
                  ));
            },
          )
        ],
      )
    );
  }
}
