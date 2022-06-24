import 'package:bravesystem/constants/color.dart';
import 'package:bravesystem/constants/dimensions.dart';
import 'package:bravesystem/controller/product_controller.dart';
import 'package:bravesystem/utils/routes.dart';
import 'package:bravesystem/view/Cafe/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsApp().primary,
        elevation: 0,
        title: Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),),
      ),
      body: GetBuilder<ProductController>(
        builder: (controller){
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Dimensions.screenWidth,
                    height: Dimensions.splashImage,
                    decoration: BoxDecoration(
                      color: ColorsApp().primary,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.height30*2)),

                    ),
                  ),
                  SizedBox(height: Dimensions.height30*2,),
                  Container(
                    alignment: Alignment.center,
                    width: Dimensions.height30*5,
                    margin: EdgeInsets.symmetric(horizontal: Dimensions.height30*1.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const[
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 4),
                          blurRadius: 7,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(child: IconButton(onPressed: (){controller.deleteQuantity();}, icon: Icon(FontAwesomeIcons.minus,color: ColorsApp().primary),alignment: Alignment.center,)),
                        Text(controller.quantity.toString(),style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),),
                        IconButton(onPressed: (){controller.addQuantity();}, icon: Icon(FontAwesomeIcons.plus,color: ColorsApp().primary))
                      ],
                    ),
                  ),
                  SizedBox(height: Dimensions.height30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height30*1.5),
                    child: Text(controller.products[0].name, style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: Dimensions.height30),),
                  ),
                  SizedBox(height: Dimensions.height10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height30*1.5),
                    child: Text(controller.products[0].description, style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.w500,fontSize: 16),maxLines: 3,),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimensions.height30*1.2,vertical: 8),
                    height: 10,
                    child: RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      unratedColor: Colors.amber.shade100,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: Dimensions.screenWidth,
                    height: Dimensions.height30*4,
                    color: ColorsApp().primary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 30),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text('40 LE',style: GoogleFonts.oleoScript(textStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)),),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                AppRoute.push(const ShoppingCart(),name: 'Shopping Cart');
                              },
                              child: Container(
                                height: Dimensions.height30*1.8,
                                margin: const EdgeInsets.only(right: 30),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const[
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0, 7),
                                      blurRadius: 7,
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'Order Now',style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  top: Dimensions.splashImage/3,
                  right: -Dimensions.height30*2.5,
                  child: Image.asset(controller.products[0].image,width: Dimensions.height30*10,height: Dimensions.height30*10,)),
              Positioned(
                  top: Dimensions.splashImage/1.1,
                  left: Dimensions.height30*2,
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const[
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 7),
                            blurRadius: 7,
                          )
                        ],
                      ),
                      child:Icon(FontAwesomeIcons.solidHeart,color: ColorsApp().primary,)))
            ],
          );
        },
      ),
    );
  }
}
