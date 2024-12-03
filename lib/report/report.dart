import 'package:flutter/material.dart';
import 'package:home/home/home.dart';
import 'package:home/home/search_home.dart';
import 'package:home/report/report_detail.dart';
import 'package:home/report/report_filter.dart';
import 'package:home/report/add_report.dart';
import 'package:home/staff/staff.dart';
import 'package:home/topic/topic.dart';
import 'package:home/setting/setting.dart';
import 'package:home/database/database.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int _selectedIndex = 1;
  List<String> _rows = ['Row 1', 'Row 2', 'Row 3', 'Row 4', 'Row 5'];
  List<String> _filteredRows = [];
  int? _expandedRowIndex;

  @override
  void initState() {
    super.initState();
    _filteredRows = _rows;
  }

  void _handleDeleteRow(int index) {
    setState(() {
      _rows.removeAt(index);
      _filteredRows.removeAt(index);
    });
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

  void _navigateToDetailPage(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDetail(
          reportTitle: title,
        ),
      ),
    );
  }


  void _showDeleteConfirmationSheet(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[100],
                  ),
                  child: Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Xóa tờ trình này?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 12),
              const Text(
                'Nếu xóa tờ trình này, bạn sẽ không thể khôi phục lại nữa. Bạn có chắc chắn muốn tiếp tục xóa không?',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF626262), fontSize: 12),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _handleDeleteRow(index);
                      Navigator.of(context).pop(true);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Xóa',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  void _navigateToFilterPage(BuildContext context) async {
    final filters = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(
        builder: (context) => ReportFilter(
          onApplyFilter: (filters) {
            setState(() {
              _filteredRows = _rows.where((row) {
                bool matchesStatus = filters['status'] == '' || row.contains(filters['status']!);
                bool matchesSigner = filters['signer'] == '' || row.contains(filters['signer']!);
                return matchesStatus && matchesSigner;
              }).toList();
            });
          },
        ),
      ),
    );
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
            child: const Text(
              'Quản lý tờ trình',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
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
                                _navigateToFilterPage(context);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: BorderSide(
                                  color: Color(0xFFEBEBEB), // Thêm viền màu xanh
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
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: 20.0,
                            columns: [
                              DataColumn(label: const Text('TT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                              DataColumn(label: const Text('Số tờ trình', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                              DataColumn(label: const Text('Người ký', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                              DataColumn(label: const Text('Trạng thái', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
                              DataColumn(label: const Text('')),
                            ],
                            rows: List.generate(_filteredRows.length, (index) {
                              final isExpanded = _expandedRowIndex == index;

                              return DataRow(
                                cells: [
                                  DataCell(Text('${index + 1}')),
                                  DataCell(
                                    GestureDetector(
                                        onTap: () {_navigateToDetailPage(context, _filteredRows[index]);
                                        },
                                        child: Text(_filteredRows[index])), // Thay thế với dữ liệu của bạn
                                  ),
                                  DataCell(
                                    GestureDetector(
                                        onTap: () {_navigateToDetailPage(context, _filteredRows[index]);
                                        },
                                        child: Text('Đặng Hoài Bắc')), // Thay thế với dữ liệu của bạn
                                  ),
                                  DataCell(
                                    GestureDetector(
                                        onTap: () {_navigateToDetailPage(context, _filteredRows[index]);
                                        },
                                        child: Text('Chưa ký')), // Thay thế với dữ liệu của bạn
                                  ),
                                  DataCell(
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _navigateToDetailPage(context, _filteredRows[index]);
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.edit_outlined,
                                                    color: Colors.white, // Icon màu trắng
                                                  ),
                                                  Text(
                                                    'Sửa',
                                                    style: TextStyle(
                                                      color: Colors.white, // Chữ màu trắng
                                                      fontSize: 12, // Cỡ chữ 12
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              _showDeleteConfirmationSheet(context, index);
                                            },
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.delete_outlined,
                                                    color: Colors.white, // Icon màu trắng
                                                  ),
                                                  Text(
                                                    'Xóa',
                                                    style: TextStyle(
                                                      color: Colors.white, // Chữ màu trắng
                                                      fontSize: 12, // Cỡ chữ 12
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ),
                                ],
                              );
                            }),
                          ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddReport(), // Điều hướng đến trang AddReport
              ),
            );
          },
          child: const Icon(Icons.add_outlined, color: Colors.white,size: 40,),
          backgroundColor: Colors.blueAccent,
          shape: const CircleBorder(),
        ),
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
