import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // const Text("Let's start!",
          //     style: TextStyle(
          //         fontSize: 48,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white)),
          Image.asset('assets/images/Background.png',
              alignment: Alignment.topRight, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/DellLogo.png'),
              Image.asset('assets/images/CloudETS.png'),
            ],
          ),
          Container(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Email:',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                Container(
                  width: 288,
                  height: 24,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          offset: Offset(4, 4),
                          blurRadius: 4,
                          spreadRadius: 0,
                        )
                      ]),
                  child: TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 12),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Password:',
                  style: TextStyle(fontSize: 12, color: Colors.grey)),
              Container(
                width: 288,
                height: 24,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33000000),
                        offset: Offset(4, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                      )
                    ]),
                child: TextField(
                  onChanged: (text) {
                    password = text;
                    print(text);
                  },
                  obscureText: true,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              width: 137,
              height: 47,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (email == "test user" && password == "123456") {
                      Navigator.of(context).pushReplacementNamed("/home");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Email ou senha incorretos!'),
                        ),
                      );
                    }
                  },
                  child: const Text('LOGIN',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
