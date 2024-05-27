//
//  FindIdPwViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/23.
//

import Foundation

class FindIdPwViewModel: ObservableObject {
    @Published var selectedTab: Tab = .findId
    @Published var name: String = ""
    @Published var id: String = ""
    @Published var email: String = ""
    @Published var verificationCode: String = ""
    
    enum Tab: String, CaseIterable {
        case findId = "아이디 찾기"
        case findPw = "비밀번호 찾기"
    }
}
