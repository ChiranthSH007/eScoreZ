import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'emailloginpage.dart';
import 'emailsignuppage.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  User? userdetails = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userdetails!.displayName.toString(),
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              'dattebayo@gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://dev.mangajam.com/wp-content/uploads/2017/07/How-Draw-Child-Naruto-Naruto-11.jpg',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey[850],
                image: DecorationImage(image: NetworkImage(''))),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
