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


class FundPasswordScreen extends StatefulWidget {
  const FundPasswordScreen({Key? key}) : super(key: key);

  @override
  State<FundPasswordScreen> createState() => _FundPasswordScreenState();
}

class _FundPasswordScreenState extends State<FundPasswordScreen> {
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
                            child: HeaderText(text: 'Fund Password',textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 25),
                    Container(
                        height: 550,
                        decoration: BoxDecoration(
                            color:  MyColor.getCardColor(),
                            border: Border.all(
                              color:  MyColor.getCardColor()
                              ,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        padding: const EdgeInsets.only(top: 5,left: 2,right: 2,bottom: 15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                    'Create a Fund Password', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 20.0,
                                ))),
                            const SizedBox(height: 40),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                    'Kindly the establish the Fund Password in \norder to apply for payment verification.', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 14.0,
                                ))),
                            const SizedBox(height: 30),
                            Container(
                                margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),

                                child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                    SizedBox(
                          height: 50,
                          width: 45,
                          child:CustomTextField(
                            needLabel:false,
                            needOutlineBorder: true,
                            isShowSuffixIcon: true,
                            isPassword: false,
                            /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                            hintText: '',
                            textInputType: TextInputType.text,
                            onChanged: (value) {
                              /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                            },
                            validator: (value) {
                              //return controller.validatPassword(value ?? '');
                            },
                          ),
                        ),
                                    SizedBox(
                          height: 50,
                          width: 45,
                          child:CustomTextField(
                            needLabel:false,
                            needOutlineBorder: true,
                            isShowSuffixIcon: true,
                            isPassword: false,
                            /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                            hintText: '',
                            textInputType: TextInputType.text,
                            onChanged: (value) {
                              /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                            },
                            validator: (value) {
                              //return controller.validatPassword(value ?? '');
                            },
                          ),
                        ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),

                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
])),
                            const SizedBox(height: 40),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                    'Please enter the Fund Password', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 14.0,
                                ))),
                            const SizedBox(height: 20),
                            Container(
                                margin: const EdgeInsets.only(top: 2,left: 5,bottom: 5,right: 5),

                                child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),

                                      SizedBox(
                                        height: 50,
                                        width: 45,
                                        child:CustomTextField(
                                          needLabel:false,
                                          needOutlineBorder: true,
                                          isShowSuffixIcon: true,
                                          isPassword: false,
                                          /* controller: controller.passwordController,
                          focusNode: controller.passwordFocusNode,
                          nextFocus: controller.confirmPasswordFocusNode,*/
                                          hintText: '',
                                          textInputType: TextInputType.text,
                                          onChanged: (value) {
                                            /*if(controller.checkPasswordStrength){
                              controller.updateValidationList(value);
                            }*/
                                          },
                                          validator: (value) {
                                            //return controller.validatPassword(value ?? '');
                                          },
                                        ),
                                      ),
                                    ])),
                            const SizedBox(height: 70),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 220,
                                    margin: const EdgeInsets.only(left:5,top: 8),
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
