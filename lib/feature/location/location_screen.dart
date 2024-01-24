import 'dart:async';

import 'package:alibi_shop/feature/confirm_order/bloc/rekvizits/rekvizits_cubit.dart';
import 'package:alibi_shop/feature/widget/bottom_sheets/app_bottom_sheet.dart';
import 'package:alibi_shop/feature/widget/button/auth_button.dart';
import 'package:alibi_shop/feature/widget/chips/seletable_row.dart';
import 'package:alibi_shop/values/typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location;
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class LocationScreen extends StatefulWidget {
  static const String routeName = "/geo_test_screen";
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  location.Location locationController = location.Location();
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(41.311943, 69.281567),
    zoom: 14,
  );

  List<Marker> myMarkers = [];
  late List<Placemark> placeMarks;

  @override
  void initState() {
    super.initState();
    getLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getLocationService();
        },
        child: const Icon(Icons.radio_button_off),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (onMapCreatedController) {
          _controller.complete(onMapCreatedController);
        },
        markers: Set<Marker>.of(myMarkers),
        onTap: (argument) async {
          placeMarks = await placemarkFromCoordinates(
              argument.latitude, argument.longitude);
          print(placeMarks[0]);
          myMarkers.clear();
          myMarkers.add(
            Marker(
              markerId: MarkerId(UniqueKey().toString()),
              position: LatLng(argument.latitude, argument.longitude),
            ),
          );

          _showBottomSheet();
          setState(() {});
        },
        zoomControlsEnabled: false,
      ),
    );
  }

  setDateToCubit(
      String street, String address, String datetime, String paymentType) {
    context
        .read<RekvizitsCubit>()
        .changeData(street, address, datetime, paymentType);
  }

  Future<void> getLocationService() async {
    bool serviceEnabled;
    location.PermissionStatus permissionStatus;

    serviceEnabled = await locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    }
    permissionStatus = await locationController.hasPermission();
    if (permissionStatus == location.PermissionStatus.denied) {
      permissionStatus = await locationController.requestPermission();
    }
    location.LocationData locationData = await locationController.getLocation();
    print("Laaaaaaaat${locationData.latitude!}");
    print("Loooooong${locationData.longitude!}");

    Marker currentLocationMarker = Marker(
      markerId: MarkerId(
        UniqueKey().toString(),
      ),
      infoWindow: const InfoWindow(title: "My Current Location"),
      position: LatLng(locationData.latitude!, locationData.latitude!),
    );
    myMarkers.add(currentLocationMarker);
    final CameraPosition cameraPosition = CameraPosition(
      target: LatLng(locationData.latitude!, locationData.longitude!),
      zoom: 14,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    setState(() {});
  }

  void _showBottomSheet() {
    showSlidingBottomSheet(
      context,
      builder: (context) {
        return AppBottomSheet.sheetDialog(
          snappings: [0.8],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Detail Address",
                    style: AppFonts.hh3Bold,
                  ),
                  const Spacer(),
                  SvgPicture.asset("assets/icons/pritsel.svg")
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFAF9FD),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset("assets/icons/location2.svg"),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${placeMarks[0].street}",
                        style: AppFonts.bb2SemiBold,
                      ),
                      SizedBox(height: 4.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          "${placeMarks[0].administrativeArea} ${placeMarks[0].subLocality} ${placeMarks[0].thoroughfare}",
                          style: AppFonts.bb2Medium.copyWith(
                            color: const Color(0xFF999A9D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Text(
                "Save Address As",
                style: AppFonts.hh3Bold,
              ),
              SizedBox(height: 16.h),
              const SelectableRow(
                onFocusContainerColor: Color(0xFFFAF9FD),
                onFocusTextColor: Color(0xFF614FE0),
                paddingH: 0,
                list: ["Home", "Offices", "Field yard"],
              ),
              SizedBox(height: 16.h),
              const Text(
                "Time",
                style: AppFonts.bb2Medium,
              ),
              SizedBox(height: 6.h),
              TextField(
                controller: txt,
                decoration: InputDecoration(
                  hintText: "Choose a time",
                  hintStyle: AppFonts.bb1Regular.copyWith(
                    color: const Color(0xFF59616C),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () async {
                        await showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 500.h,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.dateAndTime,
                                      use24hFormat: true,
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (value) {
                                        print(value);
                                        txt.value = TextEditingValue(
                                            text: value.toString());
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 24.h),
                                  AuthButton(
                                    onTap: () {
                                      setDateToCubit(
                                        "${placeMarks[0].street}",
                                        "${placeMarks[0].administrativeArea} ${placeMarks[0].subLocality} ${placeMarks[0].thoroughfare}",
                                        txt.text.trim(),
                                        "By Card",
                                      );
                                      context.pop();
                                    },
                                    title: "Save",
                                  )
                                ],
                              ),
                            );
                          },
                        );
                        /*
                        final date = await DatePicker.showSimpleDatePicker(
                          context,
                          backgroundColor: const Color(0xFFFEFEFE),
                          // initialDate: DateTime(2020),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2090),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          initialDate: DateTime.now(),
                          looping: true,
                          pickerMode: DateTimePickerMode.datetime,
                        );
                        var time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        String day = date!.day.toString();
                        String month = date.month.toString();
                        String minute = time!.minute.toString();
                        String hour = time.hour.toString();
                        if (day.length == 1) {
                          day = "0$day";
                        }
                        if (month.length == 1) {
                          month = "0$month";
                        }
                        if (minute.length == 1) {
                          minute = "0$minute";
                        }
                        if (hour.length == 1) {
                          hour = "0$hour";
                        }
                        String dateTime =
                            "$day-$month-${date.year}  $hour:$minute";
                        txt.value = TextEditingValue(text: dateTime);
                        * */
                      },
                      child: SvgPicture.asset(
                        "assets/icons/calendaradd.svg",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF14181E),
                  ),
                  child: Text(
                    "Save",
                    style: AppFonts.hh3SemiBold.copyWith(
                      color: const Color(0xFFFEFEFE),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              Center(
                child: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: const Text(
                    "Close",
                    style: AppFonts.hh3SemiBold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        );
      },
    );
  }

  var txt = TextEditingController();
}
