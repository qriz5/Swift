//
//  AuthenticationViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/07/11.
//

import Foundation
import Combine

enum AuthenticationState{
    case unauthenticated
    case authenticated
}


class AuthenticationViewModel: ObservableObject {
    
    enum Action {
        case googleLogin
    }
    
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    var userId: String?
    
    private var container: DIContainer
//    private var subscription = Set<AnyCancellable>()
    private var subscriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
    }
    func send(action: Action) {
        switch action {
            
            
        case .googleLogin:
            container.services.authService.signInWithGoogle()
                .sink { completion in
                    // TODO:
                } receiveValue: { [weak self] user in
                    self?.userId = user.id
                }.store(in: &subscriptions)

        }
    }
}
