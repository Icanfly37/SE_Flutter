import 'package:Kusrc_table/data/user.dart';
import 'package:Kusrc_table/model/navigation_item.dart';
import 'package:Kusrc_table/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: Color.fromRGBO(47, 51, 55, 1),
          child: ListView(
            children: <Widget>[
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                rank: rank,
              ),
              Divider(color: Color.fromARGB(87, 255, 255, 255),),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.management,
                      text: 'การจัดการหลักสูตร',
                      icon: UniconsLine.table,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.register_time,
                      text: 'ลงทะเบียนเวลาสอน',
                      icon: UniconsLine.list_ul,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.timetable,
                      text: 'ตารางสอน',
                      icon: UniconsLine.calendar_alt,
                    ),
                    // const SizedBox(height: 250),
                    // buildMenuItem(
                    //   context,
                    //   item: NavigationItem.logout,
                    //   text: 'ออกจากระบบ',
                    //   icon: UniconsLine.signout,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;

    final color = isSelected ? Colors.white : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        selectedTileColor: Color.fromRGBO(3, 169, 107, 1),
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(
          color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String rank,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          // onTap: () => selectItem(context, NavigationItem.header),
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: Color.fromRGBO(3, 169, 107, 1)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      rank,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
