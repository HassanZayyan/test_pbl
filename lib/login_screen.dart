import 'package:flutter/material.dart';
import 'constant.dart';
import 'beranda.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const BerandaPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center, 
                children: [
                  Text(
                    "Masuk",
                    style: textTextStyle.copyWith(fontSize: 30, fontWeight: bold),
                    textAlign: TextAlign.center, 
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Isi informasi Anda di bawah ini atau daftar dengan akun sosial media.",
                    style: secondaryTextStyle,
                    textAlign: TextAlign.center, 
                  ),
                  const SizedBox(height: 50),
                  _buildTextField("Email", _emailController, false),
                  const SizedBox(height: 20),
                  _buildTextField("Password", _passwordController, true),
                  const SizedBox(height: 30),
                  _buildLoginButton(),
                  const SizedBox(height: 25),
                  _buildDivider(),
                  const SizedBox(height: 25),
                  _buildGoogleButton(),
                  const SizedBox(height: 130),  
                  _buildRegisterPrompt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTextStyle.copyWith(fontWeight: bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword ? _obscureText : false,
          decoration: InputDecoration(
            filled: true,
            fillColor: kolomColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Masukkan $label',
            hintStyle: secondaryTextStyle,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
          style: textTextStyle,
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _login,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryButtonColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "Masuk",
        style: masukTextStyle.copyWith(fontSize: 20, fontWeight: bold),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: secondaryTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'atau masuk dengan',
            style: secondaryTextStyle,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleButton() {
    return OutlinedButton(
      onPressed: () {
        // Implement Google sign-in logic here
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        side: BorderSide(color: textColor),
      ),
      child: Text(
        'Google',
        style: textTextStyle.copyWith(fontSize: 20, fontWeight: bold),
      ),
    );
  }

  Widget _buildRegisterPrompt() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Belum punya akun? ',
          style: textTextStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'Daftar',
              style: daftarTextStyle.copyWith(fontWeight: bold),
            ),
          ],
        ),
      ),
    );
  }
}
