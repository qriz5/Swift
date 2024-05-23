//
//  CustomNavigationBar.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    let isDisplayLeftBtn: Bool
    let isDisplayRightBtn: Bool
    let isCenterTitle: Bool
    let leftBtnAction: () -> Void
    let rightBtnAction: () -> Void
    let centerTitleType: NavigationTitleType
    
    init(
        isDisplayLeftBtn: Bool = true,
        isDisplayRightBtn: Bool = true,
        isCenterTitle: Bool = true,
        leftBtnAction: @escaping () -> Void = {},
        rightBtnAction: @escaping () -> Void = {},
        centerTitleType: NavigationTitleType = .close
    ) {
        self.isDisplayLeftBtn = isDisplayLeftBtn
        self.isDisplayRightBtn = isDisplayRightBtn
        self.isCenterTitle = isCenterTitle
        self.leftBtnAction = leftBtnAction
        self.rightBtnAction = rightBtnAction
        self.centerTitleType = centerTitleType
    }
    var body: some View {
        HStack {
            if isDisplayLeftBtn {
                Button (
                    action: leftBtnAction,
                    label: { Image("leftArrow") }
                )
            }
            Spacer()
            
            if isCenterTitle {
                Text(centerTitleType.rawValue)
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            Spacer()
            
            if isDisplayRightBtn {
                Image("")
                    .resizable()
                    .frame(width: 24, height: 24) // Adjust width and height as needed
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 20)
    }
}

#Preview {
    CustomNavigationBar()
}
