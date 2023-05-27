import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hyip_lab/core/routes/route.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/data/controller/auth/auth/registration_controller.dart';
import 'package:hyip_lab/view/components/buttons/rounded_loading_button.dart';
import 'package:hyip_lab/view/components/rounded_button.dart';
import 'package:hyip_lab/view/components/text-field/custom_text_field.dart';
import 'package:hyip_lab/view/screens/auth/registration/widget/country_bottom_sheet.dart';
import 'package:hyip_lab/view/screens/auth/registration/widget/validation_widget.dart';

class NumberRegistrationForm extends StatefulWidget {

  const NumberRegistrationForm({Key? key}) : super(key: key);

  @override
  State<NumberRegistrationForm> createState() => _NumberRegistrationFormState();
}

class _NumberRegistrationFormState extends State<NumberRegistrationForm> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller){
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              CustomTextField(
                needLabel:false,
                needOutlineBorder: true,
                hintText: MyStrings.enterYourEmailAddress.tr,
/*
                controller: controller.emailController,
                focusNode: controller.emailFocusNode,*/
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!=null && value.isEmpty) {
                    return MyStrings.enterYourEmail.tr;
                  } else if(!MyStrings.emailValidatorRegExp.hasMatch(value??'')) {
                    return MyStrings.invalidEmailMsg.tr;
                  }else{
                    return null;
                  }
                },
                onChanged: (value) {
                  return;
                },
              ),
              const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(bottom:2.0,left: 2.0,right: 2.0,top: 2.0),
            decoration: BoxDecoration(
              border: Border.all(color: MyColor.colorWhite),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Expanded(
                 flex:2,
                   child:TextField(
/*
                     controller:  controller.emailController,
*/
                     decoration:InputDecoration(
                       contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                       hintText: MyStrings.enterVerificationCode.tr, border: InputBorder.none,
                       hintStyle: interRegularSmall.copyWith(color: MyColor.getHintTextColor()),
                       fillColor: MyColor.transparentColor,
                       filled: true,)

                   ),
                   ) ,
                const SizedBox(width: 2),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: const EdgeInsets.only(top: 14, right: 3.0),
              child:
                  Text(
                      'Get verification \n        code', style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                    fontSize: 12.0,
                ))))
              ],
            ),
          ),

              const SizedBox(height: 15),
              Visibility(
                  visible: controller.hasPasswordFocus && controller.checkPasswordStrength,
                  child: ValidationWidget(list: controller.passwordValidationRulse,)),
              Focus(
                  onFocusChange: (hasFocus){
                    controller.changePasswordFocus(hasFocus);
                  },
                  child: CustomTextField(
                    needLabel:false,
                    needOutlineBorder: true,
                    isShowSuffixIcon: true,
                    isPassword: true,
                    controller: controller.passwordController,
                    focusNode: controller.passwordFocusNode,
                    nextFocus: controller.confirmPasswordFocusNode,
                    hintText: MyStrings.enterYourPassword_.tr,
                    textInputType: TextInputType.text,
                    onChanged: (value) {
                      if(controller.checkPasswordStrength){
                        controller.updateValidationList(value);
                      }
                    },
                    validator: (value) {
                      return controller.validatPassword(value ?? '');
                    },
                  )),
              const SizedBox(height: 15),
              CustomTextField(
                needLabel:false,
                needOutlineBorder: true,
                hintText: MyStrings.confirmYourPassword.tr,
                controller: controller.cPasswordController,
                focusNode: controller.confirmPasswordFocusNode,
                inputAction: TextInputAction.done,
                isShowSuffixIcon: true,
                isPassword: true,
                onChanged: (value) {},
                validator: (value) {
                  if (controller.passwordController.text.toLowerCase() != controller.cPasswordController.text.toLowerCase()) {
                    return MyStrings.kMatchPassError.tr;
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomTextField(
                needLabel:false,
                needOutlineBorder: true,
                hintText: MyStrings.enterInvitionCode.tr,
/*
                controller: controller.emailController,

                focusNode: controller.emailFocusNode,*/
                textInputType: TextInputType.emailAddress,
                inputAction: TextInputAction.next,
                validator: (value) {
                  if (value!=null && value.isEmpty) {
                    return MyStrings.enterYourEmail.tr;
                  } else if(!MyStrings.emailValidatorRegExp.hasMatch(value??'')) {
                    return MyStrings.invalidEmailMsg.tr;
                  }else{
                    return null;
                  }
                },
                onChanged: (value) {
                  return;
                },
              ),
              const SizedBox(height: 15),
              controller.submitLoading ? const RoundedLoadingBtn() : RoundedButton(
                  cornerRadius:25,
                  verticalPadding:15,
                  width: 2,
                  text: MyStrings.register.tr,
                  textColor: MyColor.colorWhite,
                  color: MyColor.getButtonColor(),
                  press: (){
                   /* if (formKey.currentState!.validate()) {
                      controller.signUpUser();
                    }*/
                  }
              ),
              const SizedBox(height: 15),

              Row(
                children: [
                  Text(MyStrings.alreadyAccount.tr, style: interRegularLarge.copyWith(color: MyColor.getTextColor2(), fontWeight: FontWeight.w200)),
                  const SizedBox(width: Dimensions.space5),
                /*  TextButton(
                    onPressed: (){
                      controller.clearAllData();
                      Get.offAndToNamed(RouteHelper.loginScreen);
                    },
                    child: Text(MyStrings.signIn.tr, style: interRegularLarge.copyWith(color: MyColor.getPrimaryColor())),
                  )*/
                ],
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: controller.needAgree,
                child: Row(
                children: [
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        activeColor: MyColor.transparentColor,
                        checkColor: MyColor.getPrimaryColor(),
                        value: controller.agreeTC,
                        side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                              width: 1.0,
                              color: controller.agreeTC ? MyColor.getFieldEnableBorderColor() : MyColor.getFieldDisableBorderColor()
                          ),
                        ),
                        onChanged: (bool? value) {
                          controller.updateAgreeTC();
                        },
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Row(
                    children: [
                      Text(MyStrings.iAgreeWith.tr, style: interRegularDefault.copyWith(color: MyColor.getTextColor2())),
                      const SizedBox(width: 3),
                      GestureDetector(
                        onTap: (){
                         // Get.toNamed(RouteHelper.termsAgreementsScreen);
                        },
                        child: Text(MyStrings.termsAndAgreements.tr, style: interRegularDefault.copyWith(color: MyColor.getTextColor2())),
                      ),
                      const SizedBox(width: 3),
                    ],
                  ),

                ],
              )),

            ],
          ),
        );
      },
    );
  }
}