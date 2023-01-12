import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/UI/widgets/button_component.dart';
import 'package:test_app/bloc/login_bloc/login_bloc.dart';
import 'package:test_app/core/screen_size.dart';
import 'package:test_app/core/values/routes_manager.dart';
import 'package:test_app/core/values/strings_manager.dart';
import 'package:test_app/core/values/values_manager.dart';

import '../../../../DI/d_injection.dart';
import '../../../../core/values/assets_manager.dart';
import '../../../../core/values/color_manager.dart';
import '../../../../core/values/font_manager.dart';
import '../../../../core/values/styles_manager.dart';
import '../../../../helper/navigate_to_screen.dart';
import 'login_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginBloc loginBloc = DependencyInjection.getIt<LoginBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: SafeArea(
          child: BlocProvider<LoginBloc>(
            create: (context) => loginBloc,
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: AppMargin.m20, right: AppMargin.m20),
                  width: ScreenSize.getScreenWidth(context),
                  height: ScreenSize.getScreenHeight(context),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // app icon
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: AppMargin.m20),
                            child: Image.asset(AssetsManager.logo),
                          ),

                          // sign in text
                          Container(
                            margin: const EdgeInsets.only(top: AppMargin.m20),
                            child: Text(
                              AppStrings.signIn,
                              style: getBoldStyle(
                                  fontSize: FontSizeManager.s30,
                                  color: ColorManager.primary),
                            ),
                          ),

                          // provider name text
                          Container(
                            margin: const EdgeInsets.only(top: AppMargin.m30),
                            child: Text(
                              AppStrings.providerName,
                              style: getReqularStyle(
                                  fontSize: FontSizeManager.s16,
                                  color: ColorManager.grey),
                            ),
                          ),

                          // provider name field
                          const LoginTextField(
                              hintName: AppStrings.providerName),

                          // provider password field
                          const LoginTextField(hintName: AppStrings.password),

                          // sign in button
                          ButtonWidget(
                              text: AppStrings.signIn,
                              color: ColorManager.primary,
                              onTap: () {
                                loginBloc.add(LoginUserEvent());
                              }),

                          // don't have account go to register
                          Container(
                            padding: EdgeInsets.only(
                                top: ScreenSize.getScreenWidth(context) * 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.donnotHaveAccount,
                                  style: getReqularStyle(
                                      fontSize: FontSizeManager.s18,
                                      color: ColorManager.primary),
                                ),
                                InkWell(
                                  onTap: () {
                                    navigateToScreen(
                                        context, RoutesManager.registerRoute);
                                  },
                                  child: Text(AppStrings.signUp,
                                      style: getMediumStyle(
                                          fontSize: FontSizeManager.s18,
                                          color: ColorManager.darkPrimary)),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                );
              },
            ),
          ),
        ));
    ;
  }
}
