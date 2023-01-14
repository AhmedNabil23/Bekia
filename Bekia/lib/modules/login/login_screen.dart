
import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logeen/layout/home_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';


class LoginScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),

      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){},
        builder: (context,state){
          var emailController= TextEditingController();
          var passwordController= TextEditingController();
          var formKey =GlobalKey<FormState>();
          return Scaffold(
            body:

            Padding(
              padding: const EdgeInsets.all(20.0),
              child:
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Bekia',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),

                      ),
                    ),

                    SizedBox(height: 30,),

                    //for Email
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value)
                      {
                        if(value!.isEmpty){
                          return 'email must not be empty';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        labelText:'Email Address',
                        prefixIcon: Icon(
                            Icons.email
                        ),
                        border: OutlineInputBorder(),

                      ),

                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //for password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword ,
                      validator: (value)
                      {
                        if(value!.isEmpty){
                          return 'password must not be empty';
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                        labelText:'Password',
                        prefixIcon: Icon(
                            Icons.lock
                        ),
                        border: OutlineInputBorder(),
                        hoverColor: Colors.lightGreen,

                      ),

                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //Login Button
                    ConditionalBuilder(
                      condition: state is! AppLoginLoadingState ,
                      builder: (context)=>Container(
                        width: double.infinity,
                        height: 50,
                        child: MaterialButton(

                          color: Colors.lightGreen,
                          onPressed:(){
                            if(formKey.currentState!.validate())
                            {


                             if(emailController.text=="Bekia"&&passwordController.text=="000") {
                               Navigator.pushAndRemoveUntil(context,
                                   MaterialPageRoute(
                                       builder: (context) => HomeLayout()), (
                                       route) => false);
                             } else{
                              Fluttertoast.showToast(
                                  msg: "not currect",
                                  toastLength:Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }

                            }

                          },
                          child:
                          Text(
                            'login',
                             style:TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      fallback:(contex)=> Center(child: CircularProgressIndicator()) ,
                    ),


                  ],
                ),
              ),
            ),


          );
        },
      ),
    );
  }

}