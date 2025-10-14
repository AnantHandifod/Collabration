import SwiftUI
import Auth

public struct AppRootView: View {
    @EnvironmentObject private var appState: AppState

    public init() {}

    public var body: some View {
        Group {
            if appState.isAuthenticated {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}
