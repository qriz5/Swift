//
//  FindPwViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/30.
//

import Foundation

class FindPwViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?

    func validateEmail() {
        if email.isEmpty {
            errorMessage = "이메일을 입력해주세요."
        } else if !isValidEmail(email) {
            errorMessage = "이메일 형식이 올바르지 않습니다."
        } else {
            errorMessage = nil
        }
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
