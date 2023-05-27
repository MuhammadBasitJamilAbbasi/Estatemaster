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


class TeamAnalysisScreen extends StatefulWidget {
  const TeamAnalysisScreen({Key? key}) : super(key: key);

  @override
  State<TeamAnalysisScreen> createState() => _TeamAnalysisScreenState();
}

class _TeamAnalysisScreenState extends State<TeamAnalysisScreen> {
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
                            child: HeaderText(text: 'Team Analysis',textAlign: TextAlign.center,textStyle: const TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'American',
                            ),))
                    ),
                    const SizedBox(height: 25),
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
                        padding: const EdgeInsets.only(top: 5,left: 2,right: 2,bottom: 15),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const SizedBox(height: 20),

                            Container(
                              decoration:   BoxDecoration(
                                  color:  MyColor.cardBgColor.withOpacity(0.4),
                                  borderRadius: const BorderRadius.all( Radius.circular(30.0))),
                              padding: const EdgeInsets.only(top: 15,left: 2,bottom: 15,right: 2),
                              margin: const EdgeInsets.only(top: 5,left: 5,bottom: 5,right: 5),
                              child:Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('0', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                      Text('Yesterday`s team \n    commission', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),
                                      const SizedBox(height: 10),
                                      Text('0', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                      Text('Active Count\n     Today', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),

                                    ],
                                  ),
                                  const SizedBox(width: 2),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('0.00(0)', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                      Text('Commulative team\n commission(person)', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),
                                      const SizedBox(height: 10),
                                      Text('0', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14),textAlign: TextAlign.center,),
                                      Text('     Added \n     People', style: interRegularLarge.copyWith(color: MyColor.getTextColor(),fontSize: 14)),
                                    ],
                                  ),

                                ],
                              ),
                            ),

                            const SizedBox(height: 20),
                            Container(
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              child:SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child:
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV1(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV2(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(textAlign:TextAlign.left,text: 'LV3(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV4(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width:8),

                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV5(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV6(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV7(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 8),

                                  Container(
                                    height: 32,width: 55,
                                    decoration:  BoxDecoration(
                                      color:  MyColor.gradientStartColor, ),
                                    child:
                                    TextButton(
                                        onPressed: (){
                                        },
                                        child: DefaultText(text: 'LV8(0)', textColor: MyColor.getTextColor(),fontSize: 11.0,)),
                                  ),
                                  const SizedBox(width: 2),
                                ],
                              )),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 5),
                              decoration:  BoxDecoration(
                                color:  MyColor.cardBgColor.withOpacity(0.2), ),
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                          'Member\nAccount', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                        fontSize: 12.0,
                                      )),
                                  const SizedBox(width: 2),

                                  Text(
                                      'Registration\nTime', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                    fontSize: 12.0,
                                  )),
                                  const SizedBox(width: 2),


                                  Text(
                                      'Account\nBalance', textAlign: TextAlign.center,style: interRegularLarge.copyWith(color: MyColor.colorWhite,
                                    fontSize: 12.0,
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(height: 250),

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
