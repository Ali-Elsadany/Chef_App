import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState>{
  GlobalCubit(): super(GlobalInitial());
  //bool isArabic = false;
  String langCode = 'en';
  void changeLang(String codeLang)async{
    emit(ChangeLangLoading());
    //isArabic=!isArabic;
    langCode = codeLang;
    await sl<CacheHelper>().cacheLanguage(codeLang);
    emit(ChangeLangSucess());
  }
  void getCachedLang(){
    emit(ChangeLangLoading());
    final cachedLang=sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSucess());
  }
  bool switchOn = false;
  void switchLang(value) {
    switchOn = !switchOn;
    sl<CacheHelper>().saveData(key: 'lang', value: switchOn ? 'ar' : 'en');
    langCode = sl<CacheHelper>().getDataString(key: 'lang')!;
    emit(ChangeLangSucess());
  }
}


