//
//  OnboardingView.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/27.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            
            Spacer().frame(height: 100)
            
            OnboardingTitleView()
            
            Spacer().frame(height: 25)
            
            SelectBoxView()
            
            Spacer()
            
            selectedButtonView()
        }
        
        
        

    }
}

// MARK: -OnboardingView 타이틀 뷰
private struct OnboardingTitleView: View {
    @EnvironmentObject private var onboardingViewModel: OnboardingViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("아는 개념을 체크해주세요!")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                Spacer().frame(height: 5)
                Text("체크하신 결과를 토대로")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
                Text("추후 진행할 테스트의 레벨이 조정됩니다!")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}


// MARK: -select Box 뷰
struct SelectBoxView: View {
    @StateObject private var selectBoxViewModel = SelectBoxViewModel()

    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                ForEach(selectBoxViewModel.chunkedItems, id: \.self) { rowItems in
                    HStack(spacing: 10) {
                        ForEach(rowItems) { item in
                            SelectableBoxView(item: item, action: {
                                selectBoxViewModel.toggleSelection(of: item)
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 470)
    }
}

struct SelectableBoxView: View {
    let item: SelectableBox
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack(alignment: .topTrailing) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray)
                    .cornerRadius(5.0)

                if item.isSelected {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.green)
                        .padding(8)
                } else {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                        .padding(8)
                }
            }
        }
    }
}

// MARK: -Button 뷰
struct selectedButtonView : View {
    @StateObject private var selectBoxViewModel = SelectBoxViewModel()

    var body: some View {

        Button(action: {
            print("선택완료 버튼 클릭됨")
            selectBoxViewModel.sendSelectedItemsToAPI()
        }) {
            Text("선택완료")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray)
                .cornerRadius(5.0)
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        
    }
}
#Preview {
    OnboardingView()
}
