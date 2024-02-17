import 'package:constacked/app/app.gorouter.dart';
import 'package:constacked/models/contact_adapter.dart';
import 'package:constacked/services/contacts_service.dart';
import 'package:constacked/ui/common/app_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:constacked/app/app.locator.dart';

class StartupViewModel extends BaseViewModel {
  Future runStartupLogic() async {
    try {
      // Initialize Hive
      await Hive.initFlutter();
      Hive.registerAdapter(ContactAdapter());

      // Open Hive boxes
      await Hive.openBox(kkBoxSettings);
      await Hive.openBox(kkBoxContacts);

      // Clear contacts box (evaluate if necessary)
      // Hive.box(kkBoxContacts).clear();

      // Check for first launch and generate initial contacts
      final bool isFirstLaunch =
          Hive.box(kkBoxSettings).get(kkFirstLaunch, defaultValue: true);
      if (isFirstLaunch) {
        await locator<ContactsService>().generateInitialContacts(500);
        await Hive.box(kkBoxSettings).put(kkFirstLaunch, false);
      }

      // Navigate to the contacts view
      router.go(krContacts);
    } catch (error) {
      // Handle any errors during startup
      if (kDebugMode) print('Startup error: $error');
      //TODO We will have to display an error message or take appropriate action
    }
  }
}
