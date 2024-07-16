//
//  User.swift
//  qriz
//
//  Created by mimi_0_0 on 2024/07/16.
//

import Foundation

struct User {
    var id: String
    var name: String
    var phoneNumber: String?
    var profileURL: String?
    var desciption: String?
}
extension User {
    func toObject() -> UserObject {
        .init(
            id: id,
            name: name,
            phoneNumber: phoneNumber,
            profileURL: profileURL,
            desciption: desciption
        )
    }
}
