import Foundation
import Combine
import Core

public final class LoginViewModel: ObservableObject {
    @Published public var email: String = ""
    @Published public var password: String = ""
    @Published public var isLoading: Bool = false
    @Published public var error: String?

    private weak var appState: AppState?

    public init(appState: AppState?) {
        self.appState = appState
    }

    public func attach(appState: AppState) {
        self.appState = appState
    }

    public func login() {
        error = nil
        guard !email.isEmpty, !password.isEmpty else {
            error = "Please enter email and password"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            self?.isLoading = false
            self?.appState?.isAuthenticated = true
        }
    }
}
