//
//  LoginModel.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/13.
//

import Foundation

struct LoginResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: LoginData?
}

struct LoginData: Codable {
    let name: String
    let email: String
}
