# ITP107 – Finals Laboratory 1: Login → Sign-Up → Home

A 3-screen Flutter app using **named routes** and multiple **Navigator**
methods, styled with a soft "Misty Slate" glassmorphism theme (colors
pulled from the grey/white watercolor reference image).

## How to run

1. Make sure the Flutter SDK is installed (`flutter --version`).
2. From this folder run:
   ```
   flutter pub get
   flutter run
   ```
   (Works on an emulator, a physical device, or `flutter run -d chrome`.)

## Requirements checklist

| Requirement | Where it's implemented |
|---|---|
| Named routes in `MaterialApp` | `lib/main.dart` → `routes: { '/', '/signup', '/home' }` |
| Login screen: email/username + password, Login button, Sign-Up link | `lib/screens/login_screen.dart` |
| Sign-Up screen: full name, email, password, confirm password, Sign Up button, back link | `lib/screens/signup_screen.dart` |
| Home screen: welcome message from route arguments, Logout button | `lib/screens/home_screen.dart` |
| At least 2 different Navigator methods | 5 are used: `pushReplacementNamed` (Login→Home, Sign-Up→Home), `pushNamed` (Login→Sign-Up), `pop` (Sign-Up→Login), `pushNamedAndRemoveUntil` (Logout→Login) |
| Data passed between screens | The name typed on Sign-Up (or the username from Login) is sent as a route argument and displayed on Home |
| Consistent, professional UI | Shared `AppTheme`, `GlassCard`, `CustomTextField`, `PrimaryButton`, `WatercolorBackground` widgets reused on all 3 screens |

## Design

The **"Misty Slate"** palette (`lib/theme/app_theme.dart`) is drawn straight
from the grey/white watercolor reference photo: soft fog whites, pale
grey-blue blobs, and a dusty slate-blue accent. `WatercolorBackground`
layers softly drifting blurred circles behind a heavy backdrop blur to
recreate that misty, painterly texture on every screen, and each screen's
content sits on a frosted **glass card** for a modern, cohesive look.

## Suggested role mapping (fill into the lab form)

- **Navigation & Routing Lead** – owns `lib/main.dart` (named routes) and the
  `Navigator` calls in each screen's `_handle...()` methods.
- **UI/UX Designer** – owns `lib/theme/app_theme.dart` and everything in
  `lib/widgets/` (background, glass card, text field, button).
- **Integration & Testing Lead** – merges all screens into `lib/screens/`,
  runs `flutter run` to test the full Login → Sign-Up → Home → Logout flow,
  and zips/pushes the final project for submission.

## Project structure

```
lib/
  main.dart
  theme/
    app_theme.dart
  widgets/
    watercolor_background.dart
    glass_card.dart
    custom_text_field.dart
    primary_button.dart
  screens/
    login_screen.dart
    signup_screen.dart
    home_screen.dart
```
