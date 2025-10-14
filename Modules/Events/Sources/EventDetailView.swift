import SwiftUI
import Core
import DesignSystem

public struct EventDetailView: View {
    @EnvironmentObject private var appState: AppState
    public let event: Event

    public init(event: Event) { self.event = event }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                RoundedRectangle(cornerRadius: 12).fill(Color.gray.opacity(0.15)).frame(height: 160)
                    .overlay(Image(systemName: "photo").font(.largeTitle))
                Text(event.title).font(.title2).fontWeight(.bold)
                VStack(alignment: .leading, spacing: 8) {
                    Label(DateFormatters.eventDate.string(from: event.date), systemImage: "calendar")
                    Label("\(DateFormatters.eventTime.string(from: event.date)) - \(DateFormatters.eventTime.string(from: event.endsAt))", systemImage: "clock")
                    Label(event.location, systemImage: "mappin.and.ellipse")
                }.foregroundStyle(.secondary)
                Text("About the Event").font(.headline)
                Text(event.description).foregroundStyle(.secondary)
                VStack(spacing: 12) {
                    Button(isRegistered ? "Registered" : "Register Now") { toggleRegistration() }
                        .buttonStyle(PrimaryButtonStyle())
                    Button("I'm Interested") {}
                        .buttonStyle(OutlineButtonStyle())
                }
                .padding(.top, 8)
            }
            .padding()
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var isRegistered: Bool { appState.registeredEventIds.contains(event.id) }
    private func toggleRegistration() {
        if isRegistered { appState.registeredEventIds.remove(event.id) }
        else { appState.registeredEventIds.insert(event.id) }
    }
}
