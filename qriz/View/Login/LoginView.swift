//
//  LoginView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack{
            
            VStack(spacing : 20) {
                Spacer()
                
                Spacer()
                
                CustomNavigationBar()
                
                Spacer()
                
                Spacer()
                
                LogoImageView()
                
                Spacer()
                
                LoginButtonView()
                
                SocialLoginButtonView()
                
                Spacer()
                
                SignUpView()
                
                Spacer()
                
                Spacer()
                
                Spacer()
                
                Spacer()
                
            }
        }
    }
}
// MARK: - 로고 이미지 뷰
private struct LogoImageView: View {
    fileprivate var body: some View {
        
            HStack {
                Spacer(minLength: 30)
                
                Image("benner")
                    .resizable()
                    .frame(width: 275,height: 138)
                Spacer(minLength: 30)
            }
        }
        
}
// MARK: - 로그인 입력창 뷰
private struct LoginButtonView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    fileprivate var body: some View {
        
            VStack(spacing: 20) {
                
                        // 아이디 입력 필드
                        TextField("아이디 혹은 이메일 주소를 입력해 주세요.", text: $username)
                            .font(.system(size: 18))
                            .frame(height:32)
                            .padding()
                            .background(Color("F2F3F5"))
                            .cornerRadius(5.0)
                            .padding(.horizontal, 7)
                        
                        // 비밀번호 입력 필드
                        SecureField("비밀번호를 입력해주세요.", text: $password)
                            .font(.system(size: 18))
                            .frame(height:32)
                            .padding()
                            .background(Color.custom_wgrey)
                            .cornerRadius(5.0)
                            .padding(.horizontal, 7)
                        
                        // 로그인 버튼
                        Button(action: {
                            // MARK: 로그인 버튼 클릭 시 수행할 작업
                            print("로그인 버튼 클릭됨")
                        }) {
                            Text("로그인")
                                .font(.system(size: 18, weight: .bold))
                                .frame(height:32)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(5.0)
                                .padding(.horizontal, 7)
                        }
                    }
                    .padding()
    }
}
// MARK: - 소셜 로그인 뷰
private struct SocialLoginButtonView: View {
    fileprivate var body: some View {
        VStack(spacing: 20) {
            HStack {
                Rectangle()
                    .frame(width: 50, height: 1)
                    .foregroundColor(.gray)
                Text("다른 방법으로 로그인 하기")
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                Rectangle()
                    .frame(width: 50, height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.bottom, 10)
            
            Button(action: {
                // 소셜 로그인 버튼 클릭 시 수행할 작업
                print("소셜 로그인 버튼 클릭됨")
            }) {
                Image(systemName: "person.fill.circle")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}
// MARK: - 회원가입 아이디 비밀번호 찾기 뷰
private struct SignUpView: View {
    fileprivate var body: some View {
        HStack(spacing: 5) {
                    Button(action: {
                        // 회원가입 버튼 클릭 시 수행할 작업
                        print("회원가입 버튼 클릭됨")
                    }) {
                        Text("회원가입")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                    Text(" | ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
            
                    Button(action: {
                        // 아이디 찾기 버튼 클릭 시 수행할 작업
                        print("아이디 찾기 버튼 클릭됨")
                    }) {
                        Text("아이디 찾기")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                    Text(" | ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    Button(action: {
                        // 비밀번호 찾기 버튼 클릭 시 수행할 작업
                        print("비밀번호 찾기 버튼 클릭됨")
                    }) {
                        Text("비밀번호 찾기")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                }
                .padding()

    }

}

#Preview {
    LoginView()
}
