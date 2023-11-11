import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize FlutterScreenUtil
    ScreenUtil.init(context, designSize: Size(750, 1334));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: ScreenUtil().setWidth(150),
                backgroundImage: AssetImage('assets/profile_image.jpg'),
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(60),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Text(
                'john.doe@example.com',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(50)),
              buildInfoRow(Icons.location_on, 'San Francisco, CA'),
              SizedBox(height: ScreenUtil().setHeight(20)),
              buildInfoRow(Icons.phone, '+1 123-456-7890'),
              SizedBox(height: ScreenUtil().setHeight(20)),
              buildInfoRow(Icons.web, 'www.example.com'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: ScreenUtil().setSp(50),
        ),
        SizedBox(width: ScreenUtil().setWidth(20)),
        Text(
          text,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(40),
          ),
        ),
      ],
    );
  }
}
