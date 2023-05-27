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
import '../../data/repo/auth/login_repo.dart';
import '../components/buttons/rounded_loading_button.dart';
import '../components/rounded_button.dart';
import '../components/text-field/custom_text_field.dart';


class PhoneNumberLoginScreen extends StatefulWidget {
  const PhoneNumberLoginScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberLoginScreen> createState() => _PhoneNumberLoginScreenState();
}

class _PhoneNumberLoginScreenState extends State<PhoneNumberLoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LoginRepo(apiClient: Get.find()));
    Get.put(LoginController(loginRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LoginController>().remember = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) =>
          Stack(
            children: <Widget>[
          Image.asset(
          "assets/icons/background.jpeg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        Align(alignment: Alignment.bottomCenter,
                child: SizedBox(
                    height: 600.0,child:
                SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.transparentColor,
            body: SingleChildScrollView(
              child:
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                        decoration: BoxDecoration(
                            color:  MyColor.getCardColor(),
                            border: Border.all(
                              color:  MyColor.getCardColor(),
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        padding: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: Dimensions.space20),
                            Align(
                                alignment: Alignment.topCenter,
                                child: HeaderText(text: MyStrings.numberLogin.tr,textAlign: TextAlign.center,textStyle: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'American',
                                ),)),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CustomTextField(
                                        needLabel:false,
                                        needOutlineBorder: true,
                                        controller: controller.emailController,
                                        hintText: MyStrings.phoneNumberHint.tr,
                                        onChanged: (value){},
                                        focusNode: controller.emailFocusNode,
                                        nextFocus: controller.passwordFocusNode,
                                        textInputType: TextInputType.emailAddress,
                                        inputAction: TextInputAction.next,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return MyStrings.fieldErrorMsg.tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),

                                      const SizedBox(height: 15),

                                      CustomTextField(
                                        needLabel:false,
                                        needOutlineBorder: true,
                                        hintText: MyStrings.passwordHint.tr,
                                        controller: controller.passwordController,
                                        focusNode: controller.passwordFocusNode,
                                        onChanged: (value){},
                                        isShowSuffixIcon: true,
                                        isPassword: true,
                                        textInputType: TextInputType.text,
                                        inputAction: TextInputAction.done,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return MyStrings.fieldErrorMsg.tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),

                                      const SizedBox(height: 15),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            flex:9,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child:
                                                  Checkbox(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                      activeColor: MyColor.transparentColor,
                                                      checkColor: MyColor.getPrimaryColor(),
                                                      value: controller.remember,
                                                      side: MaterialStateBorderSide.resolveWith(
                                                            (states) => BorderSide(
                                                            width: 1.0,
                                                            color: controller.remember ? MyColor.getFieldEnableBorderColor() : MyColor.getFieldDisableBorderColor()
                                                        ),
                                                      ),
                                                      onChanged: (value){
                                                        controller.changeRememberMe();
                                                      }
                                                  ),
                                                ),
                                                SizedBox(width: 2,
                                                ),
                                                DefaultText(text: MyStrings.rememberMe.tr, textColor: MyColor.getTextColor(),fontSize: 13.0 ,)
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex:6,
                                            child: TextButton(
                                                onPressed: (){
                                                  controller.clearTextField();
                                                  Get.toNamed(RouteHelper.forgetPasswordScreen);
                                                },
                                                child: DefaultText(text: MyStrings.forgotPassword.tr, textColor: MyColor.getTextColor(),fontSize: 13.0,)),
                                          )
                                        ],
                                      ),

                                      const SizedBox(height: 25),

                                      controller.isSubmitLoading ? const RoundedLoadingBtn() : RoundedButton(
                                          cornerRadius:25,
                                          verticalPadding:15,
                                          width: 2,
                                          textColor: MyColor.colorWhite,
                                          color: MyColor.getButtonColor(),
                                          text: MyStrings.signIn.toUpperCase().tr,
                                          press: (){
                                           /// if(formKey.currentState!.validate()){
                                            //  controller.loginUser();
                                            Get.offAndToNamed(RouteHelper.newHomeScreen);
                                            //   Get.offAndToNamed(RouteHelper.emailLoginScreen);
                                          //  }
                                          }
                                      ),
                                      const SizedBox(height: 10),

                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: TextButton(
                                              onPressed: (){
                                                Get.offAndToNamed(RouteHelper.numberRegistrationScreen);
                                              },
                                              child: Text(MyStrings.createAccount.tr, maxLines: 2, overflow:TextOverflow.ellipsis,style: interRegularLarge.copyWith(color: MyColor.colorWhite,fontSize: 13.0,)),
                                            ),
                                          ),
                                          const SizedBox(width: Dimensions.space5),
                                          Expanded(
                                              flex:10,
                                              child: Container(
                                                margin: const EdgeInsets.only(left:20,right: 0.0),
                                                child:Text(MyStrings.notRegistered.tr, overflow:TextOverflow.ellipsis,style: interRegularLarge.copyWith(color: MyColor.getTextColor2(), fontSize: 13.0,)),
                                              )),

                                        ],
                                      ),
                                      const SizedBox(width: Dimensions.space5),
                                      TextButton(
                                        onPressed: (){


                                        },
                                        child: Text(MyStrings.onlineService.tr, style: interRegularLarge.copyWith(color: MyColor.colorWhite)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 30),

                          ],
                        )
                    ),
                  ],
                )),
            ),
          ),
                ))),
   ]) );
  }



}
