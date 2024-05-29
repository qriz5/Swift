//
//  MyPageViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import Foundation

class MyPageViewModel: ObservableObject {
    @Published var services = [
        "FAQ",
        "서비스 이용약관",
        "개인정보처리 방침",
        "버전정보",
        "공지사항"
    ]
}
