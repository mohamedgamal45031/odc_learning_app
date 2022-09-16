import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:odc_workshop/utils/network/end_points.dart';
import 'package:odc_workshop/utils/network/local/cache_helper.dart';
import 'package:odc_workshop/view/pages/bottom_bar.dart';
import 'package:odc_workshop/view/pages/support.dart';

import '../components/core/constants.dart';
import 'Login.dart';
import 'Partners.dart';
import 'Terms.dart';
import 'faq_screen.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      "FaQ",
      "terms & Conditions",
      "Our Partners",
      "Support",
      "Log out"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomBar()), (route) => false);
            },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
        centerTitle: true,
        title:  Text('Settings',
            style: fontStyle),
      ),
      body: MediaQuery(
        data: new MediaQueryData(),
        child: Container(
            margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 20,
                MediaQuery.of(context).size.width / 20,
                MediaQuery.of(context).size.height / 40),
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      navigateToWherever(entries[index], context);
                    },
                    child: ListTile(
                      title: Text('${entries[index]}',style: fontStyleSettings,),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            )),
      ),
    );
  }

  void navigateToWherever(String entry, BuildContext context) {
    switch (entry) {
      case 'FaQ':
        Navigator.push(context, MaterialPageRoute(builder: (context) => FaqScreen()));
        break;
      case 'terms & Conditions':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Terms()));
        break;
      case 'Our Partners':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Our_Parteners()));
        break;
      case 'Support':
        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
        break;
      case 'Log out':
        CoolAlert.show(
            context: context,
            width: 20,
            backgroundColor: Colors.white,
            type: CoolAlertType.confirm,
            text: 'Are you Sure to log out',
            confirmBtnText: 'Yes',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.red,
            onConfirmBtnTap: (){
              CacheHelper.remove(key: "token");
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            }

        );
        break;

    }
  }
}


