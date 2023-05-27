import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyip_lab/core/routes/route.dart';
import 'package:hyip_lab/core/utils/dimensions.dart';
import 'package:hyip_lab/core/utils/my_color.dart';
import 'package:hyip_lab/core/utils/my_strings.dart';
import 'package:hyip_lab/core/utils/style.dart';
import 'package:hyip_lab/data/controller/auth/auth/registration_controller.dart';
import 'package:hyip_lab/data/repo/auth/general_setting_repo.dart';
import 'package:hyip_lab/data/repo/auth/signup_repo.dart';
import 'package:hyip_lab/data/services/api_service.dart';
import 'package:hyip_lab/view/components/custom_no_data_found_class.dart';
import 'package:hyip_lab/view/components/custom_loader/custom_loader.dart';
import 'package:hyip_lab/view/components/text/default_text.dart';
import 'package:hyip_lab/view/components/text/header_text.dart';
import 'package:hyip_lab/view/components/will_pop_widget.dart';
import 'package:hyip_lab/view/new_screens/widget/email_registration_form.dart';
import 'package:hyip_lab/view/new_screens/widget/number_registration_form.dart';
import 'package:hyip_lab/view/screens/auth/registration/widget/registration_form.dart';


class NumberRegistrationScreen extends StatefulWidget {
  const NumberRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<NumberRegistrationScreen> createState() => _NumberRegistrationScreenState();
}

class _NumberRegistrationScreenState extends State<NumberRegistrationScreen> {
  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(GeneralSettingRepo(apiClient: Get.find()));
    Get.put(RegistrationRepo(apiClient: Get.find()));
    Get.put(RegistrationController(registrationRepo: Get.find(), generalSettingRepo: Get.find()));


    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RegistrationController>().initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.numberLogInScreen,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: MyColor.getScreenBgColor(),
            body: controller.noInternet ? NoDataOrInternetScreen(
              isNoInternet: true,
              onChanged: (value){
                controller.changeInternet(value);
              },
            ) : controller.isLoading ? const CustomLoader() : SingleChildScrollView(
              child:Container(
                decoration:   const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/background.jpeg'),
                    fit: BoxFit.fill,
                  ),),
                child:
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 120),
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
                          child: HeaderText(text: MyStrings.numberRegistration.tr,textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),)),
                            const SizedBox(height: 20),
                            const NumberRegistrationForm(
                            ),
                          ],
                        )
                    ),
                  ],
                ))),
            ),
          ),
        ),
      ),
    );
  }



}
