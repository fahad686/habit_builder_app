import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetBottomSheet extends StatefulWidget {
  const GetBottomSheet({super.key});

  @override
  State<GetBottomSheet> createState() => _GetBottomSheetState();
}

class _GetBottomSheetState extends State<GetBottomSheet> {
  List<bool> notificationStatus = List.generate(12, (_) => false);
  List<String> notificationTimes = List.generate(12, (_) => '10:30 AM');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 8,
                  mainAxisExtent: 82,
                ),
                itemCount: notificationStatus.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      if (!notificationStatus[index]) {
                        // If notification is off, show time picker
                        await _showTimePickerBottomSheet(
                            context, index, setState);
                      }
                      setState(() {
                        notificationStatus[index] = !notificationStatus[index];
                      });
                    },
                    child: Container(
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: notificationStatus[index]
                            ? Color.fromARGB(255, 194, 187, 194)
                            : Color.fromARGB(255, 249, 240, 230),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            notificationTimes[
                                index], // Display the selected time
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: notificationStatus[index]
                                  ? Color.fromARGB(255, 87, 51, 83)
                                  : const Color.fromARGB(255, 252, 157, 69),
                            ),
                          ),
                          Switch(
                            value: notificationStatus[index],
                            onChanged: (value) async {
                              if (!notificationStatus[index]) {
                                // If notification is off, show time picker
                                await _showTimePickerBottomSheet(
                                    context, index, setState);
                              }
                              setState(() {
                                notificationStatus[index] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 7.h,
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 7.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 131, 63, 0.733),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      "Add Reminder",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 87, 51, 83),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                  Container(
                    height: 7.h,
                    width: 14.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: Icon(
                      Icons.notification_important_outlined,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> _showTimePickerBottomSheet(
  //     BuildContext context, int index, StateSetter setState) async {
  //   TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );

  //   if (selectedTime != null) {
  //     setState(() {
  //       // Update the selected time
  //       notificationTimes[index] = selectedTime.format(context);
  //     });
  //   }
  // }

  // Future<void> _showTimePickerBottomSheet(
  //     BuildContext context, int index, StateSetter setState) async {
  //   Get.bottomSheet(
  //     Container(
  //       height: 50.h,
  //       width: 100.w,
  //       padding: EdgeInsets.all(16.0),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               GestureDetector(
  //                 onTap: () => Get.back(),
  //                 child: Text(
  //                   "Cancel",
  //                   style: TextStyle(
  //                       color: const Color.fromARGB(255, 252, 157, 69),
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //               ),
  //               Text(
  //                 "Add Reminder",
  //                 style: TextStyle(
  //                     color: Color.fromARGB(255, 40, 5, 3),
  //                     fontSize: 18.sp,
  //                     fontWeight: FontWeight.w600),
  //               ),
  //               GestureDetector(
  //                 onTap: () => Get.back(),
  //                 child: Text(
  //                   "Save",
  //                   style: TextStyle(
  //                       color: const Color.fromARGB(255, 252, 157, 69),
  //                       fontSize: 16.sp,
  //                       fontWeight: FontWeight.w500),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Divider(),
  //           Expanded(
  //             child: TimePickerSpinner(
  //               is24HourMode: true,
  //               normalTextStyle: TextStyle(
  //                 fontSize: 18.sp,
  //                 color: Color.fromARGB(255, 249, 209, 228),
  //               ),
  //               highlightedTextStyle: TextStyle(
  //                 fontSize: 24.sp,
  //                 color: Color.fromARGB(255, 57, 14, 3),
  //               ),
  //               spacing: 80,
  //               itemHeight: 70,
  //               isForce2Digits: true,
  //               onTimeChange: (time) {
  //                 setState(() {
  //                   notificationTimes[index] =
  //                       TimeOfDay.fromDateTime(time).format(context);
  //                 });
  //               },
  //             ),
  //           ),
  //           Container(
  //             height: 7.h,
  //             width: 100.w,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                   height: 7.h,
  //                   width: 44.w,
  //                   decoration: BoxDecoration(
  //                       color: Color.fromRGBO(241, 131, 63, 0.733),
  //                       borderRadius: BorderRadius.circular(12)),
  //                   child: Center(
  //                       child: Text(
  //                     "AM",
  //                     style: TextStyle(
  //                       color: const Color.fromARGB(255, 87, 51, 83),
  //                       fontSize: 17.sp,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   )),
  //                 ),
  //                 Container(
  //                   height: 7.h,
  //                   width: 44.w,
  //                   decoration: BoxDecoration(
  //                       color: Color.fromRGBO(245, 164, 113, 0.729),
  //                       borderRadius: BorderRadius.circular(12)),
  //                   child: Center(
  //                       child: Text(
  //                     "PM",
  //                     style: TextStyle(
  //                       color: const Color.fromARGB(255, 87, 51, 83),
  //                       fontSize: 17.sp,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                   )),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //     isScrollControlled: true,
  //   );
  // }

  Future<void> _showTimePickerBottomSheet(
      BuildContext context, int index, StateSetter setState) async {
    TimeOfDay _selectedTime = TimeOfDay.now();
    bool _isAm = _selectedTime.hour < 12;

    Get.bottomSheet(
      Container(
        height: 50.h,
        width: 100.w,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 252, 157, 69),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                  "Add Reminder",
                  style: TextStyle(
                      color: Color.fromARGB(255, 40, 5, 3),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 252, 157, 69),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: TimePickerSpinner(
                is24HourMode: true,
                normalTextStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Color.fromARGB(255, 249, 209, 228),
                ),
                highlightedTextStyle: TextStyle(
                  fontSize: 24.sp,
                  color: Color.fromARGB(255, 57, 14, 3),
                ),
                spacing: 80,
                itemHeight: 70,
                isForce2Digits: true,
                onTimeChange: (time) {
                  setState(() {
                    _selectedTime = TimeOfDay.fromDateTime(time);
                    _isAm = _selectedTime.hour < 12;
                    notificationTimes[index] = _selectedTime.format(context);
                  });
                },
              ),
            ),
            Container(
              height: 7.h,
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAm = true;
                        _selectedTime = _selectedTime.replacing(
                            hour: _selectedTime.hour > 12
                                ? _selectedTime.hour - 12
                                : _selectedTime.hour);
                        notificationTimes[index] =
                            _selectedTime.format(context);
                      });
                    },
                    child: Container(
                      height: 7.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          color: _isAm
                              ? Color.fromRGBO(241, 131, 63, 0.733)
                              : Color.fromRGBO(245, 164, 113, 0.729),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "AM",
                        style: TextStyle(
                          color: _isAm
                              ? const Color.fromARGB(255, 87, 51, 83)
                              : const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isAm = false;
                        _selectedTime = _selectedTime.replacing(
                            hour: _selectedTime.hour < 12
                                ? _selectedTime.hour + 12
                                : _selectedTime.hour);
                        notificationTimes[index] =
                            _selectedTime.format(context);
                      });
                    },
                    child: Container(
                      height: 7.h,
                      width: 44.w,
                      decoration: BoxDecoration(
                          color: !_isAm
                              ? Color.fromRGBO(241, 131, 63, 0.733)
                              : Color.fromRGBO(245, 164, 113, 0.729),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "PM",
                        style: TextStyle(
                          color: !_isAm
                              ? const Color.fromARGB(255, 87, 51, 83)
                              : const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
