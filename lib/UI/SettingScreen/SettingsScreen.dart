import 'package:cafe/Components/image_pickers.dart';
import 'package:cafe/Controllers/SettingsScreenController/SettingsScreenController.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Components/Button.dart';

import '../../Components/theme.dart';

// import '../../Controller/ProfileScreenController/AddressScreenController.dart';
// import '../../Controllers/ProfileScreenController/AddressScreenController.dart';

class SettingsScreen extends GetView<SettingsScreenController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    SettingsScreenController controller = Get.put(SettingsScreenController());
    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: Button(
              widthFactor: 0.9,
              heightFactor: 0.06,
              onPressed: () {},
              child: Text(
                "Update",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              )),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Center(
                child: Stack(children: [
              Obx(
                () => Container(
                  width: 150,
                  height: 150,
                  child: controller.itemImage.value != null
                      ? CircleAvatar(
                          backgroundImage: Image.file(
                            controller.itemImage.value?.imagePath,
                            fit: BoxFit.cover,
                          ).image,
                        )
                      : controller.imageString.value != null &&
                              controller.imageString.value.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(controller.imageString.value),
                            )
                          : const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://autorevog.blob.core.windows.net/autorevog/uploads/images/18942381.jpg'),
                            ),
                ),
              ),
              Positioned(
                right: -25,
                bottom: 5,
                child: MaterialButton(
                    color: AppTheme.primaryColor,
                    shape: const CircleBorder(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImagePicks(
                                    previewImageList: [],
                                    isMultiple: true,
                                    title: "Select Image",
                                    onClose: () => Get.back(),
                                    onSave: (List<PickedImage> images) {
                                      if (images.isNotEmpty) {
                                        controller.itemImage.value =
                                            images.first;
                                      }
                                      Get.back();
                                    },
                                  )));
                    },
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.black,
                    )),
              ),
            ])),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  onChanged: (value) {
                    // controller.editData!.userName = value;
                  },
                  keyboardType: TextInputType.text,
                  controller: controller.fullNameController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'Full Name'.tr,
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.person)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  onTap: () {
                    DateTime now = DateTime.now();
                    showModalBottomSheet(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 250,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime newTime) {
                                String date =
                                    "${newTime.year}-${newTime.month.toString().length <= 1 ? "0${newTime.month}" : newTime.month.toString()}-${newTime.day.toString().length <= 1 ? "0${newTime.day}" : newTime.day.toString()}";
                                controller.dateOfBirthController.text = date;
                              },
                              minimumDate:
                                  DateTime(now.year - 104, now.month, now.day),
                              maximumDate: DateTime.now(),
                              initialDateTime: DateTime(2001, 5, 5),
                              use24hFormat: true,
                              mode: CupertinoDatePickerMode.date,
                            ),
                          );
                        });
                  },
                  readOnly: true,
                  controller: controller.dateOfBirthController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'Date of Birth'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.calendar_month)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.areaController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'Area'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.location_on_rounded)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.cityController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'City'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.location_on_rounded)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.stateController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'State'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.location_on_rounded)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextFormField(
                    onTap: () {
                      showBottomTimePicker(
                          context, controller.timeOfBirthController);
                    },
                    keyboardType: TextInputType.number,
                    readOnly: true,
                    controller: controller.timeOfBirthController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppTheme.lightCoffeeColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: AppTheme.lightCoffeeColor),
                        ),
                        hintText: 'Time of Birth'.tr,
                        hintStyle: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        contentPadding: const EdgeInsets.all(6),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppTheme.lightCoffeeColor),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        prefixIcon: Icon(Icons.access_time_filled_outlined)),
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        decorationThickness: 0,
                        color: AppTheme.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.stateController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'Email'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.email)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: controller.stateController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                      ),
                      hintText: 'Phone Number'.tr,
                      hintStyle: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.all(6),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: AppTheme.lightCoffeeColor),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      prefixIcon: Icon(Icons.phone)),
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                      color: AppTheme.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showBottomTimePicker(
    BuildContext context,
    TextEditingController controller,
  ) {
    var times;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 280,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 20, width: 20),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text("Select Time",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppTheme.appBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(Icons.clear))
                      ],
                    ),
                  ),
                  Expanded(
                    child: TimePickerSpinner(
                      is24HourMode: false,
                      spacing: 30,
                      itemHeight: 37,
                      itemWidth: 60,
                      isForce2Digits: true,
                      onTimeChange: (time) {
                        times = time;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Cancel',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Get.back();
                        },
                        color: Colors.white,
                        titleColor: AppTheme.bottomTabsLabelInActiveColor,
                        borderColor: AppTheme.cancelBorder,
                      ),
                      AppButton2(
                        width: width * 0.45,
                        height: 40,
                        title: 'Save ',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        onPressed: () {
                          controller.text = " ${formatDate(times, [
                                hh.trim(),
                                ':',
                                nn.trim(),
                                ':',
                                am.trim()
                              ])}";
                          Navigator.of(context).pop();
                        },
                        titleColor: Colors.white,
                        color: AppTheme.buttonColor,
                        borderColor: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
