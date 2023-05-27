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

import '../../data/controller/auth/login_controller.dart';
import '../../data/controller/dashboard/dashboard_controller.dart';
import '../../data/repo/auth/login_repo.dart';
import '../components/appbar/custom_appbar.dart';
import '../components/bottom_Nav/bottom_nav.dart';
import '../components/buttons/rounded_loading_button.dart';
import '../components/rounded_button.dart';
import '../components/text-field/custom_text_field.dart';


class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final formKey = GlobalKey<FormState>();

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
      builder: (controller) =>
          Stack(
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
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,

                  children: [

                    const SizedBox(height: 5),
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
                            child: HeaderText(text: MyStrings.accountSettings.tr,textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 15),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.8,

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
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            const SizedBox(height: 20),
                            Container(
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor, MyColor.gradientEndColor]),
                        borderRadius: const BorderRadius.all( Radius.circular(10.0))),
                         padding: const EdgeInsets.all(10),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child:Container(
                                            margin: const EdgeInsets.only(top: 5, right: 5.0),
                                            child:
                                            Text(
                                              MyStrings.fundPassword.tr, style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                              fontSize: 12.0,
                                            )))
                                  ) ,
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          width: 110,
                                          height: 25,
                                          margin: const EdgeInsets.only(left:5),
                                          child:
                                          RoundedButton(
                                              cornerRadius:25,
                                              verticalPadding:5,
                                              horizontalPadding: 2,
                                              width: 2,
                                              text: MyStrings.clickToModify.tr,
                                              textColor: MyColor.colorWhite,
                                              color: MyColor.getButtonColor(),
                                              press: (){
                                                Get.toNamed(RouteHelper.fundPasswordScreen);

                                              }
                                          )))
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor, MyColor.gradientEndColor]),
                                  borderRadius: const BorderRadius.all( Radius.circular(10.0))),
                              padding: const EdgeInsets.all(10),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      child:Container(
                                          margin: const EdgeInsets.only(top: 5, right: 5.0),
                                          child:
                                          Text(
                                              MyStrings.loginPassword.tr, style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                            fontSize: 12.0,
                                          )))
                                  ) ,
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          width: 110,
                                          height: 25,
                                          margin: const EdgeInsets.only(left:5),
                                          child:
                                          RoundedButton(
                                              cornerRadius:25,
                                              verticalPadding:5,
                                              horizontalPadding: 2,
                                              width: 2,
                                              text: MyStrings.clickToModify.tr,
                                              textColor: MyColor.colorWhite,
                                              color: MyColor.getButtonColor(),
                                              press: (){
                                                Get.toNamed(RouteHelper.loginPasswordScreen);
                                              }
                                          )))
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              decoration:  BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.topRight,
                                      colors: <Color>[MyColor.gradientStartColor, MyColor.gradientEndColor]),
                                  borderRadius: const BorderRadius.all( Radius.circular(10.0))),
                              padding: const EdgeInsets.all(10),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                      child:Container(
                                          margin: const EdgeInsets.only(top: 5, right: 5.0),
                                          child:
                                          Text(
                                              MyStrings.bankCard.tr, style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                            fontSize: 12.0,
                                          )))
                                  ) ,
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                          width: 110,
                                          height: 25,
                                          margin: const EdgeInsets.only(left:5),
                                          child:
                                          RoundedButton(
                                              cornerRadius:25,
                                              verticalPadding:5,
                                              horizontalPadding: 2,
                                              width: 2,
                                              text: MyStrings.clickToModify.tr,
                                              textColor: MyColor.colorWhite,
                                              color: MyColor.getButtonColor(),
                                              press: (){
                                                Get.toNamed(RouteHelper.accountRecordScreen);
                                              }
                                          )))
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                ))])),
              ),

    )
    ]
    ));
  }



}
