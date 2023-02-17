import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.icons,
    required this.title,
  });

  final List<IconData?> icons;
  final List<String> title;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: DrawerHeader(
                    child: Icon(
                      Icons.apps_outlined,
                      color: Colors.grey.shade600,
                      size: 30,
                    ),
                  )),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      icons[index],
                      color: Colors.black,
                    ),
                    title: Text(
                      title[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
            // Container(
            //   height: screenWidth * 0.038,
            //   width: screenHeight * 0.095,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black),
            //   ),
            // ),
            // 10.ph,
          ],
        ),
      ),
    );
  }
}
//
// extension EmptyPadding on num {
//   SizedBox get ph {
//     return SizedBox(height: toDouble());
//   }
//
//   SizedBox get pw {
//     return SizedBox(width: toDouble());
//   }
// }
