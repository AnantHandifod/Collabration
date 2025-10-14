import SwiftUI
import DesignSystem
import Core

public struct LoginView: View {
    @EnvironmentObject private var appState: AppState
    @StateObject private var viewModel = LoginViewModel(appState: nil)

    public init() {}

    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Spacer().frame(height: 40)
                Image(systemName: "sparkle")
                    .font(.system(size: 56, weight: .semibold))
                Text("CollegeConnect").font(.title2).fontWeight(.semibold)
                Text("Welcome to College\nConnect")
                    .multilineTextAlignment(.center)
                    .font(.title2).fontWeight(.bold)
                    .padding(.top, 4)
                VStack(spacing: 16) {
                    LabeledTextField("Email Address", text: $viewModel.email, prompt: "Enter your email", icon: "envelope")
                    LabeledTextField("Password", text: $viewModel.password, prompt: "Enter your password", icon: "lock", isSecure: true)
                    Button(action: { viewModel.login() }) {
                        Text(viewModel.isLoading ? "Loading…" : "Login")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    HStack { Rectangle().frame(height: 1).foregroundStyle(.quaternary); Text("or").foregroundStyle(.secondary); Rectangle().frame(height: 1).foregroundStyle(.quaternary) }
                    Button("Sign Up") {}
                        .buttonStyle(OutlineButtonStyle())
                }
                .padding(.horizontal)
                if let error = viewModel.error { Text(error).foregroundStyle(.red) }
                Spacer(minLength: 20)
            }
        }
        .background(Color(.systemBackground))
        .onAppear { viewModel.attach(appState: appState) }
    }
}
