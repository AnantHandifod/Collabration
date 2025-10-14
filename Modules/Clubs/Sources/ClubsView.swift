import SwiftUI
import Core
import DesignSystem

public struct ClubsView: View {
    @EnvironmentObject private var appState: AppState
    @State private var query: String = ""

    public init() {}

    private var clubs: [Club] { appState.dataService.fetchClubs() }
    private var filtered: [Club] {
        guard !query.isEmpty else { return clubs }
        return clubs.filter { $0.name.localizedCaseInsensitiveContains(query) || $0.category.localizedCaseInsensitiveContains(query) }
    }

    public var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
                    TextField("Search clubs…", text: $query)
                }
            }
            ForEach(filtered) { club in
                ClubRow(club: club, isJoined: appState.joinedClubIds.contains(club.id)) {
                    if appState.joinedClubIds.contains(club.id) {
                        appState.joinedClubIds.remove(club.id)
                    } else {
                        appState.joinedClubIds.insert(club.id)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Clubs")
    }
}

private struct ClubRow: View {
    let club: Club
    let isJoined: Bool
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle().fill(Color.gray.opacity(0.2)).frame(width: 44, height: 44)
                Image(systemName: club.avatarSystemName)
            }
            VStack(alignment: .leading) {
                Text(club.name).fontWeight(.semibold)
                Text(club.category).font(.subheadline).foregroundStyle(.secondary)
            }
            Spacer()
            Button(isJoined ? "Joined" : "Join Club", action: onToggle)
                .buttonStyle(isJoined ? OutlineButtonStyle() : PrimaryButtonStyle())
                .frame(width: 110)
        }
        .padding(.vertical, 4)
    }
}
