import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter clone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Twitter Clone'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _signInKey=GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp emailValid=RegExp(r"[a-zA-Z0-9.a-zA-Z0-9.!#$%&'+*-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Twitter Clone"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key:_signInKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: "Email"),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Email is required";
                  }
                 else if (!emailValid.hasMatch(value)){
                    return 'Please enter a valid email';
                  }
                  return null;
                
                },
              ), //email
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(hintText: "Password"),
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Password is required";
                  }
                  else if(value.length<6){
                    return "Password must be at least 6 characters";
                  }
                  return null;
                
                },
              ), //password
              ElevatedButton(
                  onPressed: () {
                   if( _signInKey.currentState!.validate()){
                    debugPrint("Email: ${_emailController.text}");
                    debugPrint("Password: ${_passwordController.text}");
                   }
                    
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
