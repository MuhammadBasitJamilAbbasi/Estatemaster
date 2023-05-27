import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/routes/route.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_images.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/util.dart';
import 'package:hyip_lab/data/controller/common/theme_controller.dart';
import 'package:hyip_lab/data/repo/dashboard_repo.dart';
import 'package:hyip_lab/data/services/api_service.dart';
import 'package:hyip_lab/view/components/animated_widget/expanded_widget.dart';
import 'package:hyip_lab/view/components/bottom_Nav/bottom_nav.dart';
import 'package:hyip_lab/view/components/card/card_with_round_icon.dart';
import 'package:hyip_lab/view/components/custom_loader/custom_loader.dart';
import 'package:hyip_lab/view/components/will_pop_widget.dart';
import 'package:hyip_lab/view/screens/bottom_nav_screens/home/widgets/home_bottom_section.dart';
import 'package:hyip_lab/view/screens/bottom_nav_screens/home/widgets/home_top_section.dart';

import '../../../../data/controller/dashboard/dashboard_controller.dart';
import '../../core/utils/style.dart';
import '../components/rounded_button.dart';
import '../components/text/header_text.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(DashboardRepo(apiClient: Get.find()));
    final controller = Get.put(DashBoardController(dashboardRepo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadData();
    });
  }

  @override
  void dispose() {
    ThemeController themeController =
        ThemeController(sharedPreferences: Get.find());
    MyUtils.allScreensUtils(themeController.darkTheme);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "assets/icons/background.jpeg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      SafeArea(
          child: Scaffold(
        backgroundColor: MyColor.transparentColor,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              margin: EdgeInsets.only(left: 15, top: 10, bottom: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(MyImages.userImage),
                    radius: 18,
                  ),
                  SizedBox(height: 5),
                  Text('User Name'.toUpperCase(),
                      style: interRegularLarge.copyWith(
                          color: MyColor.getTextColor(), fontSize: 12)),
                ],
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 5),
                  Container(
                      decoration: BoxDecoration(
                          color: MyColor.cardBgColor.withOpacity(0.4),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      padding: const EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text('News Bar'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: interRegularLarge.copyWith(
                                color: Colors.black,
                                fontSize: 18.0,
                              )))),
                  const SizedBox(height: 10),
                  Container(
                      height: 100,
                      width: 250,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: MyColor.colorWhite,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      padding: const EdgeInsets.all(10),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Brand Logo'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: interRegularLarge.copyWith(
                                color: Colors.black,
                                fontSize: 18.0,
                              )))),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              MyColor.cardBgColor.withOpacity(0.5),
                              MyColor.cardBgColor.withOpacity(0.5),
                            ]),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(60.0),
                          topRight: Radius.circular(60.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        )),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: <Color>[
                                          MyColor.gradientEndColor,
                                          MyColor.getButtonColor()
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0))),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/icons/recharge.png",
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text('Balance\nRecharge',
                                  style: interRegularLarge.copyWith(
                                      color: MyColor.getTextColor(),
                                      fontSize: 12)),
                            ],
                          ),
                          onTap: () {
                            //     Get.toNamed(RouteHelper.digitalWalletScreen);
                          },
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: <Color>[
                                          MyColor.gradientEndColor,
                                          MyColor.getButtonColor()
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0))),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/icons/wallet2.png",
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text('Digital\nWallet',
                                  style: interRegularLarge.copyWith(
                                      color: MyColor.getTextColor(),
                                      fontSize: 12)),
                            ],
                          ),
                          onTap: () {
                            Get.toNamed(RouteHelper.digitalWalletScreen);
                          },
                        ),
                        const SizedBox(width: 5),
                        InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                        colors: <Color>[
                                          MyColor.gradientEndColor,
                                          MyColor.getButtonColor()
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50.0))),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/icons/agreement.png",
                                  height: MediaQuery.of(context).size.height,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text('Help',
                                  style: interRegularLarge.copyWith(
                                      color: MyColor.getTextColor(),
                                      fontSize: 12)),
                            ],
                          ),
                          onTap: () {
                            //     Get.toNamed(RouteHelper.digitalWalletScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: BoxDecoration(
                          color: MyColor.colorWhite.withOpacity(0.7),
                          border: Border.all(
                            color: MyColor.colorWhite.withOpacity(0.7),
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Text('Explore',
                                  textAlign: TextAlign.center,
                                  style: interRegularLarge.copyWith(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontFamily: 'American',
                                  ))),
                          const SizedBox(height: 5),
                          Text('Apartments',
                              textAlign: TextAlign.center,
                              style: interRegularLarge.copyWith(
                                color: Colors.black,
                                fontSize: 14.0,
                              )),
                          const SizedBox(height: 5),
                          SizedBox(
                              height: 150,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 15,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Column(
                                            children: [
                                        Card(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Container(
                                                height: 100,
                                                width: 140,
                                                child: Image.asset(
                                                  "assets/icons/appartments.png",
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                              const SizedBox(height: 2),
                                              Container(
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(right: 20),
                                        child: Text("Details of Apartment",
                                                  textAlign: TextAlign.left,
                                                  style: interRegularLarge.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                  ))),
                                              const SizedBox(height: 5),

                                              Container(
                                        alignment: Alignment.topRight,
                                                  margin: EdgeInsets.only(left: 100),

                                                  child: Text("12\$",
                                                  textAlign: TextAlign.right,
                                                  style: interRegularLarge.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                  ))),
    ]),
                              )),
                          const SizedBox(height: 5),
                          Text('House',
                              textAlign: TextAlign.center,
                              style: interRegularLarge.copyWith(
                                color: Colors.black,
                                fontSize: 14.0,
                              )),
                          const SizedBox(height: 5),
                          SizedBox(
                              height: 150,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 15,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                    Column(
                                        children: [
                                          Card(
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                                child: Container(
                                                  height: 100,
                                                  width: 140,
                                                  child: Image.asset(
                                                    "assets/icons/house.png",
                                                    height: MediaQuery.of(context)
                                                        .size
                                                        .height,
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )),
                                          ),
                                          const SizedBox(height: 2),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.only(right: 20),
                                              child: Text("Details of Apartment",
                                                  textAlign: TextAlign.left,
                                                  style: interRegularLarge.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 12.0,
                                                  ))),
                                          const SizedBox(height: 5),

                                          Container(
                                              alignment: Alignment.topRight,
                                              margin: EdgeInsets.only(left: 100),

                                              child: Text("12\$",
                                                  textAlign: TextAlign.right,
                                                  style: interRegularLarge.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 14.0,
                                                  ))),
                                        ]),
                              ))
                        ],
                      )),
                ],
              ))
        ])),
        bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
      )),
    ]);
  }
}
