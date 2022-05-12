//
//  SignupModel.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/13.
//

import Foundation

struct SignUpResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: IdData?
}

struct IdData: Codable {
    let id: Int
}
