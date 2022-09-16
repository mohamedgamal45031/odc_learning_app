
import 'package:flutter/material.dart';

@immutable
abstract class FaqState {}

class FaqInitial extends FaqState {}
class FaqGettingData extends FaqState {}
class FaqGotData extends FaqState {}
class FaqGotDataFail extends FaqState {}