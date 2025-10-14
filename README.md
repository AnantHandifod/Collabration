# CollegeConnect (SwiftUI, Modular)

A sample iOS app scaffold matching the provided mockups: Login, Clubs, Dashboard/Event Details, and Profile. The project uses XcodeGen for reproducible setup and separates features into modules: Core, DesignSystem, Auth, Clubs, Events, Profile.

## Requirements
- Xcode 15+
- iOS 16.0 deployment target
- XcodeGen installed (`brew install xcodegen`) or open the generated project if already created.

## Generate and Open
```bash
# From repo root
xcodegen generate
open CollegeConnect.xcodeproj
```

## Run
- Select the `CollegeConnect` app target and a simulator.
- Build and run. Use the Login screen to enter any email/password and tap Login.

## Structure
```
App/
Modules/
  Core/
  DesignSystem/
  Auth/
  Clubs/
  Events/
  Profile/
project.yml
```

## Notes
- Data is mocked via `MockDataService`.
- Buttons toggle local state (join/registered) in `AppState`.
- Replace styles/assets as needed.
