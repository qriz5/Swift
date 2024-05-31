//
//  LoginView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var pathModel: PathModel
    var body: some View {
        NavigationStack(path: $pathModel.paths) {
            LoginContentView(loginViewModel: LoginViewModel())
                .navigationDestination(
                    for: PathType.self,
                    destination: { PathType in
                        switch PathType {
                        case .signUpView:
                            SignUpView()
                                .navigationBarBackButtonHidden()
                        case .findIdView:
                            FindIdView()
                                .navigationBarBackButtonHidden()
                        case let .findPwView:
                            FindPwView()
                                .navigationBarBackButtonHidden()
                        }
                 }
                )
        }
        .environmentObject(pathModel)
    }
}
// MARK: -
private struct LoginContentView: View {
    @ObservedObject private var loginViewModel: LoginViewModel
    
    fileprivate init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
    
    fileprivate var body: some View {
        VStack(spacing : 20) {
            CustomNavigationBar(
            )
            Spacer().frame(height: 150)
            LogoImageView()
            Spacer()
            LoginButtonView(loginviewModel: LoginViewModel())
            SocialLoginButtonView()
            Spacer()
            SignUpFindView()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - 로고 이미지 뷰
private struct LogoImageView: View {
    fileprivate var body: some View {
        
            HStack {
                Spacer(minLength: 30)
                
                Image("benner")
                    .resizable()
                    .frame(width: 260,height: 130)
                
                Spacer(minLength: 30)
            }
        }
        
}
// MARK: - 로그인 입력창 뷰
struct LoginButtonView: View {
    @ObservedObject var loginviewModel: LoginViewModel
    
     var body: some View {
        
            VStack(spacing: 20) {
                
                        // 아이디 입력 필드
                        TextField("아이디 혹은 이메일 주소를 입력해 주세요.", text: $loginviewModel.username)
                            .font(.system(size: 18))
                            .frame(height:28)
                            .padding()
                            .cornerRadius(5.0)
                            .padding(.horizontal, 7)
                        
                        // 비밀번호 입력 필드
                        SecureField("비밀번호를 입력해주세요.", text: $loginviewModel.password)
                            .font(.system(size: 18))
                            .frame(height:28)
                            .padding()
                            .cornerRadius(5.0)
                            .padding(.horizontal, 7)
                        
                        // 로그인 버튼
                        Button(action: {
                            // MARK: 로그인 버튼 클릭 시 수행할 작업
                            print("로그인 버튼 클릭됨")
                        }) {
                            Text("로그인")
                                .font(.system(size: 18, weight: .bold))
                                .frame(height:28)
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
private struct SignUpFindView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    fileprivate var body: some View {
        HStack(spacing: 5) {
                    Button(action: {
                        pathModel.paths.append(.signUpView)
                    }) {
                        Text("회원가입")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                    Text(" | ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
            
                    Button(action: {
                        pathModel.paths.append(.findIdView)
                    }) {
                        Text("아이디 찾기")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                    Text(" | ")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                    Button(action: {
                        pathModel.paths.append(.findPwView)
                    }) {
                        Text("비밀번호 찾기")
                            .foregroundColor(.gray)
                            .font(.system(size: 16))
                    }
                }
                .padding()
                Spacer().frame(height: 200)

    }

}

#Preview {
    LoginView()
        .environmentObject(PathModel())
}
