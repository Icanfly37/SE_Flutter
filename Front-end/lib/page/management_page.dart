import 'package:Kusrc_table/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class ManagementPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text('ระบบจัดตารางสอนอาจารย์ มหาวิทยาลัยเกษตรศาสตร์',),
          titleTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold
            ),
          // centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(3, 169, 107, 1),
        ),
        body: Center(
          child: Text('การจัดการหลักสูตร',
          style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
