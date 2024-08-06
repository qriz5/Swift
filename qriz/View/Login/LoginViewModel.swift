//
//  LoginViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""


    func login() {
        if username.isEmpty || password.isEmpty {
            alertMessage = "아이디와 비밀번호를 입력해 주세요."
            showAlert = true
        } else if username == "testuser" && password == "password123" {
            alertMessage = "로그인 성공!"
            showAlert = true
        } else {
            // Simulate a failed login
            alertMessage = "로그인 실패: 아이디 혹은 비밀번호가 잘못되었습니다."
            showAlert = true
        }
    }
}
