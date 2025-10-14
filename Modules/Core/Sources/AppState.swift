import Foundation
import Combine

public final class AppState: ObservableObject {
    @Published public var isAuthenticated: Bool
    @Published public var registeredEventIds: Set<UUID>
    @Published public var joinedClubIds: Set<UUID>

    public let dataService: DataService

    public init(isAuthenticated: Bool = false, registeredEventIds: Set<UUID> = [], joinedClubIds: Set<UUID> = [], dataService: DataService) {
        self.isAuthenticated = isAuthenticated
        self.registeredEventIds = registeredEventIds
        self.joinedClubIds = joinedClubIds
        self.dataService = dataService
    }
}
