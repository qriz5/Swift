//
//  Path.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/05/23.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}

// 간단한 PathModel 정의
class PathModelSign: ObservableObject {
    @Published var paths: [String] = []
}
