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


class DigitalWalletScreen extends StatefulWidget {
  const DigitalWalletScreen({Key? key}) : super(key: key);

  @override
  State<DigitalWalletScreen> createState() => _DigitalWalletScreenState();
}

class _DigitalWalletScreenState extends State<DigitalWalletScreen> {
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
      builder: (controller) =>   SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.getScreenBgColor(),
            body: SingleChildScrollView(
              child:Container(
                height:  MediaQuery.of(context).size.height,
                decoration:   const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/background.jpeg'),
                    fit: BoxFit.fill,
                  ),),
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
                            child: HeaderText(text: 'Digital Wallet',textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                            color:  MyColor.getCardColor(),
                            border: Border.all(
                              color:  MyColor.getCardColor()
                              ,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        padding: const EdgeInsets.only(top: 5,left: 0,right: 0,bottom: 15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                              decoration:  BoxDecoration(
                                  color:  MyColor.cardBgColor.withOpacity(0.2), ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Wallet Type:', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          'Not Selected', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                ],
                              ),
                            ),
   const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                              decoration:  BoxDecoration(
                                  color:  MyColor.cardBgColor.withOpacity(0.2), ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Wallet ADD:', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          'Please enter your wallet address', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
                              decoration:  BoxDecoration(
                                color:  MyColor.cardBgColor.withOpacity(0.2), ),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Funding PW:', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                  const SizedBox(width: 2),
                                  Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                          'Please enter your fund password', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      ))),
                                ],
                              ),
                            ),

                            const SizedBox(height: 15),
                            Container(
                                alignment: Alignment.centerLeft,
                                margin:  const EdgeInsets.only(left: 10),
                                child: Text(
                                    'Friendly Reminder:', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 12.0,
                                ))),

                            const SizedBox(height: 70),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                    'Please make sure you fill in the correct wallet address\n information,otherwise the withdrawal will fail.', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 12.0,
                                ))),
                            const SizedBox(height: 30),
                        Align(
                            alignment: Alignment.center,
                                child: Container(
                                    margin: const EdgeInsets.only(left:15,right: 15),
                                    child:
                                    RoundedButton(
                                        cornerRadius:25,
                                        verticalPadding:15,
                                        width: 2,
                                        text: 'Ok',
                                        textColor: MyColor.colorWhite,
                                        color: MyColor.getButtonColor(),
                                        press: (){
                                        }
                                    ))),
                            const SizedBox(height: 100),

                          ],
                        )
                    ),

                  ],
                ))])),

            ),
          ),

    ));
  }



}
