import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logeen/shared/cubit/states.dart';
import 'package:logeen/shared/cubit/cubit.dart';

class NonorganicScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        //  var tasks=AppCubit.get(context).newtasks;


        return
          SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                CheckboxListTile(value: AppCubit.get(context).plastic, onChanged: (val){

                  AppCubit.get(context).plasticChecked(val!);
                },
                activeColor: Colors.green,
                  title: Text('plastic'),

                ),
                CheckboxListTile(value: AppCubit.get(context).paper, onChanged: (val){

                  AppCubit.get(context).paperChecked(val!);
                },
                  activeColor: Colors.green,
                  title: Text('Paper'),

                ),
                CheckboxListTile(value: AppCubit.get(context).metal, onChanged: (val){

                  AppCubit.get(context).metalChecked(val!);
                },
                  activeColor: Colors.green,
                  title: Text('Metal'),

                ),
                CheckboxListTile(value: AppCubit.get(context).glass, onChanged: (val){

                  AppCubit.get(context).glassChecked(val!);
                },
                  activeColor: Colors.green,
                  title: Text('Glass'),

                ),
                CheckboxListTile(value: AppCubit.get(context).eWaste, onChanged: (val){

                  AppCubit.get(context).eWasteChecked(val!);
                },
                  activeColor: Colors.green,
                  title: Text('E-Waste'),

                ),

              //for amount
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: AppCubit.get(context).amountController,
                          keyboardType: TextInputType.numberWithOptions(
                              decimal: false, signed: false),
                          decoration: InputDecoration(
                            labelText:'Amount',
                            prefixIcon: Icon(
                                Icons.auto_awesome_motion_outlined
                            ),
                            border: OutlineInputBorder(),

                          ),
                          onTap: (){


                            AppCubit.get(context).amountController.text='0';


                          },



                        ),
                      ),
                      Column(
                        children: [
                          MaterialButton(
                            minWidth: 5.0,
                            child: Icon(Icons.arrow_drop_up),
                            onPressed: () {

                              int currentValue = int.parse(AppCubit.get(context).amountController.text);
                              currentValue++;
                              AppCubit.get(context).amountController.text =
                                  (currentValue).toString(); // incrementing value
                              AppCubit.get(context).emit(NonorganicAmountIncrementingState());
                            },
                          ),
                          MaterialButton(
                            minWidth: 5.0,
                            child: Icon(Icons.arrow_drop_down),
                            onPressed: () {
                              int currentValue = int.parse(AppCubit.get(context).amountController.text);
                              currentValue--;
                              AppCubit.get(context).amountController.text =
                                  (currentValue).toString(); // decrementing value
                              AppCubit.get(context).emit(NonorganicAmountdecrementingState());
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),

              //for location
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: TextEditingController(),
                    keyboardType:TextInputType.text,
                    decoration: InputDecoration(
                      labelText:'location',
                      prefixIcon: Icon(
                          Icons.location_on_outlined,
                      ),
                      border: OutlineInputBorder(),

                    ),
                    onTap: (){



                    },



                  ),
                ),
             //for upload photo
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MaterialButton(

                    color: Colors.lightGreen,
                    onPressed:(){

                    },
                    child:
                    Text(
                      'upload photo',
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w100,

                      ),
                    ),
                  ),
                ),

                //for Done button
                MaterialButton(

                  color: Colors.lightGreen,
                  onPressed:(){

                  },
                  child:
                  Text(
                    'Done',
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),


              ],
            ),
          );

      },
    ) ;
  }

}

