import Foundation

public protocol DataService {
    func fetchClubs() -> [Club]
    func fetchEvents() -> [Event]
}

public final class MockDataService: DataService {
    public init() {}

    public func fetchClubs() -> [Club] {
        return [
            Club(name: "Literary Collective", category: "Books & Reading", avatarSystemName: "book.closed"),
            Club(name: "Photography Enthusiasts", category: "Arts & Creativity", avatarSystemName: "camera"),
            Club(name: "Coding Ninjas", category: "Technology & Gaming", avatarSystemName: "laptopcomputer"),
            Club(name: "Student Government", category: "Leadership & Politics", avatarSystemName: "person.3"),
            Club(name: "Campus Art Guild", category: "Visual Arts", avatarSystemName: "paintbrush"),
            Club(name: "Music Makers", category: "Music & Performance", avatarSystemName: "music.note"),
            Club(name: "Science Society", category: "Science & Research", avatarSystemName: "atom"),
            Club(name: "Debate Club", category: "Public Speaking", avatarSystemName: "bubble.left.and.bubble.right"),
            Club(name: "Community Volunteers", category: "Service & Outreach", avatarSystemName: "hands.sparkles")
        ]
    }

    public func fetchEvents() -> [Event] {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        let date = formatter.date(from: "2024-09-21") ?? Date()
        let end = Calendar.current.date(byAdding: .hour, value: 6, to: date) ?? date
        return [
            Event(title: "Annual Campus Festival 2024", date: date, endsAt: end, location: "University Quad", description: Self.sampleDescription)
        ]
    }

    private static let sampleDescription = "Join us for the most anticipated event of the year – the Annual Campus Festival! Live music, food trucks, clubs booths and activities for everyone."
}
