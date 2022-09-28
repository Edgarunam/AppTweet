//
//  RegisterRequest.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import Foundation
struct RegisterRequest: Codable{
    let  email:String
    let password:String
    let names:String
}
