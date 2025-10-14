import SwiftUI

public enum CCColor {
    public static let primary = Color.blue
    public static let background = Color(UIColor.systemBackground)
    public static let card = Color(UIColor.secondarySystemBackground)
}

public struct PrimaryButtonStyle: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(CCColor.primary.opacity(configuration.isPressed ? 0.7 : 1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

public struct OutlineButtonStyle: ButtonStyle {
    public init() {}
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(CCColor.primary)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(CCColor.primary))
    }
}

public struct LabeledTextField: View {
    private let title: String
    private let prompt: String
    @Binding private var text: String
    private let icon: String
    private let isSecure: Bool

    public init(_ title: String, text: Binding<String>, prompt: String, icon: String, isSecure: Bool = false) {
        self.title = title
        self._text = text
        self.prompt = prompt
        self.icon = icon
        self.isSecure = isSecure
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.subheadline).foregroundStyle(.secondary)
            HStack {
                Image(systemName: icon).foregroundStyle(.secondary)
                if isSecure {
                    SecureField(prompt, text: $text)
                } else {
                    TextField(prompt, text: $text)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3)))
        }
    }
}
