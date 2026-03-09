import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/moviel_list_page.dart';

class LoginPage extends StatelessWidget {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    /*
      buatlah tampilan login sederhana dengan menggunakan widget TextField untuk input username dan password, serta ElevatedButton untuk tombol login.
      - TextField untuk username dengan hint text "Username"
      - TextField untuk password dengan hint text "Password" dan obscureText true
      - ElevatedButton dengan text "Login" yang ketika ditekan akan menampilkan snackbar dengan pesan
        "Login berhasil" jika username dan password tidak kosong, atau "Login gagal" jika salah satu atau kedua field kosong.
      - jika login berhasil, navigasikan ke halaman MovieListPage (buat halaman MovieListPage 
    
     */
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 320
            ),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8.0,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextField(
                      controller: _usernameTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Username"),
                      ),
                    ),
                    TextField(
                      controller: _passwordTextController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Password"),
                      ),
                      obscureText: true,
                    ),
                    // Saya rasa outlined button lebih bagus daripada elevated button
                    FilledButton(
                        onPressed: () => _onLoginPressed(context),
                        child: Text("Login")
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    final username = _usernameTextController.text.trim();
    final password = _passwordTextController.text.trim();

    if (username == "levirs" && password == "127") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login berhasil"))
      );
      Navigator.of(context).pushReplacement(
        MovieListPage.createRoute()
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal"))
    );
  }
}
