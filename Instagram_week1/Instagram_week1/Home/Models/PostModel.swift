//
//  content.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/05.
//

import Foundation

struct PostModel {
    let userProfileimageName: String
    let userName: String
    let postImageName: String
    let likedCount: Int
    let content: String
    let commentCount: Int
}

extension PostModel {
    static let samplePost: [PostModel] = [
        PostModel(userProfileimageName: "avatar1", userName: "avatar1", postImageName: "postImage1", likedCount: 30, content: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", commentCount: 24),
        PostModel(userProfileimageName: "avatar2", userName: "avatar2", postImageName: "postImage2", likedCount: 30, content: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", commentCount: 330),
        PostModel(userProfileimageName: "avatar3", userName: "avatar3", postImageName: "postImage3", likedCount: 22, content: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다. ", commentCount: 25),
        PostModel(userProfileimageName: "avatar4", userName: "avatar4", postImageName: "postImage4", likedCount: 200, content: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다. ", commentCount: 32)
    
    ]
}
