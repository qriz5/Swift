//
//  SendEmailButton.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/30.
//

import SwiftUI

struct SendEmailButton: View {
    var body: some View {
                Spacer()
        
                Button(action: {
                    // 이메일 발송
        
                    print("이메일 발송 버튼 클릭됨")
                }) {
                    Text("이메일 발송")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
                .padding(.horizontal)
                
                Spacer().frame(height: 10)
    }
}

#Preview {
    SendEmailButton()
}
