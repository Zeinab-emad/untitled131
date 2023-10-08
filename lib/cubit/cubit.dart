//import 'package:untitled131/cubit/';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled131/cubit/states.dart';
import 'package:bloc/bloc.dart';

// انشاء كلاس لل Cubit والوراثه من كلاس state
class CounterCubit extends Cubit <CounterState> {

  // وضع كلاس الانشاء داخل سوبر
  CounterCubit () : super(CounterInitialState());

  // يسهل التعامل في عدة اماكن
  static CounterCubit get(context) => BlocProvider.of(context);

  // التغيرات
  int counter = 1;

  void minus () {
    counter-- ;
    emit(CounterMinusState());
  }

  void pluse () {
    counter++ ;
    emit(CounterPlusState());
  }

}