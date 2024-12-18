import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:home/after_upload.dart';
import 'package:home/report/report.dart';
import 'package:home/home/home.dart';

class AddReport extends StatefulWidget {
  const AddReport({Key? key}) : super(key: key);

  @override
  _AddReportState createState() => _AddReportState();

}


class FileSelectionConfirmationPage extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  const FileSelectionConfirmationPage({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 1),
                Container(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 3.6,
                      width: 65, // Chiều dài đường line
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(15), // Bo góc đường line
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Khoảng cách giữa đường line và chữ 'Tải file'
                Text(
                  'Tải file',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Cho phép chọn file từ thư mục của bạn',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onCancel,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white, // Nền trắng
                          foregroundColor: Colors.blue, // Màu chữ xanh
                          side: BorderSide(color: Colors.blue), // Viền xanh
                        ),
                        child: Text('Hủy'),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AfterUpload()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue, // Nền xanh
                          foregroundColor: Colors.white, // Màu chữ trắng
                        ),
                        child: Text('Xác nhận'),
                      ),
                    ),
                  ],
                ),
              ],
            )
        );
      },
    );
  }
}

class UpdateTrangThai extends StatefulWidget {
  final ValueChanged<String> onStatusChanged;
  const UpdateTrangThai({
    Key? key,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  _UpdateTrangThaiState createState() => _UpdateTrangThaiState();
}

class _UpdateTrangThaiState extends State<UpdateTrangThai> {
  String _selectedStatus = ''; //

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.33,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 1),
              Container(
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 3.6,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Trạng thái',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Chọn trạng thái của tờ trình',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 25,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedStatus = 'Đã ký'; // Chọn 'Đã ký'
                        widget.onStatusChanged(_selectedStatus); // Gọi hàm khi chọn
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _selectedStatus == 'Đã ký' ? Colors.blue : Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: _selectedStatus == 'Đã ký'
                                ? Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            )
                                : null,
                          ),
                        ),
                        Text(
                          'Đã ký',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5), // Khoảng cách giữa các lựa chọn trạng thái
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                    height: 25, // Khoảng cách giữa các vạch phân chia
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedStatus = 'Chưa ký'; // Chọn 'Chưa ký'
                        widget.onStatusChanged(_selectedStatus); // Gọi hàm khi chọn
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10.0),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _selectedStatus == 'Chưa ký' ? Colors.red : Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: _selectedStatus == 'Chưa ký'
                                ? Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            )
                                : null,
                          ),
                        ),
                        Text(
                          'Chưa ký',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16, fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5), // Khoảng cách giữa các lựa chọn trạng thái
              Divider(
                color: Colors.grey[300],
                thickness: 1,
                height: 20, // Khoảng cách giữa các vạch phân chia
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onStatusChanged(_selectedStatus);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12), // Padding cho nút
                  ),
                  child: Text('Chọn'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AddReportState extends State<AddReport> {
  bool _isInformationComplete = false;
  bool _isVersionComplete = false;
  bool _isDocumentsComplete = false;

  void _checkCompletion() {
    setState(() {
      _isInformationComplete = _isInformationTabComplete();
      _isVersionComplete = _isVersionTabComplete();
      _isDocumentsComplete = _isDocumentsTabComplete();
    });
  }

  bool _isInformationTabComplete() {
    // Kiểm tra các trường thông tin trong tab "Thông tin"
    return true; // Thay đổi điều kiện này tùy thuộc vào cách kiểm tra của bạn
  }

  bool _isVersionTabComplete() {
    // Kiểm tra các trường thông tin trong tab "Phiên bản"
    return true; // Thay đổi điều kiện này tùy thuộc vào cách kiểm tra của bạn
  }

  bool _isDocumentsTabComplete() {
    // Kiểm tra các trường thông tin trong tab "Tài liệu"
    // Ví dụ: Kiểm tra xem các file đã được chọn hay chưa
    return true; // Thay đổi điều kiện này tùy thuộc vào cách kiểm tra của bạn
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Thêm mới tờ trình',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          actions: [
            TextButton(
              onPressed: (_isInformationComplete && _isVersionComplete && _isDocumentsComplete)
                  ? () {
                // Thực hiện hành động lưu
              }
                  : null,
              child: Text(
                'Lưu',
                style: TextStyle(
                  color: (_isInformationComplete && _isVersionComplete && _isDocumentsComplete)
                      ? Colors.blue
                      : Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Color(0xFF4285F4),
            unselectedLabelColor: Color(0xFFA1A5B0),
            labelStyle: TextStyle(fontSize: 17),
            indicator: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF4285F4),
                  width: 3.0,
                ),
              ),
            ),
            indicatorSize: TabBarIndicatorSize.tab, // Đảm bảo indicator phủ toàn bộ tab
            indicatorPadding: EdgeInsets.zero, // Đặt padding là 0 để indicator dài bằng tab
            tabs: [
              Tab(text: 'Thông tin'),
              Tab(text: 'Phiên bản'),
              Tab(text: 'Tài liệu'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InformationTab(),
            VersionTab(),
            DocumentsTab(onFileSelected: _checkCompletion),
          ],
        ),
      ),
    );
  }
}

// Tab Thông tin
class InformationTab extends StatefulWidget {
  const InformationTab({Key? key}) : super(key: key);

  @override
  _InformationTabState createState() => _InformationTabState();
}

class _InformationTabState extends State<InformationTab> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  String? _status;

  @override
  void initState() {
    super.initState();
    // Thêm listener cho controllers
    _dateController.addListener(_checkCompletion);
    _infoController.addListener(_checkCompletion);
  }

  @override
  void dispose() {
    _dateController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
        _checkCompletion();
      });
    }
  }

  void _checkCompletion() {
    final addReportState = context.findAncestorStateOfType<_AddReportState>();
    addReportState?._checkCompletion();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phần "Tên tờ trình"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên tờ trình',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Nhập tên tờ trình',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Mã số
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Mã số',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Ngày
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Ngày',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  controller: _dateController,
                  enabled: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month_outlined, color: Colors.grey,),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Người ký
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Người ký',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Trạng thái
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Trạng thái',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return UpdateTrangThai(
                          onStatusChanged: (status) {
                            setState(() {
                              _status = status; // Cập nhật trạng thái khi chọn
                            });
                          },
                        );
                      },
                    );
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _status ?? '',
                          style: TextStyle(
                            color: _status == 'Đã ký' ? Colors.green : Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ],
      ),
    );
  }
}

// Tab Phiên bản
class VersionTab extends StatefulWidget {
  const VersionTab({Key? key}) : super(key: key);

  @override
  _VersionTabState createState() => _VersionTabState();
}

class _VersionTabState extends State<VersionTab> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  String? _fwd;

  @override
  void initState() {
    super.initState();
    // Thêm listener cho controllers
    _dateController.addListener(_checkCompletion);
    _infoController.addListener(_checkCompletion);
  }

  @override
  void dispose() {
    _dateController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        _dateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Cập nhật văn bản với ngày đã chọn
        _checkCompletion(); // Kiểm tra trạng thái khi ngày thay đổi
      });
    }
  }

  void _checkCompletion() {
    final addReportState = context.findAncestorStateOfType<_AddReportState>();
    addReportState?._checkCompletion();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phần "Tên phiên bản"
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên tờ trình',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Nhập tên tờ trình',
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Mã số
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Mã số',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Ngày
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Ngày',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  controller: _dateController,
                  enabled: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_month_outlined, color: Colors.grey,),
                      onPressed: () => _selectDate(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục Người ký
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Người ký',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Mục FWD
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'FWD',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 5,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


// Tab Tài liệu
class DocumentsTab extends StatelessWidget {
  final VoidCallback onFileSelected;

  const DocumentsTab({Key? key, required this.onFileSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mục "File chưa ký"
          Text(
            'File chưa ký',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.3),
                  builder: (BuildContext context) {
                    return FileSelectionConfirmationPage(
                      onConfirm: () {
                        Navigator.of(context).pop();
                        // Code để chọn file từ máy
                        onFileSelected();
                      },
                      onCancel: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.blue,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, color: Colors.blue, size: 20),
                  SizedBox(height: 4),
                  Text('Nhấn để tải lên', style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 12),),
                ],
              ),
            ),
          ),

          SizedBox(height: 16),

      // Mục "Báo cáo"
          Text(
            'Báo cáo',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blue,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black.withOpacity(0.3),
                  builder: (BuildContext context) {
                    return FileSelectionConfirmationPage(
                      onConfirm: () {
                        Navigator.of(context).pop();
                        // Code để chọn file từ máy
                        onFileSelected();
                      },
                      onCancel: () {
                        Navigator.of(context).pop();
                      },
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.blue,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload, color: Colors.blue, size: 20),
                  SizedBox(height: 4),
                  Text('Nhấn để tải lên', style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 12),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
