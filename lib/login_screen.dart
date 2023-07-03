import 'package:flutter/material.dart';
import 'package:object_detection/HomeScreen.dart';
import 'package:object_detection/text_button_widget.dart';
import 'package:object_detection/validate_non_empty.dart';
import 'constants.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   // DataProvider provider=Provider.of<DataProvider>(Get.context!,listen: false);
   TextEditingController passwordController=TextEditingController();
   TextEditingController emailController=TextEditingController();
   bool pass=true;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: mediumText("Log In",size: 20)),
            SizedBox(height: 40,),
            Container(
              // height: provider.hh(context, 650),
              padding: EdgeInsets.only(top: 40,left: 20,right: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      largerText("Welocome",color: kBlackColor,size: 20),
                      mediumText("Enter User Data", color: kLightBlackColor,size: 16),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            height:60,
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kBackgoundColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.email_outlined,color: kWhiteColor,size: 30,),
                          ),
                          SizedBox(width: 20,),
                          Flexible(
                            fit: FlexFit.loose,
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  label: mediumText("Email",color: kBlackColor)
                              ),
                              validator: (validate) => validateNonEmpty(validate!),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            height:60,
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: kBackgoundColor,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Icon(Icons.lock_outline,color: kWhiteColor,size: 30,),
                          ),
                          SizedBox(width: 20,),
                          Flexible(
                              fit: FlexFit.loose,
                              child: TextFormField(
                                obscureText: pass,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  label: mediumText("Password",color: kBlackColor),
                                  suffixIcon: InkWell(
                                      onTap: (){
                                        setState(() {
                                          if(pass==true){
                                            pass=false;
                                          }else{
                                            pass=true;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.remove_red_eye_outlined,color: kBlackColor,)),
                                ),

                                validator: (validate) => validateNonEmpty(validate!),
                              )
                          ),

                        ],
                      ),
                      SizedBox(height: 70),
                      TextButtonWidget(text:"Log In",onPress: () async{
                        if(!_formKey.currentState!.validate()){
                          return;
                        }
                        _formKey.currentState!.save();

                        if(emailController.text == "admin" && passwordController.text == "admin"){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }else{
                          showSnackbar(context, "Incorrect Password", kRedColor);
                        }

                      },borderRadius: 10,bgColor: kBackgoundColor,borderColor:kBackgoundColor,textColor: kWhiteColor,),
                      SizedBox(height: 10,),

                    ],),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


