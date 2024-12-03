import 'package:flutter/material.dart';
import 'package:home/home/home.dart';
import 'package:home/home/search_home.dart';
import 'package:home/report/report.dart';
import 'package:home/sign_in/splash.dart';
import 'package:home/topic/topic.dart';
import 'package:home/staff/staff.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int _selectedIndex = 4;
  double _iconSpacing = 10.0; // Khoảng cách giữa chữ và icon

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Report(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Topic(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Staff(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Setting(),
          ),
        );
        break;
    }
  }

  void _updateIconSpacing(double spacing) {
    setState(() {
      _iconSpacing = spacing;
    });
  }

  void _showSettingsOverlay(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 1.0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: double.infinity,
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 47,
                                  height: 47,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.grey, width: 0.1),
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/avatar.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20), // Khoảng cách giữa ảnh và chữ
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nguyễn Ngọc Thảo',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 5), // Khoảng cách giữa hai dòng chữ
                                    Text(
                                      'Admin',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),ListTile(
                          leading: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => YourNewPage(),
                            //     ),
                            //   );
                            // },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/hoso.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Hồ sơ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => YourNewPage(),
                          //     ),
                          //   );
                          // },
                        ),
                        ListTile(
                          leading: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => YourNewPage(),
                            //     ),
                            //   );
                            // },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/thongtincanhan.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Thông tin cá nhân',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => YourNewPage(),
                          //     ),
                          //   );
                          // },
                        ),
                        ListTile(
                          leading: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => YourNewPage(),
                            //     ),
                            //   );
                            // },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/baomat.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Mật khẩu và bảo mật',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => YourNewPage(),
                          //     ),
                          //   );
                          // },
                        ),
                        ListTile(
                          leading: GestureDetector(
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => YourNewPage(),
                            //     ),
                            //   );
                            // },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/hotro.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Hỗ trợ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => YourNewPage(),
                          //     ),
                          //   );
                          // },
                        ),
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => Splash(),
                                ),
                                    (route) => false,
                              );
                            },
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/dangxuat.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            'Đăng xuất',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => Splash(),
                              ),
                                  (route) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Align(
            alignment: Alignment(0, -0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 60,),
                const Text(
                  'Cài đặt phân quyền',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    _showSettingsOverlay(context);
                  },
                  child: Image.asset(
                    'assets/images/detai.png',
                    width: 24, // Cỡ ảnh
                    height: 24, // Cỡ ảnh
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  height: 10,
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(25.0, 7.0, 25.0, 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchHome(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 50,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: Color(0xFFEBEBEB), // Thêm viền màu xanh
                                    width: 1.0,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.search, color: Colors.grey),
                                    SizedBox(width: 10),
                                    Text(
                                      'Tìm kiếm theo tên',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                // Thêm điều hướng
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xFFEBEBEB),
                                  width: 1.0,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Icon(Icons.tune, color: Colors.grey,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              color: _selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Tổng quan",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/totrinh.png',
              color: _selectedIndex == 1 ? Colors.blueAccent : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Tờ trình",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/caidat.png',
              color: _selectedIndex == 2 ? Colors.blueAccent : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Đề tài",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nhansu.png',
              color: _selectedIndex == 3 ? Colors.blueAccent : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Nhân sự",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/detai.png',
              color: _selectedIndex == 4 ? Colors.blueAccent : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Cài đặt",
          ),
        ],
      ),
    );
  }
}
