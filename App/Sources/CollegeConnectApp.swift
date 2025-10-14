import SwiftUI
import Core

@main
struct CollegeConnectApp: App {
    @StateObject private var appState = AppState(dataService: MockDataService())

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(appState)
        }
    }
}
