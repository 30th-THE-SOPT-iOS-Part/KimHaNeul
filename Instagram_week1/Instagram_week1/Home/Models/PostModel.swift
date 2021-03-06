//
//  content.swift
//  Instagram_week1
//
//  Created by κΉνλ on 2022/05/05.
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
        PostModel(userProfileimageName: "avatar1", userName: "avatar1", postImageName: "postImage1", likedCount: 30, content: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", commentCount: 24),
        PostModel(userProfileimageName: "avatar2", userName: "avatar2", postImageName: "postImage2", likedCount: 30, content: "β° ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ", commentCount: 330),
        PostModel(userProfileimageName: "avatar3", userName: "avatar3", postImageName: "postImage3", likedCount: 22, content: "π± λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€. ", commentCount: 25),
        PostModel(userProfileimageName: "avatar4", userName: "avatar4", postImageName: "postImage4", likedCount: 200, content: "π± λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€. ", commentCount: 32)
    ]
}
