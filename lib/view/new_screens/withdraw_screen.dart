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
import '../components/bottom_Nav/bottom_nav.dart';
import '../components/buttons/rounded_loading_button.dart';
import '../components/rounded_button.dart';
import '../components/text-field/custom_text_field.dart';


class WithDrawScreen extends StatefulWidget {
  const WithDrawScreen({Key? key}) : super(key: key);

  @override
  State<WithDrawScreen> createState() => _WithDrawScreenState();
}

class _WithDrawScreenState extends State<WithDrawScreen> {
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
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                            child: HeaderText(text: 'Withdraw',textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 20),


                    Container(
                        height: MediaQuery.of(context).size.height * 0.8 ,

                        decoration: BoxDecoration(
                            color:  MyColor.getCardColor(),
                            border: Border.all(
                              color:  MyColor.getCardColor()
                              ,
                            ),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                        padding: const EdgeInsets.only(top: 5,left: 25,right: 25,bottom: 0),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Container(
                              height: 65,
                                decoration:
                                BoxDecoration(
                                    color:  MyColor.cardBgColor.withOpacity(0.4),

                                    borderRadius: const BorderRadius.all( Radius.circular(30.0))),
                                padding: const EdgeInsets.all(15),
                                child:
                                Align(
                                    alignment: Alignment.center,
                                    child: HeaderText(text: 'Current Balance',textAlign: TextAlign.center,textStyle: const TextStyle(
                                      fontSize: 22.0,
                                    ),))
                            ),
                            const SizedBox(height: 20),
                            Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                    'Withdraw Record', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 12.0,
                                ))),
                            const SizedBox(height: 15),
                            CustomTextField(
                              needLabel:false,
                              needOutlineBorder: true,
                              hintText: 'Wallet ADD:',
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              validator: (value) {

                              },
                              onChanged: (value) {
                                return;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              needLabel:false,
                              needOutlineBorder: true,
                              hintText: 'Wallet Type:',
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              validator: (value) {

                              },
                              onChanged: (value) {
                                return;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              needLabel:false,
                              needOutlineBorder: true,
                              hintText: 'Withdrawal Amount',
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              validator: (value) {

                              },
                              onChanged: (value) {
                                return;
                              },
                            ),

                            const SizedBox(height: 10),
                            CustomTextField(
                              needLabel:false,
                              needOutlineBorder: true,
                              hintText: 'Funding PW',
                              textInputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next,
                              validator: (value) {

                              },
                              onChanged: (value) {
                                return;
                              },
                            ),
                            const SizedBox(height: 15),

                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Minimum withdrawal fee or withdrawal rate. ', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                  fontSize: 12.0,
                                ))),
                            const SizedBox(height: 20),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin: const EdgeInsets.only(left:5,top: 8),
                                    child:
                                    RoundedButton(
                                        cornerRadius:25,
                                        verticalPadding:15,
                                        width: 2,
                                        text: 'Withdraw',
                                        textColor: MyColor.colorWhite,
                                        color: MyColor.getButtonColor(),
                                        press: (){
                                        }
                                    ))),

                          ],
                        )
                    ),

                  ],
                )),
])
            ),
          ),
        ),
      ])
    );
  }



}
