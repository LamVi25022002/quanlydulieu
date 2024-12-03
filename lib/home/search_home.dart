import 'package:flutter/material.dart';
import 'package:home/home/after_search.dart';
import 'package:home/home/search_error.dart';
import 'package:home/home/home_filter.dart'; // Thêm import cho trang HomeFilter

class SearchHome extends StatefulWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchHistory = [];
  List<String> _searchResults = [];

  List<String> _allResults = [
    'Tờ trình',
    'Đề tài',
    'Nhân sự',
    'Báo cáo',
    // Thêm các mục khác nếu cần
  ];

  void _performSearch() {
    setState(() {
      _searchResults.clear();
      if (_searchController.text.isNotEmpty) {
        _searchHistory.insert(0, _searchController.text);
        _searchResults = _allResults
            .where((result) => result
            .toLowerCase()
            .contains(_searchController.text.toLowerCase()))
            .toList();
        if (_searchResults.isEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchError(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AfterSearch(
                searchResults: _searchResults,
              ),
            ),
          );
        }
      }
      _searchController.clear();
    });
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
              fontSize: 23,
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
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: (_) => _performSearch(),
                    decoration: InputDecoration(
                      hintText: 'Nhập từ khóa',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1.0), // Viền xanh khi không có focus
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1.0), // Viền xanh khi có focus
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        _performSearch();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeFilter(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFFEBEBEB), width: 1.0), // Viền xanh
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Transform.translate(
                            offset: Offset(-10, 0),
                            child: const Icon(Icons.tune, color: Colors.grey,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Lịch sử tìm kiếm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: _searchHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.access_time_filled_outlined, color: Colors.grey, size: 27,),
                    title: Text(_searchHistory[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () {
                        setState(() {
                          _searchHistory.removeAt(index);
                        });
                      },
                    ),
                    onTap: () {
                      // Xử lý sự kiện khi người dùng nhấn vào một mục trong lịch sử tìm kiếm
                      // Có thể thực hiện tìm kiếm lại với từ khóa đã chọn
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
