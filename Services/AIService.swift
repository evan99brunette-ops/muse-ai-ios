import Foundation

final class AIService {
    static let shared = AIService()

    func send(prompt: String, completion: @escaping (String) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            let response = self.generateFallbackReply(for: prompt)

            DispatchQueue.main.async {
                completion(response)
            }
        }
    }

    private func generateFallbackReply(for prompt: String) -> String {
        let trimmed = prompt.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed.isEmpty {
            return "I’m here. Ask me anything and I’ll help in a calm, practical way."
        }

        return "Muse has received your prompt: \"\(trimmed)\". This is a minimal demo assistant, so the response is intentionally simple and subdued."
    }
}
