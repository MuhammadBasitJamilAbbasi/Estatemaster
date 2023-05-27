import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/routes/route.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/data/services/api_service.dart';
import 'package:hyip_lab/view/components/custom_no_data_found_class.dart';
import 'package:hyip_lab/view/components/custom_loader/custom_loader.dart';
import 'package:hyip_lab/view/components/text/default_text.dart';
import 'package:hyip_lab/view/components/text/header_text.dart';
import 'package:hyip_lab/view/components/will_pop_widget.dart';
import 'package:hyip_lab/view/new_screens/widget/email_registration_form.dart';
import 'package:hyip_lab/view/new_screens/widget/number_registration_form.dart';
import 'package:hyip_lab/view/screens/auth/registration/widget/registration_form.dart';

import '../../core/utils/my_images.dart';
import '../../data/controller/auth/login_controller.dart';
import '../../data/controller/dashboard/dashboard_controller.dart';
import '../../data/repo/auth/login_repo.dart';
import '../components/bottom_Nav/bottom_nav.dart';
import '../components/buttons/rounded_loading_button.dart';
import '../components/rounded_button.dart';
import '../components/text-field/custom_text_field.dart';


class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final formKey = GlobalKey<FormState>();
  double _progressValue = 0.0;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) =>   Stack(
        children: <Widget>[
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                        decoration:
                        BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: <Color>[MyColor.gradientStartColor, MyColor.gradientEndColor]),
                            borderRadius: const BorderRadius.all( Radius.circular(10.0))),
                        padding: const EdgeInsets.all(10),
                        child:
                        Align(
                            alignment: Alignment.topCenter,
                            child: HeaderText(text:' My Account',textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 20),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.9,

                        decoration: BoxDecoration(
                            color:  MyColor.getCardColor(),
                            border: Border.all(
                              color:  MyColor.getCardColor()
                              ,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        padding: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 5),

                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(MyImages.userImage),
                                  radius: 40,
                                ),
                                const SizedBox(width: Dimensions.space15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name:', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 25)),
                                    Container(
                                      width: 140,
                                      padding:  EdgeInsets.all(2.0),
                                      child:LinearProgressIndicator(
                                      backgroundColor: MyColor.red,
                                      valueColor:  const AlwaysStoppedAnimation<Color>(Colors.red),
                                      value: _progressValue,
                                    )),
                                  ],
                                ),
                                Container(
                                  margin:  EdgeInsets.only(left: 15),
                                  child:Text('0%', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 18)),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor, MyColor.gradientEndColor]),
                                  borderRadius: const BorderRadius.all( Radius.circular(10.0))),
                              padding: const EdgeInsets.only(top: 10,left: 2,bottom: 10,right: 2),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('0.00', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                          Text('Current', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),
                                    ],
                                  ),
                                  const SizedBox(width: 2),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('0', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                      Text('Personal Gain', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 10),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 30,width: 100,
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor,MyColor.gradientEndColor,  MyColor.gradientStartColor]),
                                  borderRadius: const BorderRadius.all( Radius.circular(10.0))),

                              child:
                              TextButton(
                                  onPressed: (){
                                    Get.toNamed(RouteHelper.rechargeChannelScreen);
                                  },
                                  child: DefaultText(text: 'Recharge', textColor: MyColor.getTextColor(),fontSize: 13.0,)),
                            ),
                            Container(
                              height: 30,width: 100,
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor,MyColor.gradientEndColor,  MyColor.gradientStartColor]),
                                  borderRadius: const BorderRadius.all( Radius.circular(10.0))),

                              child:
                              TextButton(
                                  onPressed: (){
                                    Get.toNamed(RouteHelper.withDrawScreen);
                                  },
                                  child: DefaultText(text: 'Withdraw', textColor: MyColor.getTextColor(),fontSize: 13.0,)),
                            )


                            ]),
                            const SizedBox(height: 10),

                            Container(
                                decoration:
                                BoxDecoration(
                                    color:  MyColor.cardBgColor.withOpacity(0.4),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0))),
                                child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child:

                                        Container(
                                margin: const EdgeInsets.only(top: 10,left: 5,bottom: 5,right: 5),
                                padding: const EdgeInsets.only(top: 2,left: 15,bottom: 5,right: 15),

                                child:Row(
                                    children: [

                                      Container(
                                        height:35,
                                        width:35,
                                        decoration:
                                        BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomLeft,
                                                end: Alignment.topRight,
                                                colors: <Color>[MyColor.gradientEndColor,MyColor.getButtonColor()]),
                                            borderRadius: const BorderRadius.all( Radius.circular(50.0))),
                                        padding: const EdgeInsets.all(10),
                                        child:Image.asset(
                                          "assets/icons/agreement.png",
                                          height: MediaQuery.of(context).size.height,
                                          width: MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 30),

                                      Text('Agreement', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 16),textAlign: TextAlign.center,),

                                    ])),
                                        onTap: () {
                                          Get.toNamed(RouteHelper.termsAgreementsScreen);

                                        },
                                      ),


                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: MyColor.borderColor
                                        ,
                                      ),
                                      const SizedBox(height: 10),
                                      InkWell(
                                        child:   Container(
                                            margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),
                                            padding: const EdgeInsets.only(top: 2,left: 15,bottom: 5,right: 15),

                                            child:Row(
                                                children: [

                                                  Container(
                                                    height:35,
                                                    width:35,
                                                    decoration:
                                                    BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.bottomLeft,
                                                            end: Alignment.topRight,
                                                            colors: <Color>[MyColor.gradientEndColor,MyColor.getButtonColor()]),
                                                        borderRadius: const BorderRadius.all( Radius.circular(50.0))),
                                                    padding: const EdgeInsets.all(10),
                                                    child:Image.asset(
                                                      "assets/icons/wallet.png",
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),

                                                  Text('Wallet', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 16),textAlign: TextAlign.center,),

                                                ])),
                                        onTap: () {
                                          Get.toNamed(RouteHelper.withdrawalChannelScreen);

                                        },
                                      ),


                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: MyColor.borderColor
                                        ,
                                      ),
                                      const SizedBox(height: 5),
                                      InkWell(
                                        child: Container(
                                            margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),
                                            padding: const EdgeInsets.only(top: 2,left: 15,bottom: 5,right: 15),

                                            child:Row(
                                                children: [

                                                  Container(
                                                    height:35,
                                                    width:35,
                                                    decoration:
                                                    BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.bottomLeft,
                                                            end: Alignment.topRight,
                                                            colors: <Color>[MyColor.gradientEndColor,MyColor.getButtonColor()]),
                                                        borderRadius: const BorderRadius.all( Radius.circular(50.0))),
                                                    padding: const EdgeInsets.all(10),
                                                    child:Image.asset(
                                                      "assets/icons/earning.png",
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),

                                                  Text('Team Earning', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 16),textAlign: TextAlign.center,),

                                                ])),
                                        onTap: () {
                                          Get.toNamed(RouteHelper.teamAnalysisScreen);

                                        },
                                      ),


                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: MyColor.borderColor
                                        ,
                                      ),
                                      const SizedBox(height: 5),

                                      InkWell(
                                        child:   Container(
                                            margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),
                                            padding: const EdgeInsets.only(top: 2,left: 15,bottom: 5,right: 15),

                                            child:Row(
                                                children: [

                                                  Container(
                                                    height:35,
                                                    width:35,
                                                    decoration:
                                                    BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.bottomLeft,
                                                            end: Alignment.topRight,
                                                            colors: <Color>[MyColor.gradientEndColor,MyColor.getButtonColor()]),
                                                        borderRadius: const BorderRadius.all( Radius.circular(50.0))),
                                                    padding: const EdgeInsets.all(10),
                                                    child:Image.asset(
                                                      "assets/icons/team_leveel.png",
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),

                                                  Text('Team Level', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 16),textAlign: TextAlign.center,),

                                                ])),
                                        onTap: () {
                                          Get.toNamed(RouteHelper.membershipLevelScreen);

                                        },
                                      ),

                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: MyColor.borderColor
                                        ,
                                      ),
                                      const SizedBox(height: 5),
                                      InkWell(
                                        child:Container(
                                            margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),
                                            padding: const EdgeInsets.only(top: 2,left: 15,bottom: 5,right: 15),

                                            child:Row(
                                                children: [

                                                  Container(
                                                    height:35,
                                                    width:35,
                                                    decoration:
                                                    BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment.bottomLeft,
                                                            end: Alignment.topRight,
                                                            colors: <Color>[MyColor.gradientEndColor,MyColor.getButtonColor()]),
                                                        borderRadius: const BorderRadius.all( Radius.circular(50.0))),
                                                    padding: const EdgeInsets.all(10),
                                                    child:Image.asset(
                                                      "assets/icons/share.png",
                                                      height: MediaQuery.of(context).size.height,
                                                      width: MediaQuery.of(context).size.width,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30),

                                                  Text('Share', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 16),textAlign: TextAlign.center,),

                                                ])
                                        ),
                                        onTap: () {
                                          Get.toNamed(RouteHelper.shareCodeScreen);
                                        },
                                      ),


                                      Divider(
                                        height: 1,
                                        thickness: 1,
                                        color: MyColor.borderColor
                                        ,
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                          alignment: Alignment.center,
                                          child:  Container(
                                            height: 33,width: 210,
                                            decoration:  BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    colors: <Color>[MyColor.gradientStartColor,MyColor.gradientEndColor,  MyColor.gradientStartColor]),
                                                borderRadius: const BorderRadius.all( Radius.circular(15.0))),

                                            child:
                                            TextButton(
                                                onPressed: (){
                                                  //Get.toNamed(RouteHelper.rechargeChannelScreen);
                                                },
                                                child: DefaultText(text: 'Sign out', textColor: MyColor.getTextColor(),fontSize: 13.0,)),
                                          ),
                                      ),
                                      const SizedBox(height: 25),

])
                            ),

                          ],
                        )
                    ),

                  ],
                )),

            ),
            bottomNavigationBar: const CustomBottomNav(currentIndex: 4),
          ),
        ),
      ])
    );
  }



}
