//
//  LoginResponse.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import Foundation

struct LoginResponese: Codable {
    let user: User
    let token: String
}
