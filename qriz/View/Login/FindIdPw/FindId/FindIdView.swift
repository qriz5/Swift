//
//  FindIdView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/30.
//

import SwiftUI

struct FindIdView: View {
    @EnvironmentObject var pathModel: PathModel
    @StateObject var findIdViewModel = FindIdViewModel()
    @State private var isButtonClicked = false
    
    var body: some View {
        VStack{

            CustomNavigationBar(
                isDisplayLeftBtn: true,
                isDisplayRightBtn: false,
                isCenterTitle: true,
                leftBtnAction: {
                    pathModel.paths.removeLast()
                },
                centerTitleType: .id
            )
            
            IdTitleView()
            
            IdEmailView(email: $findIdViewModel.email, errorMessage: findIdViewModel.errorMessage)
                .onChange(of: findIdViewModel.email) { _ in
                    findIdViewModel.validateEmail()
                }
            
            SendEmailButton()
                .onTapGesture {
                    isButtonClicked = true
                    findIdViewModel.validateEmail()
                }

        }
    }
}
// MARK: IDTitleView
struct IdTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Spacer().frame(height: 40)
                
                Text("아이디를 잊으셨나요?")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                Spacer().frame(height: 10)
                Text("QRiz에 가입했던 이메일을 입력하시면\n아이디를 메일로 보내드립니다.")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding()
            Spacer()
        }
    }
}

// MARK: 이메일 입력 뷰
private struct IdEmailView: View {
    @Binding var email: String
    var errorMessage: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text("이메일")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            TextField("예) Qriz@test.com", text: $email)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .padding(.top, 5)
            }
        }
        .padding()
    }
}

#Preview {
    FindIdView()
}
