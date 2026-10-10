import Foundation

struct ChatMessage: Identifiable, Equatable {
    let id = UUID()
    let role: MessageRole
    let text: String
    let timestamp: Date

    init(role: MessageRole, text: String, timestamp: Date = Date()) {
        self.role = role
        self.text = text
        self.timestamp = timestamp
    }
}

enum MessageRole: String {
    case user
    case assistant
}
