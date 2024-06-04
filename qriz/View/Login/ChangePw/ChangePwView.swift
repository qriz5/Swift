//
//  ChangePwView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/06/04.
//

import SwiftUI

struct ChangePwView: View {
    @StateObject private var changePwViewModel = ChangePwViewModel()
    @EnvironmentObject private var pathModel: PathModel
    @State private var showEmailSentAlert = false
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(
                    isDisplayLeftBtn: true,
                    isDisplayRightBtn: false,
                    isCenterTitle: true,
                    leftBtnAction: {
                        pathModel.paths.removeLast()
                    },
                    centerTitleType: .chpw
                )
                
                Spacer().frame(height: 20)
                
                ChangePwTitleView()
                
                Spacer().frame(height: 20)
                
                ChangePwTextFieldView(changePwViewModel: changePwViewModel)
                
                Spacer()
                
                ChangePwOkButtonView {
                    changePwViewModel.changePassword()
                    if changePwViewModel.errorMessage == nil {
                        showEmailSentAlert = true
                    }
                }
            }
            .padding()
            
            if showEmailSentAlert {
                CustomSendEmailView(
                    title: "비밀번호 변경 완료!",
                    subtitle: "비밀번호가 성공적으로 변경되었습니다. 로그인 화면으로 돌아가 로그인하세요.",
                    onDismiss: {
                        showEmailSentAlert = false
                    }
                )
                .transition(.opacity)
                .zIndex(1)
            }
        }
    }
}

//MARK: ChangePwTitleView
struct ChangePwTitleView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5) {
            
                Text("비밀번호를 잊으셨나요?")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                
                Spacer().frame(height: 10)
                
                Text("기존에 가입할 때 사용한 이메일을 입력하시면\n비밀번호 변경 메일을 전송해드립니다.")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding()
            
            Spacer()
        }
    }
}

//MARK: ChangePwTextFieldView
struct ChangePwTextFieldView: View {
    @ObservedObject var changePwViewModel: ChangePwViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("새 비밀번호")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.bottom, 5)
            SecureField("새 비밀번호를 입력하세요", text: $changePwViewModel.newPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)

            SecureField("비밀번호를 다시 입력하세요", text: $changePwViewModel.confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)

            if let errorMessage = changePwViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .padding(.top, 5)
            }
        }
        .padding([.leading, .trailing, .bottom])
    }
}

//MARK: ChangePwOkButtonView
struct ChangePwOkButtonView: View {
    var onConfirm: () -> Void
    
    var body: some View {
        Button(action: {
            onConfirm()
        }) {
            Text("확인")
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(10)
        }
        .padding([.leading, .trailing, .bottom])
    }
}

#Preview {
    ChangePwView()
}
