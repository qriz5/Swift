//
//  OnboardingViewModel.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/27.
//

import Foundation
import SwiftUI

class OnboardingViewModel : ObservableObject {
    
}

class SelectBoxViewModel: ObservableObject {
    @Published private(set) var selectedItems: [String] = []
    @Published var items: [SelectableBox] = [
        SelectableBox(title: "항목 1"),
        SelectableBox(title: "항목 2"),
        SelectableBox(title: "항목 3"),
        SelectableBox(title: "항목 4"),
        SelectableBox(title: "항목 5"),
        SelectableBox(title: "항목 6"),
        SelectableBox(title: "항목 7"),
        SelectableBox(title: "항목 8"),
        SelectableBox(title: "항목 9"),
        SelectableBox(title: "항목 9"),
        SelectableBox(title: "항목 10")
    ]
    
    var chunkedItems: [[SelectableBox]] {
        items.chunked(into: 3)
    }
    
//    func toggleSelection(of item: SelectableBox) {
//        if let index = items.firstIndex(of: item) {
//            items[index].isSelected.toggle()
//        }
//    }
    func toggleSelection(of item: SelectableBox) {
        if let index = items.firstIndex(of: item) {
            items[index].isSelected.toggle()
            if items[index].isSelected {
                // 만약 항목이 선택되었다면, 해당 항목의 제목을 selectedItems에 추가합니다.
                selectedItems.append(item.title)
            } else {
                // 만약 항목이 선택 해제되었다면, selectedItems에서 해당 항목의 제목을 제거합니다.
                selectedItems.removeAll(where: { $0 == item.title })
            }
        }
    }
    
    func sendSelectedItemsToAPI() {
        // 여기에 API 호출 및 데이터 전송 로직을 추가하세요.
        print("Selected items: \(selectedItems)")
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
