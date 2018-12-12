import 'package:flutter/material.dart';
import '../blocs/Bloc.dart';
import '../blocs/provider.dart';
class LoginScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          Container(padding: EdgeInsets.only(top: 10)),
          passwordField(bloc),
          Container(padding: EdgeInsets.only(top: 20)),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context,snap){
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email Address",
              errorText: snap.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );

  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snap){
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              errorText: snap.error
          ),
          onChanged: bloc.changePassword,
        );
      },
    );

  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snap){
        return RaisedButton(
          child: Text("Login"),
          color: Colors.blue,
          onPressed: snap.hasData ? bloc.submit
          : null ,

        );
      },
    );


  }

}