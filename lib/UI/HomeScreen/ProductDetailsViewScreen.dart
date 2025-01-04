import 'package:cafe/Controllers/HomeScreenController/ProductDetailsViewScreenController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/AppTab.dart';
import '../../Components/HorizontalScrollView.dart';
import '../../Components/theme.dart';

class ProductDetailsViewScreen extends GetView<ProductDetailsViewScreenController> {
  const ProductDetailsViewScreen({super.key});


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    ProductDetailsViewScreenController controller = Get.put(ProductDetailsViewScreenController());
    final arguments = Get.arguments;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Container(
          width: width,
          height: height* 0.08,
          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add to Cart",
                  style: GoogleFonts.poppins(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ), Text(
                  "|",
                  style: GoogleFonts.poppins(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "\$2.5",
                  style: GoogleFonts.poppins(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height * 0.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(arguments['images']),
                      fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                      child: Image.asset("assets/images/Back_Button_white.png"),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: height * 0.43,
              child: Container(
                width: width,
                height: height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Text(
                          arguments['title'],
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Text(
                         "Coffee Size",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Obx(
                            () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: HorizontalScrollView(
                            children: List.generate(
                              controller.listValues.length,
                                  (index) {
                                var model = controller.listValues[index];
                                return AppTab(
                                  title: model.value,
                                  isSelected: controller.selectedTabIndex.value == index,
                                  onClick: () => controller.updateCurrentTabIndex(index),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Text(
                         "About",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ntium",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5),
                        child: Text(
                          "Add Topping(1\$)",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: width ,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Caramel",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: controller.decrement,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color: Colors.red),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  Obx(() => Text(
                                    controller.count.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  )),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  InkWell(
                                    onTap: controller.increment,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color:
                                          AppTheme.secondaryColor),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: width ,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Banana",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: controller.decrement,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color: Colors.red),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  Obx(() => Text(
                                    controller.count.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  )),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  InkWell(
                                    onTap: controller.increment,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color:
                                          AppTheme.secondaryColor),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: width ,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chocolate",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: controller.decrement,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color: Colors.red),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  Obx(() => Text(
                                    controller.count.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  )),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  InkWell(
                                    onTap: controller.increment,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color:
                                          AppTheme.secondaryColor),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          width: width ,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Strawberry",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: controller.decrement,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color: Colors.red),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  Obx(() => Text(
                                    controller.count.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight.w400,
                                      color: Colors.red,
                                    ),
                                  )),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.02,
                                  ),
                                  InkWell(
                                    onTap: controller.increment,
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              100),
                                          color:
                                          AppTheme.secondaryColor),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width *
                                        0.03,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Divider(),)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
