import 'package:flutter/material.dart';
import 'package:home/home/home.dart';
import 'package:home/report/report.dart';
import 'package:home/report/infor_report.dart';
import 'package:home/report/version_report.dart';
import 'package:home/report/doc_report.dart';
import 'package:home/topic/topic.dart';
import 'package:home/staff/staff.dart';

class ReportDetail extends StatefulWidget {
  final String reportTitle;

  const ReportDetail({Key? key, required this.reportTitle}) : super(key: key);

  @override
  _ReportDetailState createState() => _ReportDetailState();
}

class _ReportDetailState extends State<ReportDetail> {
  int _selectedIndex = 1;

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
            builder: (context) => DocumentReport(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 20.0),
          child: Text(
            'Tờ trình số ${widget.reportTitle}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationReport(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 13),
                  constraints: BoxConstraints(minHeight: 48),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thông tin tờ trình',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VersionReport(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  constraints: BoxConstraints(minHeight: 48),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phiên bản tờ trình',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentReport(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  constraints: BoxConstraints(minHeight: 48),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tài liệu tờ trình',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

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
