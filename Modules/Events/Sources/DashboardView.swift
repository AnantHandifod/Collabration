import SwiftUI
import Core
import DesignSystem

public struct DashboardView: View {
    @EnvironmentObject private var appState: AppState

    public init() {}

    public var body: some View {
        let events = appState.dataService.fetchEvents()
        return List(events) { event in
            NavigationLink(value: event) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.title).fontWeight(.semibold)
                    Text("\(DateFormatters.eventDate.string(from: event.date)) • \(DateFormatters.eventTime.string(from: event.date))")
                        .font(.subheadline).foregroundStyle(.secondary)
                }
            }
        }
        .navigationDestination(for: Event.self) { EventDetailView(event: $0) }
        .navigationTitle("Dashboard")
    }
}
