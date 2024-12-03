import 'package:flutter/material.dart';
import 'package:home/home/home.dart';
import 'package:home/report/report.dart';
import 'package:home/staff/staff.dart';
import 'package:home/topic/topic.dart';
import 'package:home/setting/setting.dart';
class AfterFilter extends StatefulWidget {
  final Map<String, dynamic> filters;

  const AfterFilter({Key? key, required this.filters}) : super(key: key);

  @override
  _AfterFilterState createState() => _AfterFilterState();
}

class _AfterFilterState extends State<AfterFilter> {
  int _selectedIndex = 0;

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
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 90.0),
          child: Text(
            'Tìm kiếm',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            SizedBox(height: 15),
            Expanded(
              child: _buildDataTable(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              color: _selectedIndex == 0 ? Colors.grey : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Tổng quan",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/totrinh.png',
              color: _selectedIndex == 1 ? Colors.grey : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Tờ trình",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/caidat.png',
              color: _selectedIndex == 2 ? Colors.grey : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Đề tài",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/nhansu.png',
              color: _selectedIndex == 3 ? Colors.grey : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Nhân sự",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/detai.png',
              color: _selectedIndex == 4 ? Colors.grey : Colors.grey,
              width: 24,
              height: 24,
            ),
            label: "Cài đặt",
          ),
        ],
      ),
    );
  }

Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nhập từ khóa',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 19,
                fontWeight: FontWeight.normal,
              ),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Color(0xFFEBEBEB), // Màu viền
                  width: 0.5,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(0xFFCDE7FF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(
              Icons.tune,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataTable() {
    final data = _getData(); // Lấy dữ liệu mẫu

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 10,
        columns: [
          DataColumn(
            label: Container(
              width: 40, // Có thể điều chỉnh kích thước của cột
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'TT',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
          DataColumn(
            label: Container(
              width: 100, // Có thể điều chỉnh kích thước của cột
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mã số',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
          DataColumn(
            label: Container(
              width: 110, // Có thể điều chỉnh kích thước của cột
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Cấp quản lý',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
          DataColumn(
            label: Container(
              width: 80, // Có thể điều chỉnh kích thước của cột
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Loại hình',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
        ],
        rows: List.generate(
          data.length,
              (index) {
            final row = data[index];
            return DataRow(
              cells: [
                DataCell(
                  Container(
                    width: 20, // Đảm bảo kích thước của ô dữ liệu
                    child: Align(
                      child: Center(child: Text('${index + 1}')), // Số thứ tự từ 1
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: 100, // Đảm bảo kích thước của ô dữ liệu
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(row['Mã số'] ?? ''),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: 110, // Đảm bảo kích thước của ô dữ liệu
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(row['Cấp quản lý'] ?? ''),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    width: 90, // Đảm bảo kích thước của ô dữ liệu
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(row['Loại hình'] ?? ''),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  List<Map<String, String>> _getData() {
    return [
      {'TT': '1', 'Mã số': 'MS001', 'Cấp quản lý': 'Cấp học viện', 'Loại hình': 'Tờ trình'},
      {'TT': '2', 'Mã số': 'MS002', 'Cấp quản lý': 'Cấp học viện', 'Loại hình': 'Đề tài'},
      {'TT': '3', 'Mã số': 'MS003', 'Cấp quản lý': 'Cấp học viện', 'Loại hình': 'Tờ trình'},
      {'TT': '4', 'Mã số': 'MS004', 'Cấp quản lý': 'Cấp học viện', 'Loại hình': 'Nhiệm vụ'},
      // Thêm dữ liệu mẫu nếu cần
    ];
  }
}
