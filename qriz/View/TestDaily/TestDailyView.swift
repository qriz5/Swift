//
//  TestDailyView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/06/13.
//

import SwiftUI

struct TestDailyView: View {
    var body: some View {
        VStack {
            CustomNavigationBar(
                isDisplayLeftBtn: false,
                isDisplayRightBtn: false,
                isCenterTitle: true,
                centerTitleType: .dailystudy
            )
            TestDailyTitle()
            DailyButtonView()
            Spacer().frame(height: 10)
            DailyTestView()
            Spacer().frame(height: 150)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
    }
}
//MARK: titleView
struct TestDailyTitle: View {
    var body: some View{
        VStack(alignment: .leading, spacing: 10) {
            Text("관련된 개념 보러가기")
                .font(.system(size: 20, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    TestDailyView()
}
