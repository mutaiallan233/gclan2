import 'package:explore/utils/stkpush.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Mydialog extends StatefulWidget {
  // final Function startcheck;
  //Mydialog({this.startcheck});
  @override
  _MydialogState createState() => _MydialogState();
}

class _MydialogState extends State<Mydialog> {
  final formkey = GlobalKey<FormState>();
  String numz, phonenumber='';
  SharedPreferences sharedPreferences;
  bool _isChecked = false;

  TextEditingController phoneController = TextEditingController();
  //TextEditingController amountController = TextEditingController();
  getstateinfo() async {
    print('state info running');
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.getString('remphoneNumber') != null
          ? phonenumber = sharedPreferences.getString('remphoneNumber')
          : print('key phoneNumber not found');
    });
    setState(() {
      sharedPreferences.getString('remphoneNumber') != null
          ? _isChecked = true
          : print('checked is $_isChecked');
    });
  }

  @override
  void initState() {
    getstateinfo();
    super.initState();
  }

  TextStyle style = TextStyle(fontSize: 12);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200,bottom: 200,left: 50,right: 50),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                     
                    // ignore: missing_return
                    validator: (value) {
                      if ((value).isEmpty) {
                        return 'please enter a valid safaricom number';
                      }
                      if ((value).length < 9) {
                        return 'please enter a valid safaricom number';
                      }
                      if (!((value).startsWith('070') ||
                          (value).startsWith('071') ||
                          (value).startsWith('072') ||
                          (value).startsWith('079') ||
                          (value).startsWith('0740') ||
                          (value).startsWith('0741') ||
                          (value).startsWith('0742') ||
                          (value).startsWith('0743') ||
                          (value).startsWith('0745') ||
                          (value).startsWith('0746') ||
                          (value).startsWith('0748') ||
                          (value).startsWith('0757') ||
                          (value).startsWith('0758') ||
                          (value).startsWith('0759') ||
                          (value).startsWith('0768') ||
                          (value).startsWith('0769') ||
                          (value).startsWith('011'))) {
                        return 'invalid safaricom number';
                      }
                    },

                    keyboardType: TextInputType.phone,
                    style: style,
                    controller:
                        phonenumber != null ? phoneController : phoneController
                          ..text = phonenumber,
                    decoration: InputDecoration(
                      hintText: phonenumber != null
                          ? phonenumber
                          : 'enter phone number',
                      hintStyle: style,
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
          content: CheckboxListTile(
            title: Text(
              'remember my number',
              style: style,
            ),
            secondary: Icon(Icons.phone_android_outlined),
            value: _isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.blue,
            checkColor: Colors.green,
            onChanged: (val) {
              if (formkey.currentState.validate()) {
                setState(() {
                  _isChecked = val;
                });
                print(_isChecked);
                val
                    ? setState(() {
                        phoneController.text != null
                            ? phonenumber = phoneController.text
                            : print('isChecked' + _isChecked.toString());
                      })
                    : setState(() {
                        phonenumber = null;
                        print(phoneController.text);
                      });
              }
            },
          ),
          actions: [
            TextButton(
              onPressed: () async {
               /* if (formkey.currentState.validate()) {
                  sharedPreferences = await SharedPreferences.getInstance();
                  sharedPreferences.setString(
                      'remphoneNumber', phoneController.text);
                  
                    startCheckout(userPhone:'254'+phoneController.text.substring(1),amount:'50').then((value) {
                      Navigator.of(context).pop();
                    });
                   // widget.startcheck();
                  // });
                  _isChecked
                      ? sharedPreferences
                          .setString('remphoneNumber', phoneController.text)
                          .then((value) {
                          print('phone number is: ' + phoneController.text);
                          print('checked is: ' + _isChecked.toString());
                          Fluttertoast.showToast(
                                  msg:
                                      'We Won\'t ask you for your phone number next time😀')
                              .then((value) => Fluttertoast.showToast(
                                  msg:
                                      'please follow prompt to complete payment'));
                        })
                      : sharedPreferences.remove('remphoneNumber').then((value) {
                          Fluttertoast.showToast(msg: 'We won\'t remember that ☺')
                              .then((value) => Fluttertoast.showToast(
                                  msg:
                                      'please follow prompt to complete payment'));
                          print(sharedPreferences.get('phoneNumber'));
                          print('cleared');
                        });

                  print('not empty');
                } else {
                  print('controller is empty');
                }*/
              },
              child: Text(
                'Pay now',
                style: style,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
