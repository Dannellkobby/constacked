# Constacked Contacts App (Demo)

This Flutter application demonstrates user interaction, data management, and navigation patterns commonly used in mobile development. It showcases the implementation of the Stacked architecture, GoRouter for routing, and Hive for local data storage.

* **Stacked Architecture:** A layered approach that separates concerns for better organization and maintainability.
* **GoRouter:** A declarative routing solution for efficient navigation between different screens.
* **Hive:** A local database for persisting contact data across app sessions.

**Features:**

* **View a list of demo contacts.**
* **Add new contacts.**
* **Edit existing contact details.**
* **Delete contacts.**
* **Navigate between screens using GoRouter.**


**Implementation Details:**

1. **Stacked Architecture:**
    - Utilize `FormViewModel` for view models, providing form management and data binding.
    - Separate view logic from view presentation for clarity.

2. **GoRouter Integration:**
    - Define routes for the contact list and detail view in `app_router.dart`.
    - Use `GoRouterNavigator` in `app.dart` to manage navigation.

3. **Hive for Data Persistence:**
    - Set up Hive in `main.dart` to initialize the local database.
    - Use Hive boxes in `contacts_service.dart`
