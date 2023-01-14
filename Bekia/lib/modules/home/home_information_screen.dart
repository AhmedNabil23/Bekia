import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logeen/shared/cubit/states.dart';
import 'package:logeen/shared/cubit/cubit.dart';

class HomeInformation extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        return Scaffold(

          // appBar: AppBar(),
          body:
             Center(
               child:
               Column(

                          children: [
                              Expanded(
                                child: Text('user 1',
                                  style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                              ),

                              Expanded(
                                child: Text('Score:10000 ',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  backgroundColor: Colors.yellowAccent,
                                  ),),
                              ),
                          Expanded(
                            child:
                              Text('Coins: 10 LE',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  backgroundColor: Colors.yellowAccent,
                                )
                                ),),




               ],
             ),


             ),






        );




      },
    ) ;
  }

}

