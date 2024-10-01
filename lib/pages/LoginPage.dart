import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Inisiasi state
String _username = "";
String _password = "";
bool isclicked = false;
bool _passwordvisible = false;

void initstate(){
  _passwordvisible = false;
}


//functions
_navigateToHome() async{ //async itu agar codingan tidak dijalankan sesuai urutan
  await Future.delayed(Duration(seconds: 1), (){});
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage()
    ) //didalam HomePage itu untuk mengirim username ke homepage
  );
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Halaman login'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            _usernameField(),
            _passwordField(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            ),            
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() { 
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _username = value;
          },
          decoration: InputDecoration(
            labelText: 'Masukkan username disini',
            hintText: 'Username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 10,
                color: Colors.blue
              )
            )
          ),
        ),
      ),
    );
  }

  Widget _passwordField() { 
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: !_passwordvisible,
          onChanged: (value) {
            _password = value;
          },
          decoration: InputDecoration(
            suffix: IconButton(
              onPressed: (){
                setState(() {
                  _passwordvisible = !_passwordvisible;
                });
              },
              icon: Icon(Icons.remove_red_eye)),
            labelText: 'Masukkan password disini',
            hintText: 'password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(
                width: 10,
                color: Colors.blue
              )
            )
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isclicked==true ? WidgetStateProperty.all(Colors.red) : WidgetStateProperty.all(Colors.blue),// ini di versi lain untuk color WidgetStatePropertyAll(Colors.red)
          foregroundColor: WidgetStateProperty.all(Colors.white)
        ),
        onPressed: (){
          if (_username == "flutter" && _password == "123"){
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login berhasil'))
            ); // Untuk menunjukkan pesan bahwa login telah berhasil
          }          
          else {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Username atau password salah!!')));
          }
          isclicked = true;
          setState(() {
            isclicked!=isclicked;
          });

        },
        child: const Text('Login')
      ),
    );    
  }
}



