//
//  AuthenticationView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/07/11.
//

import SwiftUI

struct AuthenticatedView: View {
    @StateObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var pathModel: PathModel
    
    var body: some View {
        switch authViewModel.authenticationState {
        case .unauthenticated:
            LoginView()
                .environmentObject(PathModel())
                .environmentObject(authViewModel)
        case .authenticated:
            HomeView()
        }
    }
}

struct AuthenticatedView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedView(authViewModel: .init(container: .init(services: StubService())))
    }
}
