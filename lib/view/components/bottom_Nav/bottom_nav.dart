import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/routes/route.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_images.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/data/controller/common/theme_controller.dart';
import 'package:hyip_lab/data/controller/localization/localization_controller.dart';
import 'package:hyip_lab/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:hyip_lab/view/screens/bottom_nav_screens/history/history_bottom_sheet_items.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNav({Key? key,required this.currentIndex}) : super(key: key);

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {

  var bottomNavIndex = 0;//default index of a first screen

  List<String> iconList = [
    MyImages.home,
    MyImages.planIcon,
    MyImages.keyIcon,
    MyImages.menu,
    MyImages.menu

  ];

  final textList = [
    MyStrings.home,
    MyStrings.wallet,
    MyStrings.service,
    MyStrings.customerService,
    MyStrings.accounts
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    Get.put(ThemeController(sharedPreferences: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme){
      return GetBuilder<LocalizationController>(builder: (languageController)=>AnimatedBottomNavigationBar.builder(
        height: 65,
        elevation: 10,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          return
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index == 2 ? Image.asset(
                iconList[index],
                height: 30, width: 30,
                color: isActive ? MyColor.getSelectedIconColor() : MyColor.getUnselectedIconColor(),
              ):
              Image.asset(
                iconList[index],
                height: 20, width: 20,
                color: isActive ? MyColor.getSelectedIconColor() : MyColor.getUnselectedIconColor(),
              ),
              const SizedBox(height: Dimensions.space2),
              Text(
                textList[index].tr,
                style: interRegularSmall.copyWith(color: isActive ? MyColor.getSelectedIconColor() : MyColor.getUnselectedIconColor(),fontSize: 8.0),
              )
            ],
          );
        },
        backgroundColor: MyColor.getCardColor(),
        splashColor: MyColor.getScreenBgColor(),
        gapLocation: GapLocation.none,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) {
          _onTap(index);
        },
        activeIndex: bottomNavIndex,
      ));
    });
  }


  void _onTap(int index) {

    if (index == 0) {
     // if (!(widget.currentIndex == 0)) {
        Get.toNamed(RouteHelper.newHomeScreen);
     // }
    }

    else if (index == 1) {
     // if (!(widget.currentIndex == 2)) {
      Get.toNamed(RouteHelper.withDrawScreen);
     // }
    }

    else if (index == 2) {
     // if (!(widget.currentIndex == 3)) {
      Get.toNamed(RouteHelper.serviceScreen);

/*        CustomBottomSheet(
            isNeedMargin: true,
            backgroundColor: MyColor.getCardBg(),
            child: const HistoryBottomSheetItems()
        ).customBottomSheet(context);*/
    //  }
    }

    else if (index == 3) {
     // if (!(widget.currentIndex == 4)) {
        Get.toNamed(RouteHelper.menuScreen);
    //  }
    }
    else if (index == 4) {
     // if (!(widget.currentIndex == 5)) {
        Get.toNamed(RouteHelper.myAccountScreen);
     // }
    }
  }
}




  


