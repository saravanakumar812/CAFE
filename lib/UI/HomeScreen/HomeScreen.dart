import 'package:cafe/Controllers/HomeScreenController/HomeScreenController.dart';
import 'package:cafe/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../AppRoutes/App_routes.dart';
import '../../Components/AppTab.dart';
import '../../Components/HorizontalScrollView.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Icon(
                        Icons.location_on_sharp,
                        color: AppTheme.buttonColor,
                        size: 24.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Obx(
                        () => Text(
                          controller.address.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              color: AppTheme.appBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Icon(
                    Icons.phone,
                    color: AppTheme.buttonColor,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller.searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppTheme.buttonColor),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide:
                        BorderSide(width: 1, color: AppTheme.buttonColor),
                  ),
                  hintText: "Search",
                  hintStyle: GoogleFonts.poppins(
                    color: AppTheme.appBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: const EdgeInsets.only(left: 20),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1, color: AppTheme.primaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                    decoration: TextDecoration.none,
                    decorationThickness: 0,
                    color: AppTheme.containerBackground,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Categories'.tr,
                style: GoogleFonts.poppins(
                  color: AppTheme.appBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Obx(
              () => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   child: Container(
            //     width: width * 0.33,
            //     height: height * 0.195,
            //     decoration: BoxDecoration(
            //         // color: Colors.black,
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color: Colors.black)),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 10, vertical: 10),
            //           child: Container(
            //             width: width * 0.33,
            //             height: height * 0.1,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 image: DecorationImage(
            //                     image: AssetImage(
            //                       "assets/images/cappuccino.png",
            //                     ),
            //                     fit: BoxFit.cover)),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 12),
            //           child: Text(
            //             'Cappuccino'.tr,
            //             style: GoogleFonts.poppins(
            //               color: AppTheme.appBlack,
            //               fontSize: 12,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Text(
            //                 "2\$",
            //                 style: GoogleFonts.poppins(
            //                   color: Colors.black,
            //                   fontSize: 14,
            //                   fontWeight: FontWeight.w600,
            //                 ),
            //               ),
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                   padding: EdgeInsets.all(5),
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(100),
            //                       color: AppTheme.buttonColor),
            //                   child: Icon(
            //                     Icons.add,
            //                     color: Colors.white,
            //                     size: 15,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: height * 0.6,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 1,
                      childAspectRatio: 0.9,
                      // childAspectRatio: 0.85,
                    ),
                    itemCount: controller.homeScreenData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.productView.toName,
                            arguments: {
                              'title': controller.homeScreenData[index].title,
                              'images': controller.homeScreenData[index].images,
                            },
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Container(
                            width: width * 0.33,
                            height: height * 0.195,
                            decoration: BoxDecoration(
                                // color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Container(
                                    width: width * 0.33,
                                    height: height * 0.1,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: AssetImage(
                                              controller
                                                  .homeScreenData[index].images
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    controller.homeScreenData[index].title
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      color: AppTheme.appBlack,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.homeScreenData[index].amount
                                            .toString(),
                                        style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: AppTheme.buttonColor),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
