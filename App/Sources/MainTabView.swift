import SwiftUI
import Events
import Clubs
import Profile

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack { DashboardView() }
                .tabItem { Label("Dashboard", systemImage: "house") }

            NavigationStack { ClubsView() }
                .tabItem { Label("Clubs", systemImage: "person.3") }

            NavigationStack { ProfileView() }
                .tabItem { Label("Profile", systemImage: "person.circle") }
        }
    }
}
