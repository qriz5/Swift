//
//  TabButton.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/07/09.
//

import Foundation
import SwiftUI

struct TabButton: View {
    let title: String
    @Binding var selectedTab: String
    
    var body: some View {
        VStack {
            Button(action: {
                selectedTab = title
            }) {
                Text(title)
                    .foregroundColor(selectedTab == title ? .black : .gray)
            }
            .padding(.vertical, 8)
            
            if selectedTab == title {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.black)
            } else {
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FilterButton: View {
    let title: String
    var isToggle: Bool = false
    @State private var isSelected = false
    
    var body: some View {
        Button(action: {
            if isToggle {
                isSelected.toggle()
            }
        }) {
            Text(title)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(isToggle && isSelected ? Color.gray.opacity(0.2) : Color.clear)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
        .foregroundColor(.black)
    }
}
