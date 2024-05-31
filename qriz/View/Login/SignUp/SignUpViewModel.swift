//
//  SignUpViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/23.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var userId: String = ""
    @Published var certificationId: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    @Published var showNameError: Bool = false
    @Published var showEmailError: Bool = false
    @Published var showUserIdError: Bool = false
    @Published var showcertificationIdError: Bool = false
    @Published var showPasswordError: Bool = false
    @Published var showConfirmPasswordError: Bool = false

    
    // 각 필드에 대한 검증 메서드
    func validateName() {
        showNameError = name.isEmpty
        print(name.isEmpty)
    }
    
    func validateEmail() {
        showEmailError = email.isEmpty || !email.contains("@")
    }
    
    func validateUserId() {
        showUserIdError = userId.isEmpty
    }
    
    func validatePassword() {
        showPasswordError = password.isEmpty
    }
    
    func validateConfirmPassword() {
        showConfirmPasswordError = confirmPassword.isEmpty || confirmPassword != password
    }

    // 모든 필드를 검증하는 메서드
    func validateFields() {
        validateName()
        validateEmail()
        validateUserId()
        validatePassword()
        validateConfirmPassword()
    }
}
