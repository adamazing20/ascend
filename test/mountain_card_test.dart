import 'package:ascend/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main(){
  testWidgets("Create Mountain Cards", (WidgetTester tester) async {
    await tester.pumpWidget((Ascend()));
    await tester.pump();
    await tester.tap(find.byType(TextField).first);
    await tester.enterText(find.byType(TextField), "Mt. Washington");
    expect(find.text("Mt. Washington"), findsOneWidget);
  });
}
