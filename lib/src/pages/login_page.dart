import 'package:chat_app/src/components/button_component.dart';
import 'package:chat_app/src/components/custom_input.dart';
import 'package:chat_app/src/components/logo_component.dart';
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
            padding: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const LogoComponent(),
                    _Form(),
                    const _Labels(),
                    //const SizedBox(height: 10),

                    const Text("Terminos y condiciones de uso",
                      style: TextStyle(fontWeight: FontWeight.w200
                    )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

// class _Logo extends StatelessWidget {
//   const _Logo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 50),
//       width: double.infinity,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: const [
//           Image(
//             image: AssetImage('assets/tag-logo.png'),
//             alignment: Alignment.center,
//             height: 100,
//             width: 150,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text("Messenger", style: TextStyle(fontSize: 30))
//         ],
//       ),
//     );
//   }
// }

class _Form extends StatefulWidget {
  _Form({Key? key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final TextEditingController emailControler = TextEditingController();
  final TextEditingController passwordControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailControler,
          ),
          const SizedBox(height: 20),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.text,
            textController: passwordControler,
            isPassword: true,
          ),
          // TextField(),
          const SizedBox(height: 30),
          ButtonComponent(
            label: "Ingresar",
            ontap: (){},
            backgroundColor: Colors.blue,
          )
        ],
      ),
    );
  }
}


class _Labels extends StatelessWidget {
  const _Labels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const Text("¿No tienes cuentas?", style: TextStyle(color : Colors.black54, fontSize: 15, fontWeight: FontWeight.w300)),
          const SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'register');
            },
            child: Text("¡Crea una ahora!", style: TextStyle(color : Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold))),
        ],
    );
  }
}