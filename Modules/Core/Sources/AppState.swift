import Foundation
import Combine

public final class AppState: ObservableObject {
    @Published public var isAuthenticated: Bool
    @Published public var registeredEventIds: Set<UUID>

    public let dataService: DataService

    public init(isAuthenticated: Bool = false, registeredEventIds: Set<UUID> = [], dataService: DataService) {
        self.isAuthenticated = isAuthenticated
        self.registeredEventIds = registeredEventIds
        self.dataService = dataService
    }
}
