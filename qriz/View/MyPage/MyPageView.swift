//
//  MyPageView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import SwiftUI

struct MyPageView: View {
    @EnvironmentObject private var mypathModel: MyPagePathModel
    
    var body: some View {
        NavigationStack(path: $mypathModel.paths) {
            VStack {
                MyPageViewContentView()
            }
            .navigationDestination(
                for: MyPagePathType.self,
                destination: { MyPagePathType in
                    switch MyPagePathType {
                    case .registView:
                        ExamRegistView()
                            .navigationBarBackButtonHidden()
                    }
                }
            )
        }
        .environmentObject(mypathModel)
    }
}

struct MyPageViewContentView : View {
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                isDisplayLeftBtn: false,
                isDisplayRightBtn: false,
                isCenterTitle: true,
                centerTitleType: .mypage
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

// MARK: - MyPageTitleView
struct MyPageTitleView: View {
    var userName: String
    
    var body: some View {
        HStack{
            Text(userName)
                .font(.system(size: 24,weight: .bold))
                .padding(.top)
            Spacer()
        }
        .padding(3)
    }
}

// MARK: - 상단 시험 관련 버튼 뷰
struct MyPageExamView: View {
    @EnvironmentObject private var mypathModel: MyPagePathModel
    @State var showModal = false
    
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
                self.showModal.toggle()
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
                .sheet(isPresented: self.$showModal) {
                    ExamRegistView()
                }
            }
        }
        .padding(3)
    }
}

// MARK: - 고객 센터 리스트 뷰
struct MyPageServiceView: View {
    @StateObject private var myPageViewModel = MyPageViewModel()
    
    var body: some View {
        List {
            Section(header: Text("고객 센터").font(.system(size: 16))) {
                ForEach(myPageViewModel.services, id: \.self) { service in
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
        .environmentObject(MyPagePathModel())
}
