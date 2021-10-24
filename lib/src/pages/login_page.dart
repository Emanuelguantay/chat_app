import 'package:chat_app/values/colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kGray,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const _Logo(),
                _Form(),
                _Labels(),
                const SizedBox(height: 10),
          
                const Text("Terminos y condiciones de uso",
                  style: TextStyle(fontWeight: FontWeight.w200
                )),
              ],
            ),
          ),
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/tag-logo.png'),
            alignment: Alignment.center,
            height: 100,
            width: 150,
          ),
          SizedBox(
            height: 20,
          ),
          Text("Messenger", style: TextStyle(fontSize: 30))
        ],
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(),
          TextField(),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
              backgroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Container(
              padding: const EdgeInsets.all(0),
              height: 40,
              child: const Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    "Aceptar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _Labels extends StatelessWidget {
  const _Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("¿No tienes cuentas?", style: TextStyle(color : Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          const SizedBox(height: 15,),
          Text("¡Crea una ahora!", style: TextStyle(color : Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}