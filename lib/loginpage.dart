import 'package:flutter/material.dart';
import 'package:project_loginstate/profil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
TextEditingController emailController =TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool showPassword = false;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  Future<void> _submitLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login Berhasil!')),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(email: emailController.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/background.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const Text("Welcome Back❀.ᐟ.ᐟ.ᐟ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B698C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Image.asset('assets/images/logo_florist.png',
                        height: 200,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.local_florist,
                                size: 120, color: Color(0xFFA78B9D)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(" ༘⋆✿Temukan keindahan di setiap moment ≽^• ˕ • ྀི≼",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B698C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Text("Login dan pesan sekarang.ᐟ.ᐟ.ᐟ₊ ⊹ ೀ ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF7B698C),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email,
                            color: Color(0xFFC4A7A1)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Masukkan Email";
                        }
                        bool emailValid = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                        ).hasMatch(value);
                        if (!emailValid) {
                          return "Email tidak valid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock,
                            color: Color(0xFFA78B9D)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword? Icons.visibility : Icons.visibility_off,
                            color: Color(0xFFC4A7A1),
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submitLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B698C),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading? const CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white):
                              const Text('LOGIN', style: TextStyle(color: Colors.white)),
                    ),

                    const SizedBox(height: 20),
                    const Text("---------- or connect with ----------",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {}, icon: Image.asset('assets/images/logo_facebook.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {}, icon: Image.asset('assets/images/logo_google.png',
                            height: 40,
                          ),
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {}, icon: Image.asset('assets/images/logo_email.png',
                            height: 40,
                          ),
                        ),
                      ],
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
}
