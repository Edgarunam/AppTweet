//
//  PostRequest.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import Foundation
struct PostRequest:Codable{
    let text:String
    let imageUrl:String?
    let videoUrl:String?
    let location: PostRequestLocation?
    
}
