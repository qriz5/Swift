import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                CustomNavigationBar(
                    leftBtnAction: {
                        pathModel.paths.removeLast()
                    }
                )
                
                SignNameView(signUpViewModel: SignUpViewModel())
                
                SignEmailView()
                
                SignIdView()
                
                SignPwdView()
                
                SignUpButtonView(signUpViewModel: SignUpViewModel())
            }
            .padding()
        }
    }
}

// MARK: - 이름 뷰
struct SignNameView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Spacer().frame(height: 5)
            
            Text("이름")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            TextField("이름을 입력해 주세요", text: $signUpViewModel.name)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
            
            if signUpViewModel.showNameError {
                Text("이름을 입력해 주세요")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
        }
        .padding(.horizontal)
        .onChange(of: signUpViewModel.name) { _ in
            if signUpViewModel.name.isEmpty {
                signUpViewModel.showNameError = true
            } else {
                signUpViewModel.showNameError = false
            }
        }
    }
}


// MARK: - 이메일 뷰
struct SignEmailView: View {
    @StateObject private var signUpViewModel = SignUpViewModel()
    @State private var email: String = ""
    @State private var verificationCode: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("이메일")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            HStack {
                TextField("이메일을 입력해 주세요", text: $signUpViewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5.0)
                
                Button(action: {
                    // 이메일 인증 버튼 클릭 시 수행할 작업
                    print("이메일 인증 버튼 클릭됨")
                }) {
                    Text("인증")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .frame(width: 100, height: 50)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
            }
            
            TextField("인증번호 4자리 입력", text: $signUpViewModel.confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
        }
        .padding(.horizontal)
    }
}

// MARK: - 아이디 뷰
struct SignIdView: View {
    @State private var userId: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("아이디")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            HStack {
                TextField("아이디를 입력해 주세요", text: $userId)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5.0)
                
                Button(action: {
                    // 아이디 중복확인 버튼 클릭 시 수행할 작업
                    print("아이디 중복확인 버튼 클릭됨")
                }) {
                    Text("중복확인")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .frame(width: 100, height: 50)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(5.0)
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - 비밀번호 뷰
struct SignPwdView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("비밀번호")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            SecureField("비밀번호를 입력해 주세요", text: $password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
            
            SecureField("비밀번호를 확인해 주세요", text: $confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
        }
        .padding(.horizontal)
    }
}

// MARK: - 가입하기 버튼 뷰
struct SignUpButtonView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    
    var body: some View {
        
        Spacer()
        
        Button(action: {
            // 가입하기 버튼 클릭 시 수행할 작업
            signUpViewModel.validateFields()
            
            print("가입하기 버튼 클릭됨")
        }) {
            Text("가입하기")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(5.0)
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    SignUpView()
}
