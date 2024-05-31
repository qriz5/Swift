import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var pathModelSign: PathModelSign
    @EnvironmentObject private var pathModel: PathModel
    @State private var currentStep: SignUpStep = .name
    
    var body: some View {
            VStack(spacing: 20) {
                
                CustomNavigationBar(
                    isDisplayLeftBtn: true,
                    isDisplayRightBtn: false,
                    isCenterTitle: true, 
                    leftBtnAction: {
                        pathModel.paths.removeLast()
                    },
                    centerTitleType: .signup
                )
                
                ProgressBar(steps: [.name, .email, .id, .password], currentStep: currentStep)
                
                Spacer()
                
                Group {
                    switch currentStep {
                    case .name:
                        SignNameView(signUpViewModel: SignUpViewModel(), nextStep: { currentStep = .email })
                    case .email:
                        SignEmailView(signUpViewModel: SignUpViewModel(), nextStep: { currentStep = .id }, previousStep: { currentStep = .name })
                    case .id:
                        SignIdView(signUpViewModel: SignUpViewModel(), nextStep: { currentStep = .password }, previousStep: { currentStep = .email })
                    case .password:
                        SignPwdView(signUpViewModel: SignUpViewModel(), nextStep: { print("All steps completed") }, previousStep: { currentStep = .id })

                    }
                }
            }
            .padding()
        }
}

// MARK: - 타이트 뷰
struct SignTitleView: View {
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(.system(size: 25, weight: .bold))
                .padding(.bottom, 5)
            Text(subtitle)
                .foregroundColor(.gray)
                .font(.system(size: 16))
        }
    }
}

// MARK: - 이름 뷰
struct SignNameView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    let nextStep: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SignTitleView(title: "이름을 입력해주세요!", subtitle: "가입을 위해 실명을 입력해 주세요.")
            
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
            
            Spacer()
            
            Button(action: nextStep) {
                Text("다음")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(5.0)
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
    @ObservedObject var signUpViewModel: SignUpViewModel
    let nextStep: () -> Void
    let previousStep: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SignTitleView(title: "이메일로 본인확인을 진행할게요!", subtitle: "이메일 형식을 맞춰 입력해 주세요.")
            
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
            
            Spacer()
            
            HStack {
                Button(action: previousStep) {
                    Text("이전")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
                
                Button(action: nextStep) {
                    Text("다음")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
            }
            
        }
        .padding(.horizontal)
    }
}

// MARK: - 아이디 뷰
struct SignIdView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    let nextStep: () -> Void
    let previousStep: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SignTitleView(title: "아이디를 입력해주세요.!", subtitle: "사용할 아이디를 입력해주세요.")
            
            Text("아이디")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            HStack {
                TextField("아이디를 입력해 주세요", text: $signUpViewModel.userId)
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
            
            Spacer()
            
            HStack {
                Button(action: previousStep) {
                    Text("이전")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
                
                Button(action: nextStep) {
                    Text("다음")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - 비밀번호 뷰
struct SignPwdView: View {
    @ObservedObject var signUpViewModel: SignUpViewModel
    let nextStep: () -> Void
    let previousStep: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SignTitleView(title: "비밀번호를 입력해주세요.!", subtitle: "사용할 비밀번호를 입력해주세요.")
            
            Text("비밀번호")
                .font(.headline)
            
            Spacer().frame(height: 1)
            
            SecureField("비밀번호를 입력해 주세요", text: $signUpViewModel.password)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
            
            SecureField("비밀번호를 확인해 주세요", text: $signUpViewModel.confirmPassword)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(5.0)
            
            Spacer()
            
            HStack {
                Button(action: previousStep) {
                    Text("이전")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
                
                Button(action: nextStep) {
                    Text("가입하기")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(5.0)
                }
            }
        }
        .padding(.horizontal)
    }
}



#Preview {
    SignUpView()
        .environmentObject(PathModel())
}

//변경전
//struct SignUpView: View {
//    @EnvironmentObject private var pathModel: PathModel
//
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//
//                CustomNavigationBar(
//                    leftBtnAction: {
//                        pathModel.paths.removeLast()
//                    }
//                )
//
////                SignNameView(signUpViewModel: SignUpViewModel())
////
////                SignEmailView()
////
////                SignIdView()
////
////                SignPwdView()
////
////                SignUpButtonView(signUpViewModel: SignUpViewModel())
//            }
//            .padding()
//        }
//    }
//}
//// MARK: - 타이트 뷰
//struct SignTitleView: View {
//    let title: String
//    let subtitle: String
//
//    var body: some View {
//        VStack {
//            Text(title)
//                .foregroundColor(.black)
//                .font(.system(size: 25, weight: .bold))
//                .padding(.bottom,5)
//            Text(subtitle)
//                .foregroundColor(.gray)
//                .font(.system(size: 16))
//        }
//    }
//}
//
//// MARK: - 이름 뷰
//struct SignNameView: View {
//    @ObservedObject var signUpViewModel: SignUpViewModel
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            SignTitleView(title: "이름을 입력해주세요!", subtitle: "가입을 위해 실명을 입력해 주세요.")
//
//            Spacer().frame(height: 5)
//
//            Text("이름")
//                .font(.headline)
//
//            Spacer().frame(height: 1)
//
//            TextField("이름을 입력해 주세요", text: $signUpViewModel.name)
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(5.0)
//
//            if signUpViewModel.showNameError {
//                Text("이름을 입력해 주세요")
//                    .foregroundColor(.gray)
//                    .font(.caption)
//            }
//
//            SignUpButtonView(signUpViewModel: SignUpViewModel())
//        }
//        .padding(.horizontal)
//        .onChange(of: signUpViewModel.name) { _ in
//            if signUpViewModel.name.isEmpty {
//                signUpViewModel.showNameError = true
//            } else {
//                signUpViewModel.showNameError = false
//            }
//        }
//    }
//}
//
//
//// MARK: - 이메일 뷰
//struct SignEmailView: View {
//    @StateObject private var signUpViewModel = SignUpViewModel()
//    @State private var email: String = ""
//    @State private var verificationCode: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            SignTitleView(title: "이메일로 본인확인을 진행할게요!", subtitle: "이메일 형식을 맞춰 입력해 주세요.")
//
//            Text("이메일")
//                .font(.headline)
//
//            Spacer().frame(height: 1)
//
//            HStack {
//                TextField("이메일을 입력해 주세요", text: $signUpViewModel.email)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(5.0)
//
//                Button(action: {
//                    // 이메일 인증 버튼 클릭 시 수행할 작업
//                    print("이메일 인증 버튼 클릭됨")
//                }) {
//                    Text("인증")
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 10)
//                        .frame(width: 100, height: 50)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(5.0)
//                }
//            }
//
//            TextField("인증번호 4자리 입력", text: $signUpViewModel.confirmPassword)
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(5.0)
//
//            SignUpButtonView(signUpViewModel: SignUpViewModel())
//        }
//        .padding(.horizontal)
//    }
//}
//
//// MARK: - 아이디 뷰
//struct SignIdView: View {
//    @State private var userId: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            SignTitleView(title: "아이디를 입력해주세요.!", subtitle: "사용할 아이디를 입력해주세요.")
//
//            Text("아이디")
//                .font(.headline)
//
//            Spacer().frame(height: 1)
//
//            HStack {
//                TextField("아이디를 입력해 주세요", text: $userId)
//                    .padding()
//                    .background(Color.gray.opacity(0.1))
//                    .cornerRadius(5.0)
//
//                Button(action: {
//                    // 아이디 중복확인 버튼 클릭 시 수행할 작업
//                    print("아이디 중복확인 버튼 클릭됨")
//                }) {
//                    Text("중복확인")
//                        .padding(.horizontal, 10)
//                        .padding(.vertical, 10)
//                        .frame(width: 100, height: 50)
//                        .background(Color.gray)
//                        .foregroundColor(.white)
//                        .cornerRadius(5.0)
//                }
//            }
//            SignUpButtonView(signUpViewModel: SignUpViewModel())
//        }
//        .padding(.horizontal)
//    }
//}
//
//// MARK: - 비밀번호 뷰
//struct SignPwdView: View {
//    @State private var password: String = ""
//    @State private var confirmPassword: String = ""
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 5) {
//            SignTitleView(title: "비밀번호를 입력해주세요.!", subtitle: "사용할 비밀번호를 입력해주세요.")
//
//            Text("비밀번호")
//                .font(.headline)
//
//            Spacer().frame(height: 1)
//
//            SecureField("비밀번호를 입력해 주세요", text: $password)
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(5.0)
//
//            SecureField("비밀번호를 확인해 주세요", text: $confirmPassword)
//                .padding()
//                .background(Color.gray.opacity(0.1))
//                .cornerRadius(5.0)
//
//            SignUpButtonView(signUpViewModel: SignUpViewModel())
//        }
//        .padding(.horizontal)
//    }
//}
//
//// MARK: - 가입하기 버튼 뷰
//struct SignUpButtonView: View {
//    @ObservedObject var signUpViewModel: SignUpViewModel
//
//    var body: some View {
//
//        Spacer()
//
//        Button(action: {
//            // 가입하기 버튼 클릭 시 수행할 작업
//            signUpViewModel.validateFields()
//
//            print("가입하기 버튼 클릭됨")
//        }) {
//            Text("가입하기")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.gray)
//                .cornerRadius(5.0)
//        }
//        .padding(.horizontal)
//
//    }
//}
//
//#Preview {
//    SignUpView()
//}
