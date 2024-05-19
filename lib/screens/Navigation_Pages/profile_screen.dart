import 'package:caferia/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isExpand = false;
  bool _isExpanded = false;
  double _rating = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height / 3.8),
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height / 4.5,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  image: DecorationImage(
                      image: AssetImage("assets/Images/apptheme.webp"),
                      fit: BoxFit.cover,
                      opacity: .4)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width/14,),
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xffFFF2E1),
                        fontSize: 43,
                        fontWeight: FontWeight.w400),
                  ),
                  // Container(
                  //   height: size.height / 6,
                  //   width: size.width / 2,
                  //   decoration: BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/Images/coffee.png"))),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150, left: 28),
              child: Container(
                  height: size.height/12,
                  width: size.width / 1.15,
                  decoration: BoxDecoration(
                      color: Color(0xffEEE8F4),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CircleAvatar(maxRadius: 26,
                      backgroundColor: Color(0xffE65836),
                      //   backgroundImage: NetworkImage("https://www.renderhub.com/zcnaipowered/gallery/made-a-quick-profile-picture-using-a-i.jpg"),
                      child: Icon(Icons.person,color: Colors.white,),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName,style: TextStyle(fontSize: 13),),
                          Text(userEmail,style: TextStyle(fontSize: 13),),
                          // Text(userName),
                          // Text(userEmail),
                        ],
                      ),
                      Card(
                        color: Color(0xffE65836),
                        shape: CircleBorder(),
                        child: IconButton(onPressed: () {

                        }, icon: Icon(CupertinoIcons.pencil,color: Colors.white,)),
                      )
                    ],
                  )
              ),
            )
          ])),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            _buildRestaurantCard(),
            _buildMenuCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildRestaurantCard() {

    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Account'),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text(
                    'Account details',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text(
                    'Payment details',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text(
                    'Order history',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today_outlined),
                  title: Text(
                    'Rewards',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.discount_sharp),
                  title: Text(
                    'Student discount',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMenuCard() {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: const Text('Notification'),
            onTap: () {
              setState(() {
                _isExpand = !_isExpand;
              });
            },
          ),
          if (_isExpand)
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text(
                    'Receive Notification',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text(
                    'Payment details',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}