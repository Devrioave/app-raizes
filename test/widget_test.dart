// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter_test/flutter_test.dart';

import 'package:get/get.dart';
import 'package:raizes/app/routes/app_pages.dart';
import 'package:raizes/app/themes/app_themes.dart';

void main() {
  testWidgets('App loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        title: 'Raizes',
        theme: appLightThemeData,
        darkTheme: appDarkThemeData,
        initialRoute: '/home',
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );

    // Verify that the app loads without crashing
    await tester.pumpAndSettle();
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
