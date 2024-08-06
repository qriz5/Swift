//
//  FindIdViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/30.
//

import Foundation

class FindIdViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var errorMessage: String?
    @Published var isEmailSent: Bool = false
    @Published var emailSendError: String?

    func sendEmail() {
        // 이메일 발송 로직을 여기에 구현합니다.
        if isValidEmail(email) {
            // 이메일 발송 성공 시
            isEmailSent = true
            emailSendError = nil
        } else {
            // 이메일 발송 실패 시
            isEmailSent = false
            emailSendError = "이메일 발송에 실패했습니다. 다시 시도해 주세요."
        }
    }
    
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
