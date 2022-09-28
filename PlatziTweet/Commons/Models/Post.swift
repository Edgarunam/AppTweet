//
//  Post.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import Foundation
struct Post:Codable{
    let id:Int
    let author:User
    let imageUrl:String
    let text:String
    let videoUrl:String
    let location:PostLocation
    let hasVideo:Bool
    let hasImage:Bool
    let hasLocation:Bool
    let createdAt:String
}
