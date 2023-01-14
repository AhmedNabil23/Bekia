import 'package:flutter/material.dart';
import 'package:logeen/modules/home/home_information_screen.dart';
import 'package:logeen/modules/nonorganic/nonorganic_screen.dart';
import 'package:logeen/modules/organic/organic_screen.dart';
import 'package:logeen/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);


  bool? plastic=false;
  bool? paper=false;
  bool? metal=false;
  bool? glass=false;
  bool? eWaste=false;

var amountController =TextEditingController();

  void plasticChecked(bool val){
    plastic=val;

    emit(InformationCheckedState());
  }
  void paperChecked(bool val){
    paper=val;

    emit(InformationCheckedState());
  }
  void metalChecked(bool val){
    metal=val;

    emit(InformationCheckedState());
  }
  void glassChecked(bool val){
    glass=val;

    emit(InformationCheckedState());
  }
  void eWasteChecked(bool val){
    eWaste=val;

    emit(InformationCheckedState());
  }



  ////
  int currentIndex=0;
  List<Widget>screens=
  [
    HomeInformation(),
    OrganicScreen(),
    NonorganicScreen(),
  ];
  void ChangeIndex(int index){
    currentIndex=index;
  emit(AppChangeBottomNavBarState());
  }


}