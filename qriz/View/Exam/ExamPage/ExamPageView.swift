//
//  ExamPageView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/06/14.
//

import SwiftUI

// 목업 데이터 모델
struct ExamQuestion {
    var question: String
    var fingerprint: String
    var options: [String]
}

let sampleQuestions = [
    ExamQuestion(
        question: "다음 중 SQL에서 데이터 정의어(DDL)에 해당하지 않는 것은?",
        fingerprint: "CREATE, ALTER, DROP, SELECT",
        options: ["CREATE", "ALTER", "DROP", "SELECT"]
    ),
    ExamQuestion(
        question: "다음 중 SQL의 데이터 조작어(DML)에 해당하는 것은?",
        fingerprint: "INSERT, UPDATE, DELETE, SELECT",
        options: ["INSERT", "UPDATE", "DELETE", "SELECT"]
    ),
    ExamQuestion(
        question: "다음 중 SQL의 데이터 조작어(DML)에 해당하는 것은?",
        fingerprint: "INSERT, UPDATE, DELETE, SELECT",
        options: ["INSERT", "UPDATE", "DELETE", "SELECT"]
    ),
    ExamQuestion(
        question: "다음 중 SQL의 데이터 조작어(DML)에 해당하는 것은?",
        fingerprint: "INSERT, UPDATE, DELETE, SELECT",
        options: ["INSERT", "UPDATE", "DELETE", "SELECT"]
    )
]

struct ExamPageView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedOptions: [String?] = Array(repeating: nil, count: sampleQuestions.count)
    
    var progress: Double {
        return Double(currentQuestionIndex + 1) / Double(sampleQuestions.count)
    }
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            
            VStack{
                CustomNavigationBar(
                    isDisplayLeftBtn: true,
                    isDisplayRightBtn: false,
                    isCenterTitle: false,
                    centerTitleType: .chpw
                )
                
                ExamProgressBar(value: progress)
                VStack(alignment: .leading, spacing: 20) {
                    
                    ExamPGTitleView(question: sampleQuestions[currentQuestionIndex].question)
                    ExamPGFingerprintView(fingerprint: sampleQuestions[currentQuestionIndex].fingerprint)
                    ExamPGSelectView(
                        options: sampleQuestions[currentQuestionIndex].options,
                        selectedOption: $selectedOptions[currentQuestionIndex]
                    )
                }
                .padding()
                Divider()
                VStack {
                    ExamPGButtonView(
                        currentQuestionIndex: $currentQuestionIndex,
                        totalQuestions: sampleQuestions.count,
                        selectedOptions: $selectedOptions
                    )
                }
            }
        }
    }
}


// MARK: 문제 뷰
struct ExamPGTitleView : View {
    let question: String
    
    var body: some View {
        Text(question)
            .font(.system(size: 18))
            .padding()
    }
}

// MARK: 문제 지문뷰
struct ExamPGFingerprintView : View {
    let fingerprint: String
    
    var body: some View {
        VStack{
            Text(fingerprint)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 1)
    }
        
}

// MARK: 정답 선택 뷰
struct ExamPGSelectView: View {
    let options: [String]
    @Binding var selectedOption: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(options.enumerated()), id: \.element) { index, option in
                HStack {
                    Image(systemName: selectedOption == option ? "\(index + 1).circle.fill" : "\(index + 1).circle")
                    Text(option)
                        .padding()
                    Spacer()
                }
                .onTapGesture {
                    selectedOption = option
                }

                .padding(.horizontal)
                .frame(height: 40)
                .background(selectedOption == option ? Color.blue.opacity(0.2) : Color.clear)
                .background(Color.white)
                .cornerRadius(5)
                .cornerRadius(5)
                
            }
        }

    }
}

// MARK: 선택뷰
struct ExamPGButtonView : View {
    @Binding var currentQuestionIndex: Int
    let totalQuestions: Int
    @Binding var selectedOptions: [String?]
    
    var body: some View {
        
        HStack {
            Button(action: {
                if currentQuestionIndex > 0 {
                    currentQuestionIndex -= 1
                }
            }) {
                Text("이전")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            .disabled(currentQuestionIndex == 0)
            
            Spacer()
            
            Text("\(currentQuestionIndex + 1) / \(totalQuestions)")
                .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: {
                if currentQuestionIndex < totalQuestions - 1 {
                    currentQuestionIndex += 1
                }
            }) {
                Text("다음")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(currentQuestionIndex == totalQuestions - 1)
        }
        .padding()
    }
}


#Preview {
    ExamPageView()
}
