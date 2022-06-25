import 'package:bravesystem/view/Profile/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/color.dart';
import '../../constants/dimensions.dart';
import '../../utils/routes.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
      appBar:AppBar(
        title: Text('Order History',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 22)),),
        centerTitle: true,
        backgroundColor: Get.isDarkMode?ColorsApp().secondaryDark:ColorsApp().secondaryLight,
        elevation: 0,
        leading: IconButton(onPressed: (){AppRoute.pop();}, icon: Icon(Icons.arrow_back_ios,color: ColorsApp().primary,)),
      ),
      body: SizedBox(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        child:  ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Today',
                    style: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 18),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: const ClampingScrollPhysics(), // todo comment this out and check the result
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: (){
                            AppRoute.push(const OrderDetails(),name: 'orderDetails');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
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
                              children: [
                                Image.asset('assets/images/logo2.png',width: Dimensions.height30*3.5,),
                                Padding(
                                  padding: EdgeInsets.only(top: Dimensions.height10,left: 15,bottom: Dimensions.height10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Brave Cafe',style: GoogleFonts.oleoScript(textStyle: TextStyle(color: ColorsApp().primary,fontWeight: FontWeight.bold,fontSize: 16)),),
                                      const Text('Received', style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 12),),
                                      Text('Dec 22, 2022', style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.bold,fontSize: 12),),
                                      Text('Phone Number: +201554443577', style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.bold,fontSize: 12),),
                                      Text('Room Number: 1', style: TextStyle(color: ColorsApp().greyIcon,fontWeight: FontWeight.bold,fontSize: 12),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );
          },
          itemCount: 2,
        ),

      ),
    );
  }
}
