import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/sign_in/forget_password.dart';
import 'package:home/home/home.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool obscurePassword = true;
  bool _isKeyboardVisible = false;
  String? _email;
  String? _password;
  bool _isFormValid = false;
  bool _isEmailValid = true;

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_onFocusChange);
    _passwordFocusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = _emailFocusNode.hasFocus || _passwordFocusNode.hasFocus;
    });
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formSignInKey.currentState!.validate()) {
      // Lấy dữ liệu từ form
      final email = _email;
      final password = _password;

      // Tạo payload cho yêu cầu HTTP
      final Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      // Gửi yêu cầu HTTP POST đến API login
      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.16:3000/login'),
          headers: {
            'Content-Type': 'application/json'
          },
          body: json.encode(loginData),
        );

        // Xử lý phản hồi từ API
        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          // Lưu token hoặc điều hướng tới trang Home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        } else {
          // Hiển thị thông báo lỗi nếu đăng nhập thất bại
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Thông tin tài khoản hoặc mật khẩu không chính xác.'), backgroundColor: Colors.red),
          );
        }
      } catch (error) {
        // Xử lý lỗi nếu không kết nối được tới API
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể kết nối tới máy chủ. Vui lòng thử lại sau.'), backgroundColor: Colors.red),
        );
      }
    }
  }

  void _checkFormValidity() {
    setState(() {
      _isFormValid = _email != null && _email!.isNotEmpty && _password != null && _password!.isNotEmpty;
    });
  }

  void _validateEmail(String? value) {
    setState(() {
      if (value != null && value.isNotEmpty && value.endsWith('@gmail.com')) {
        _isEmailValid = true;
      } else {
        _isEmailValid = false;
      }
      _checkFormValidity();
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              if (!_isKeyboardVisible) ...[
                const SizedBox(height: 100),
                Center(
                  child: Image.asset(
                    'assets/images/logoLogin.png', // Đường dẫn đến ảnh của bạn
                    height: 183, // Chiều cao ảnh có thể điều chỉnh
                    width: 183, // Chiều rộng ảnh có thể điều chỉnh
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50), // Khoảng cách giữa ảnh và chữ "Đăng nhập"
              ],
              SizedBox(height: _isKeyboardVisible ? 130 : 10),
              Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      focusNode: _emailFocusNode,
                      onChanged: (value) {
                        _email = value;
                        _validateEmail(value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Nhập email của bạn',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isEmailValid ? Colors.grey : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isEmailValid ? Colors.grey : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _isEmailValid ? Colors.blue : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    if (!_isEmailValid)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Email phải bao gồm "@gmail.com"',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 30),
                    TextFormField(
                      focusNode: _passwordFocusNode,
                      obscureText: obscurePassword,
                      obscuringCharacter: '*',
                      onChanged: (value) {
                        _password = value;
                        _checkFormValidity();
                      },
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu của bạn',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Spacer(), // Tạo khoảng cách linh hoạt giữa các phần tử trong Row
                        GestureDetector(
                          child: const Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgetPassword()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isFormValid
                            ? () {
                          _submitForm(context);
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isFormValid ? Colors.blueAccent : Colors.grey,
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
