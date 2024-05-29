//
//  SettingView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/29.
//

import SwiftUI

import SwiftUI

struct SettingView: View {
    @StateObject private var settingViewModel = SettingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                CustomNavigationBar(
                    leftBtnAction: {
//                        pathModel.paths.removeLast()
                    }
                )
                
                Spacer()
                
                profileSettingView(settingViewModel: settingViewModel)
                settingSettingView()
                
                Spacer().frame(height: 250)
            }
        }
    }
}

struct profileSettingView : View {
    @ObservedObject var settingViewModel: SettingViewModel
    
    var body: some View{
        VStack(alignment: .leading, spacing: 20) {
            
            Text("프로필")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Spacer().frame(height: 10)
            
            Text("이름")
                .font(.system(size: 22))
                .foregroundColor(.black)
            TextField("이름 입력", text: $settingViewModel.name)
                .disabled(true)
            Text("이메일")
                .font(.system(size: 22))
                .foregroundColor(.black)
            TextField("이메일 입력", text: $settingViewModel.email)
                .disabled(true)
        }
        .padding()
    }
}

struct settingSettingView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("설정")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            
            Spacer().frame(height: 5)
            
            VStack() {
                Button(action: {
                    print("로그아웃 버튼 클릭됨")
                    // 로그아웃 액션 추가
                }) {
                    HStack {
                        Text("로그아웃")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .background(Color.white)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer().frame(height: 35)
                
                Button(action: {
                    print("계정 탈퇴 버튼 클릭됨")
                    // 계정 탈퇴 액션 추가
                }) {
                    HStack {
                        Text("계정 탈퇴")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .background(Color.white)
                }
            }
        }
        .padding()
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

