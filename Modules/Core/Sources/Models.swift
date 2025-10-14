import Foundation

public struct Club: Identifiable, Hashable {
    public let id: UUID
    public let name: String
    public let category: String
    public let avatarSystemName: String
    public init(id: UUID = UUID(), name: String, category: String, avatarSystemName: String) {
        self.id = id
        self.name = name
        self.category = category
        self.avatarSystemName = avatarSystemName
    }
}

public struct Event: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let date: Date
    public let endsAt: Date
    public let location: String
    public let description: String
    public init(id: UUID = UUID(), title: String, date: Date, endsAt: Date, location: String, description: String) {
        self.id = id
        self.title = title
        self.date = date
        self.endsAt = endsAt
        self.location = location
        self.description = description
    }
}
