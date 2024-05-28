//
//  Onbording.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/28.
//

import Foundation

struct SelectableBox: Hashable, Identifiable {
    var id = UUID() 
    var title: String
    var isSelected: Bool = false

}
//struct SelectableBox: Hashable, Equatable {
//    var title: String
//    var isSelected: Bool
//    var action: () -> Void
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(title)
//        hasher.combine(isSelected)
//    }
//    
//    static func == (lhs: SelectableBox, rhs: SelectableBox) -> Bool {
//        return lhs.title == rhs.title && lhs.isSelected == rhs.isSelected
//    }
//}
