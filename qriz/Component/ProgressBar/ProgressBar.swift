//
//  ProgressBar.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/30.
//

import SwiftUI

// MARK: - Progress Bar View
struct ProgressBar: View {
    let steps: [SignUpStep]
    let currentStep: SignUpStep
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(steps.indices, id: \.self) { index in
                    Rectangle()
                        .fill(index <= steps.firstIndex(of: currentStep) ?? 0 ? Color.gray.opacity(0.5): Color.gray.opacity(0.1))
                        .frame(width: geometry.size.width / CGFloat(steps.count))
                }
            }
        }
        .frame(height: 4)
        .background(Color.gray.opacity(0.1)) // Light gray background
    }
}
