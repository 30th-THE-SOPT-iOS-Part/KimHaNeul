//
//  StoryModel.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/05.
//

import Foundation

struct StoryModel {
    let userProfileimageName: String
    let userName: String
}
extension StoryModel {
    static let sampleStory: [StoryModel] = [
        StoryModel(userProfileimageName: "avatar1", userName: "avatar1"),
        StoryModel(userProfileimageName: "avatar2", userName: "avatar2"),
        StoryModel(userProfileimageName: "avatar3", userName: "avatar3"),
        StoryModel(userProfileimageName: "avatar4", userName: "avatar4"),
        StoryModel(userProfileimageName: "avatar5", userName: "avatar5"),
        StoryModel(userProfileimageName: "avatar6", userName: "avatar6"),
        StoryModel(userProfileimageName: "avatar1", userName: "avatar1"),
        StoryModel(userProfileimageName: "avatar2", userName: "avatar2"),
        StoryModel(userProfileimageName: "avatar3", userName: "avatar3"),
        StoryModel(userProfileimageName: "avatar4", userName: "avatar4"),
        StoryModel(userProfileimageName: "avatar5", userName: "avatar5"),
        StoryModel(userProfileimageName: "avatar6", userName: "avatar6")
    ]
}
