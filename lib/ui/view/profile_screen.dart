import 'package:flutter/material.dart';
import 'package:lms_app/ui/view/widget/info_card.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

const st_id = '96361073';
const email = 'mahmud@example.com';
const phone = '09130618351';

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Theme.of(context).primaryColor,
    ));

    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('پروفایل'),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              CircleAvatar(
                radius: 50,
                //backgroundImage: AssetImage(''),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text('hossein ghojavand'),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.teal.shade700,
                ),
              ),
              InfoCard(
                text: phone,
                icon: Icons.phone,
                onPressed: () {
                  //
                },
              ),
              InfoCard(
                text: email,
                icon: Icons.email,
                onPressed: () {
                  //
                },
              ),
              InfoCard(
                text: st_id,
                icon: Icons.web,
                onPressed: () {
                  //
                },
              ),
            ],
          ));
    });
  }
}
