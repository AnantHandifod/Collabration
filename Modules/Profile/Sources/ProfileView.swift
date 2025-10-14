import SwiftUI
import Core
import DesignSystem

public struct ProfileView: View {
    @EnvironmentObject private var appState: AppState

    public init() {}

    public var body: some View {
        List {
            Section {
                HStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill").font(.system(size: 56))
                    VStack(alignment: .leading) {
                        Text("Jane Doe").font(.title3).fontWeight(.semibold)
                        Text("jane.doe@example.edu").foregroundStyle(.secondary)
                    }
                }
                Button("Edit Profile") {}.buttonStyle(OutlineButtonStyle())
            }
            Section("Registered Events") {
                let registered = appState.dataService.fetchEvents().filter { appState.registeredEventIds.contains($0.id) }
                if registered.isEmpty {
                    Text("No registered events yet.").foregroundStyle(.secondary)
                }
                ForEach(registered) { event in
                    NavigationLink(destination: EventDetailView(event: event)) {
                        HStack {
                            Image(systemName: "calendar").foregroundStyle(.secondary)
                            VStack(alignment: .leading) {
                                Text(event.title)
                                Text(DateFormatters.eventDate.string(from: event.date)).font(.subheadline).foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").foregroundStyle(.tertiary)
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Profile")
    }
}
