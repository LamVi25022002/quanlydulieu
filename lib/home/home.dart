import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:home/database/database.dart';
import 'package:home/models/reports.dart';
import 'package:home/home/home_filter.dart';
import 'package:home/home/search_home.dart';
import 'package:home/report/report.dart';
import 'package:home/setting/setting.dart';
import 'package:home/staff/staff.dart';
import 'package:home/topic/topic.dart';
import 'package:home/report/add_report.dart';
import 'package:home/topic/add_topic.dart';
import 'package:home/staff/add_staff.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late Future<List<Reports>> _reportsFuture;

  @override
  void initState() {
    super.initState();
    _reportsFuture = DatabaseService().getReports();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildCategoryRows(),
            SizedBox(height: 25),
            FutureBuilder<List<Reports>>(
              future: _reportsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No data available'));
                } else {
                  List<Reports> reports = snapshot.data!;
                  return _buildBarChart(reports);
                }
              },
            ),
          ],
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 0,
            right: 0,
            bottom: 10,
          ),
          child: Image.asset(
            'assets/images/logoCIE.png',
            width: 47,
            height: 52,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Image.asset(
                'assets/images/scan.png', color: Colors.black,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Xử lý khi ấn vào biểu tượng scan
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/images/bell.png', color: Colors.black,
                width: 24,
                height: 24,
              ),
              onPressed: () {
                // Xử lý khi ấn vào biểu tượng scan
              },
            ),
            Container(
              width: 32,
              height: 32,
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
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchHome(),
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Color(0xFFEBEBEB),
                  width: 1.0,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'Nhập từ khóa',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFEBEBEB),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeFilter()
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(-11, 0),
                      child: const Icon(Icons.tune, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRows() {
    return Row(
      children: [
        SizedBox(width: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddReport()),
            );
          },
          child: _buildCategoryCard(
            title: 'Tờ trình',
            image: 'assets/images/image1.png',
            count: 13,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTopic()),
            );
          },
          child: _buildCategoryCard(
            title: 'Đề tài',
            image: 'assets/images/image2.png',
            count: 23,
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddStaff()),
            );
          },
          child: _buildCategoryCard(
            title: 'Nhân sự',
            image: 'assets/images/image3.png',
            count: 42,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String image,
    required int count,
  }) {
    return Container(
      width: 98,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xFFE9EFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          if (count > 0)
            Positioned(
              top: 35,
              left: 10,
              right: 50,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ),
                ),
              ),
            ),
          Positioned(
            left: 10,
            bottom: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Thêm mới +',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 0.1),
              ),
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildBarChart(List<Reports> reports) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đề tài các năm',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: reports.map((report) => report.quantity.toDouble()).reduce((a, b) => a > b ? a : b) + 10,
              barGroups: reports.map((report) {
                return BarChartGroupData(
                  x: report.year - 2021,
                  barRods: [
                    BarChartRodData(
                      toY: report.quantity.toDouble(),
                      color: Color(0xFF8DB8FF),
                      width: 30,
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Trạng thái tờ trình',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: DataTable(
            columnSpacing: 20,
            columns: [
              DataColumn(label: Text('TT')),
              DataColumn(label: Text('Số tờ trình')),
              DataColumn(label: Text('Người ký')),
              DataColumn(label: Text('Trạng thái')),
            ],
            rows: List.generate(
              reports.length,
                  (index) {
                return DataRow(cells: [
                  DataCell(Text('${index + 1}')),
                  DataCell(Text('Tờ trình ${index + 1}')), // Replace with actual data
                  DataCell(Text('Người ký ${index + 1}')), // Replace with actual data
                  DataCell(Text('Trạng thái ${index + 1}')), // Replace with actual data
                ]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
