//
//  LoginViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/22.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login() {
        print("로그인 시도: 사용자 이름 - \(username), 비밀번호 - \(password)")
    }
}
