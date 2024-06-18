//
//  MainPageView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        ScrollView {
            VStack{
                ExamScheduleView(mainPageViewModel: MainPageViewModel())
                
                DailyScheduleView()
                
                Spacer()
            }
        }
    }
}

//MARK: 시험 일정 표기 화면
struct ExamScheduleView: View {
    @ObservedObject var mainPageViewModel: MainPageViewModel
    @State var showModal = false
    var intnumber = 2 //시험 정보 등록 여부 임시
    
    var body: some View {
        HStack {
             VStack(alignment: .leading) {
                 Spacer().frame(height:20)
                 if intnumber == 1 {
                     // if문 시험을 접수 했을경우
                     VStack(spacing: 0) {
                         Spacer().frame(height: 15)
                         
                         Text("민이 님의\n시험 일정을 등록해보세요!")
                             .font(.system(size: 22, weight: .bold))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         Spacer().frame(height: 15)
                         
                         Divider().background(Color.black).frame(height: 10)
                         
                         Spacer().frame(height: 15)
                         
                         Text("등록된 일정이 없어요.")
                             .font(.system(size: 18, weight: .bold))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         Spacer().frame(height: 7)
                         Text("지금바로 등록할까요?")
                             .font(.system(size: 16))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         
                         Spacer().frame(height: 22)
                         
                         Button(action: {
                             self.showModal.toggle()
                         }) {
                             Text("등록하기")
                                 .font(.system(size: 18, weight: .bold))
                                 .frame(height: 22)
                                 .foregroundColor(.white)
                                 .frame(maxWidth: .infinity)
                                 .padding()
                                 .background(Color.blue)
                                 .cornerRadius(5.0)
                                 .padding(.horizontal, 7)
                         }
                         .frame(maxWidth: .infinity, alignment: .center)
                         .sheet(isPresented: self.$showModal) {
                             ExamRegistView()
                         }
                         Spacer().frame(height: 20)
                     }
                     .padding()
                     .frame(maxWidth: .infinity, maxHeight: .infinity)
                     .background(Color.white)
                     .cornerRadius(15)


                 }
                 else{
                     // else 시험 접수를 안했을 경우
                     Text("민이 님이 등록한 \n시험까지")
                         .foregroundColor(.black)
                         .font(.system(size: 25, weight: .bold))
                         .lineSpacing(10)
                     
                     Spacer().frame(height:30)
                     
                     HStack(spacing: 0) {
                         Text("D")
                             .foregroundColor(.black)
                             .font(.system(size: 32, weight: .bold))
                             .padding(4)
                             .frame(width:50, height:50)
                             .background(Color.gray)
                             .cornerRadius(4)
                             
                         
                         Text(" - ")
                             .foregroundColor(.black)
                             .font(.system(size: 32, weight: .bold))
                         
                         Text("30")
                             .foregroundColor(.black)
                             .font(.system(size: 32, weight: .bold))
                             .padding(4)
                             .frame(width:60, height: 50)
                             .background(Color.gray)
                             .cornerRadius(4)
                     }
                     
                     Spacer().frame(height:50)
                     
                     VStack(spacing: 0) {
                         Spacer().frame(height: 15)
                         
                         Text("시험일 : 3월9일(토)")
                             .font(.system(size: 20, weight: .bold))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         
                         Spacer().frame(height: 10)
                         
                         Text("재 52회 SQL 개발자")
                             .font(.system(size: 14, weight: .bold))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         Spacer().frame(height: 7)
                         Text("접수기간: 01.29(월) 10:00 ~ 02:02(금) 18:00")
                             .font(.system(size: 14))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         
                         Spacer().frame(height: 22)
                         
                         Divider().background(Color.black).frame(height: 10)
                         
                         Spacer().frame(height: 12)
                         
                         Text("일정을 변경할까요?")
                             .font(.system(size: 16))
                             .multilineTextAlignment(.leading)
                             .frame(maxWidth: .infinity, alignment: .leading)
                         
                         Spacer().frame(height: 12)
                         
                         Button(action: {
                             self.showModal.toggle()
                         }) {
                             Text("변경하기")
                                 .font(.system(size: 18, weight: .bold))
                                 .frame(height: 22)
                                 .foregroundColor(.white)
                                 .frame(maxWidth: .infinity)
                                 .padding()
                                 .background(Color.blue)
                                 .cornerRadius(5.0)
                                 .padding(.horizontal, 7)
                         }
                         .frame(maxWidth: .infinity, alignment: .center)
                         .sheet(isPresented: self.$showModal) {
                             ExamRegistView()
                         }
                         Spacer().frame(height: 15)
                     }
                     .padding()
                     .frame(maxWidth: .infinity, maxHeight: .infinity)
                     .background(Color.white)
                     .cornerRadius(15)
                 }
             }
             .padding()
             Spacer()
        }
        .background(Color.gray.opacity(0.1))
    }
}

//MARK: 오늘의 공부 이동 화면
struct DailyScheduleView: View {
    @State private var selectedDay: Int? = nil

    init(initialSelectedDay: Int? = nil) {
        _selectedDay = State(initialValue: initialSelectedDay)
    }
    
    var body: some View {
        VStack {
            StudyButtonListView(selectedDay: $selectedDay)
            DailyStudyView()
            DailyStudyButtonView()
            Spacer().frame(height: 50)
            ReviewTestExamButtonView()
        }
        .background(Color.gray.opacity(0.1))
    }
}

struct StudyButtonListView: View {
    @Binding var selectedDay: Int?

    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            
            HStack{
                Spacer().frame(width: 5)
                Text("오늘의 공부")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading)
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(1...10, id: \.self) { index in
                        StudyButton(title: "Day", subtitle: "\(index)", isSelected: Binding(
                            get: { selectedDay == index },
                            set: { isSelected in
                                if isSelected {
                                    selectedDay = index
                                } else {
                                    selectedDay = nil
                                }
                            }
                        ))
                        .frame(width: 80, height: 80)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct StudyButton: View {
    var title: String
    var subtitle: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            VStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(isSelected ? .white : .black)
                
                Text(subtitle)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(isSelected ? .white : .black)
                    .padding(10)
                    .background(isSelected ? Color.black : Color.clear)
                    .clipShape(Circle())
            }
            .padding(8)
        }
        .frame(width: 80, height: 80)
        .background(isSelected ? Color.gray : Color.white)
        .cornerRadius(20)
    }
}

//MARK: 오늘의 공부 뷰
struct DailyStudyView: View {
    var body: some View {
        @State var firstText: String = "관련 내용들"
        
        VStack {
            VStack(alignment: .leading) {
                Text("공부해야 하는 주제는")
                    .font(.subheadline)
                    .padding(.bottom, 2)
                
                Text("SQL기본 - 해당 주제 제목")
                    .font(.headline)
                    .padding(.bottom, 10)
                
                Divider().background(Color.black).frame(height: 10)
                
                Text("해당 주제")
                    .font(.headline)
                    .padding(.bottom, 2)
                
                TextEditor(text: $firstText)
                    .font(.headline)
                    .frame(height: 130)
                    .padding(.bottom, 2)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(20)
            
            Spacer()
        }
        .padding()
    }
}
// MARK: 학습하러가기 버튼
struct DailyStudyButtonView: View {
    var body: some View {
        Button(action: {
            // 버튼 클릭 시 실행할 동작
        }) {
            Text("학습하러 가기")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
        }
        .frame(height: 50)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding(.horizontal)
    }
}

// MARK: 오답노트 및 테스트 모의고사  버튼
struct ReviewTestExamButtonView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // 버튼 클릭 시 실행할 동작
                }) {
                    VStack(alignment: .leading) {
                        Text("오답노트 모아보기")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 10)
                        
                        Text("틀렸던 문제를 다시 복습해요!")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .frame(height: 80)
                .padding(.horizontal)
            }
            
            Spacer().frame(height: 50)
            
            HStack(spacing: 20) {
                Button(action: {
                    // 버튼 클릭 시 실행할 동작
                }) {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text("오늘의 테스트")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 10)
                        
                        Text("실전처럼 준비하기!")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .frame(width: 160, height: 135)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                
                Button(action: {
                    
                }) {
                    VStack(alignment: .leading) {
                        Spacer()
                        
                        Text("모의고사 응시")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 10)
                        
                        Text("실전처럼 준비하기")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        
                        Spacer().frame(height: 10)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .frame(width: 160, height: 135)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            .padding(.horizontal) // 전체 여백 설정
        }
    }
}

#Preview {
    MainPageView()
}
