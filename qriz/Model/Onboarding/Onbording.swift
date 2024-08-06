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
