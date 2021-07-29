import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: 200,
            //   width: 270,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 110),
            //     child: Stack(
            //       fit: StackFit.expand,
            //       alignment: Alignment.center,
            //       children: [
            //         CircleAvatar(
            //           backgroundImage: NetworkImage(
            //               'https://www.pngfind.com/pngs/m/57-573494_naruto-uzumaki-tierno-naruto-kid-hd-png-download.png'),
            //         ),
            //         Positioned(left: 120, bottom: 15, child: Icon(Icons.edit)),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //     padding: EdgeInsets.only(left: 100.0, top: 10.0),
            //     child: Text('Uzumaki Naruto')),
            // SizedBox(
            //   height: 10.0,
            // ),
            // Padding(
            //     padding: EdgeInsets.only(left: 100.0, top: 10.0),
            //     child: Text('dattebayo@gmail.com')),
            SizedBox(
              height: 20.0,
            ),
            ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    'Uzumaki Naruto',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    'dattebayo@gmail.com',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
