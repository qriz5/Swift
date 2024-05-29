//
//  MyPageView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var pathModel: PathModel
    
    var body: some View {
        NavigationStack {
            VStack {
                
                CustomNavigationBar(
                    leftBtnAction: {
                        pathModel.paths.removeLast()
                    }
                )
                
                Spacer().frame(height:30)
                
                MyPageTitleView(userName: "User Name") // 여기에 사용자의 이름을 전달하세요.
                
                Spacer().frame(height:30)
                
                MyPageExamView()
                
                Spacer().frame(height:30)
                
                Divider().background(Color.black).frame(height: 10)
                
                MyPageServiceView()
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - MyPageTitleView
struct MyPageTitleView: View {
    var userName: String
    
    var body: some View {
        HStack{
            Text(userName)
                .font(.system(size: 32,weight: .bold))
                .padding(.top)
            Spacer()
        }
        .padding(3)
    }
}

// MARK: - 상단 시험 관련 버튼 뷰
struct MyPageExamView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Action for Button 1
            }) {
                VStack {
                    Image("Frame39")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .padding(.bottom, 4)
                    Text("정오답노트")
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                }
                .frame(maxWidth: .infinity, maxHeight: 90)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(8)
                .padding(4)
            }

            Button(action: {
                // Action for Button 2
            }) {
                VStack {
                    Image("Frame39")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .padding(.bottom, 4)
                    Text("점수 보기")
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                }
                .frame(maxWidth: .infinity, maxHeight: 90)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(8)
                .padding(4)
            }

            Button(action: {
                // Action for Button 3
            }) {
                VStack {
                    Image("Frame39")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                        .padding(.bottom, 4)
                    Text("시험 등록")
                        .font(.system(size: 16))
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                }
                .frame(maxWidth: .infinity, maxHeight: 90)
                .background(Color(red: 0.9, green: 0.9, blue: 0.9))
                .cornerRadius(8)
                .padding(4)
            }
        }
        .padding(3)
    }
}

// MARK: - 고객 센터 리스트 뷰
struct MyPageServiceView: View {
    let services = [
        "FAQ",
        "서비스 이용약관",
        "개인정보처리 방침",
        "버전정보",
        "공지사항"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("고객 센터").font(.system(size: 16))) {
                    ForEach(services, id: \.self) { service in
                        NavigationLink(destination: DetailView(title: service)) {
                            Text(service)
                                .font(.system(size: 16))
                                .padding(.vertical, 10)
                                .foregroundColor(.black)
                        }
                        .listRowSeparator(.hidden)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .environment(\.defaultMinListRowHeight, 70)
        }

    }
}

struct DetailView: View {
    var title: String
    
    var body: some View {
        VStack {
            Text("\(title) 화면")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationBarTitle(title, displayMode: .inline)
    }
}
#Preview {
    MyPageView()
}
