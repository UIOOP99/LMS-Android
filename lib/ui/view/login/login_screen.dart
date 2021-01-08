import 'package:flutter/material.dart';
import 'package:lms_app/ui/view_model/login_view_model/login_view_model.dart';
import 'package:lms_app/utils/responsive_safe_area.dart';
import 'package:lms_app/utils/route_creator.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Theme.of(context).primaryColor,
    ));
    return ResponsiveSafeArea(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text("ورود"),
        ),
        body: Center(
            child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            width: 350,
            child: Wrap(children: [LoginForm()]),
          ),
        )),
      );
    });
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context, listen: false);
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: userNameController,
                decoration: new InputDecoration(
                  labelText: "نام کاربری",
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.person),
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'لطفا نام کاربری را وارد کنید';
                  }
                  return null;
                },
                autofocus: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: new InputDecoration(
                  labelText: "رمز عبور",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                    borderSide: new BorderSide(),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: this._showPassword ? Colors.indigo : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => this._showPassword = !this._showPassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'لطفا رمز عبور را وارد کنید';
                  }
                  return null;
                },
                obscureText: !this._showPassword,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // loginProvider.logInUser(userNameController.text.trim(),
                    //     passwordController.text.trim());
                    //if login succssfull then
                    Navigator.of(context).push(createRouteLoginToHomeSt());
                    // Scaffold.of(context)
                    //     .showSnackBar(SnackBar(content: Text('در حال ورود')));
                  }
                },
                child: Text('ورود'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
