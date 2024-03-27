import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaleWidget extends StatelessWidget {
  const ScaleWidget({
    super.key,
    required this.scaleIsDegree,
  });
  final ValueNotifier<bool> scaleIsDegree;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.sp),
      margin: EdgeInsets.only(
        right: 12.sp,
      ),
      height: 36.sp,
      width: 80.sp,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () async {
              scaleIsDegree.value = true;
              HapticFeedback.heavyImpact();
            },
            child: ValueListenableBuilder<bool>(
              valueListenable: scaleIsDegree,
              builder: (_, bool tabValue, __) {
                return Container(
                  height: 32.sp,
                  width: 36.sp,
                  decoration: BoxDecoration(
                    color: tabValue ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      bottomLeft: Radius.circular(20.sp),
                    ),
                    boxShadow: tabValue
                        ? <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2.sp,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2.sp),
                            ),
                          ]
                        : null,
                  ),
                  child: const Center(
                    child: Text(
                      '\u2103', //for farenheit symbol
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () async {
              scaleIsDegree.value = false;
              HapticFeedback.heavyImpact();
            },
            child: ValueListenableBuilder<bool>(
              valueListenable: scaleIsDegree,
              builder: (_, bool tabValue, __) {
                return Container(
                  height: 32.sp,
                  width: 36.sp,
                  decoration: BoxDecoration(
                    color: tabValue ? Colors.transparent : Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.sp),
                      bottomRight: Radius.circular(20.sp),
                    ),
                    boxShadow: tabValue
                        ? null
                        : <BoxShadow>[
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 2.sp,
                              spreadRadius: 2.0,
                              offset: Offset(0, 2.sp),
                            ),
                          ],
                  ),
                  child: const Center(
                    child: Text(
                      '\u2109', //for degree symbol
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
