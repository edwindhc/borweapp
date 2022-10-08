import 'package:borweapp/helpers/show_alert.dart';
import 'package:borweapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/boton_azul.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Logo(titulo: 'Messenger'),
                  _Form(),
                  const Labels(
                    ruta: 'register',
                    titulo: '¿No tienes cuenta?',
                    subTitulo: 'Crea una ahora!',
                  ),
                  const Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    goToHome() => Navigator.pushReplacementNamed(context, 'home');
    getAlert(title, subtitle) => showAlert(context, title, subtitle);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
            text: authService.authenticating
                ? const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Ingrese',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
            onPressed: authService.authenticating
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginok = await authService.login(
                        emailCtrl.text.trim(), passCtrl.text.trim());
                    if (loginok) {
                      goToHome();
                    } else {
                      // ignore: use_build_context_synchronously
                      getAlert('Login incorrecto', 'Revise sus credenciales');
                    }
                  },
          )
        ],
      ),
    );
  }
}
