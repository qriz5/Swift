//
//  ExamView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import SwiftUI

struct ExamView: View {
        var body: some View {
            VStack {
                ExamTitleView()
                Spacer()
                ExamMainView()
                Spacer()
                ExamButtonView()
            }
            .padding()
            .background(Color.gray.opacity(0.1))
        }
}
// MARK: TestTitleView
struct ExamTitleView : View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Spacer().frame(height: 25)
                Text("배운 내용을 기반으로.")
                    .font(.system(size: 19))
                HStack(spacing: 0){
                    Text("실제같은 모의고사")
                        .font(.system(size: 20, weight: .bold))
                    Text("를 풀어봐요")
                        .font(.system(size: 19))
                }
            }
            Spacer()
        }
    }
}

// MARK: TestMainView
struct ExamMainView: View {
    let questions: [QuestionItem] = [
        QuestionItem(numberOfQuestions: 10, conceptName: "데이터의 모델링의 이해"),
        QuestionItem(numberOfQuestions: 40, conceptName: "SQL 기본 및 활용")
    ]

    var body: some View {
        VStack(spacing: 10) {
            Spacer().frame(height: 7)
            ForEach(questions) { item in
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(item.numberOfQuestions)문항")
                        .font(.system(size: 11))
                        .frame(width: 35)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    
                    HStack {
                        Text(item.conceptName)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(item.numberOfQuestions * 2)")
                            .frame(alignment: .trailing)
                    }
                    .padding(4)
                }

            }
            Spacer().frame(height: 7)
            Divider()
            Spacer().frame(height: 7)
            VStack(alignment: .leading, spacing: 5) {
                Text("문항")
                    .font(.system(size: 11))
                    .frame(width: 35)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                HStack {
                    Text("계")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("100")
                        .frame(alignment: .trailing)
                }
                .padding(4)
            }
            Text("모의고사는 전체 문제를 기준으로 제한시간이 측정됩니다.")
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        

    }
}

// MARK: TestButtonView
struct ExamButtonView : View {
    var body: some View {
        Button(action: {
        }) {
            Text("모의고사 응시하기")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(5.0)
        }
    }
}

// 임시
struct QuestionItem: Identifiable {
    let id = UUID()
    let numberOfQuestions: Int
    let conceptName: String
}

#Preview {
    ExamView()
}
