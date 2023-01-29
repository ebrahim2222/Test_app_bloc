import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/DI/d_injection.dart';
import 'package:test_app/UI/screens/auth/register/register_text_field.dart';
import 'package:test_app/bloc/register_bloc/register_bloc.dart';
import 'package:test_app/core/screen_size.dart';
import 'package:test_app/core/values/routes_manager.dart';
import 'package:test_app/core/values/strings_manager.dart';
import 'package:test_app/core/values/values_manager.dart';

import '../../../../core/values/assets_manager.dart';
import '../../../../core/values/color_manager.dart';
import '../../../../core/values/font_manager.dart';
import '../../../../core/values/styles_manager.dart';
import '../../../../core/helper/navigate_to_screen.dart';
import '../../../widgets/button_component.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterBloc registerBloc = DependencyInjection.getIt<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocProvider<RegisterBloc>(
        create: (context) => registerBloc,
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Container(
              width: ScreenSize.getScreenWidth(context),
              height: ScreenSize.getScreenHeight(context),
              padding: const EdgeInsets.only(
                  left: AppPadding.p20, right: AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // logo
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: AppMargin.m20),
                      child: Image.asset(AssetsManager.logo),
                    ),

                    // sign up text
                    Container(
                      margin: const EdgeInsets.only(top: AppMargin.m20),
                      child: Text(
                        AppStrings.signUp,
                        style: getBoldStyle(
                            fontSize: FontSizeManager.s30,
                            color: ColorManager.primary),
                      ),
                    ),

                    // provider name text
                    Container(
                      margin: const EdgeInsets.only(top: AppMargin.m20),
                      child: Text(
                        AppStrings.providerName,
                        style: getMediumStyle(
                            fontSize: FontSizeManager.s16,
                            color: ColorManager.grey),
                      ),
                    ),

                    // user name field

                    RegisterTextField(
                        hint: AppStrings.userName, onChanged: (value) {}),

                    // phone number field
                    RegisterTextField(
                        hint: AppStrings.phoneNumber, onChanged: (value) {}),

                    // company name field
                    RegisterTextField(
                        hint: AppStrings.companyName, onChanged: (value) {}),
                    RegisterTextField(
                        hint: AppStrings.password, onChanged: (value) {}),

                    // register button
                    ButtonWidget(
                        text: AppStrings.signUp,
                        color: ColorManager.primary,
                        onTap: () {
                          registerBloc.add(RegisterUserEvent());
                        }),

                    // go to login screen
                    Container(
                      padding: EdgeInsets.only(
                          top: ScreenSize.getScreenHeight(context) * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.haveAccount,
                            style: getReqularStyle(
                                fontSize: FontSizeManager.s18,
                                color: ColorManager.primary),
                          ),
                          InkWell(
                            onTap: () {
                              navigateToScreen(
                                  context, RoutesManager.loginRoute);
                            },
                            child: Text(AppStrings.signIn,
                                style: getSemiBoldStyle(
                                    fontSize: FontSizeManager.s18,
                                    color: ColorManager.darkPrimary)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
