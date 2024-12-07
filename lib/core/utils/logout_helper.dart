
import 'package:sheero/core/utils/routes_helper.dart';
import 'package:sheero/data/datasources/session_manager.dart';
import 'package:sheero/presentation/screens/auth/login_screen.dart';

class LogoutHelper{
 static void logout(){
    // SessionManager.setAuthKey='';
    RoutesHelper.pushReplacementNavigation(const LoginScreen());
  }
}