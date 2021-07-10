import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fprofile&psig=AOvVaw3u3__O-pY--lsYeq2RE7PN&ust=1625983436385000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCKDD38Pq1_ECFQAAAAAdAAAAABAM"; 
    return Drawer(
      child: Container (
        color: Colors.lightBlueAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                accountName: Text("Prashant"),
                accountEmail: Text("sutariya2001@gmail.com"),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                
              ),
              title: Text("Home",textScaleFactor: 1.2 ,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled
                
              ),
              title: Text("Profile",textScaleFactor: 1.2 ,),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                
              ),
              title: Text("E-mail",textScaleFactor: 1.2 ,),
            )

          ],
        ),
      ),
    );
  }
}
