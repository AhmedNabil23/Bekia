import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logeen/shared/components/components.dart';
import 'package:logeen/shared/cubit/states.dart';
import 'package:logeen/shared/cubit/cubit.dart';

class OrganicScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){} ,
      builder:(context,state){
        return
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                      SizedBox(width: 5),
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

