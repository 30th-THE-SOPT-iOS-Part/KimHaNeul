//
//  APIConstants.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/13.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    // loginURL = "http://13.124.62.236/auth/signin"
    static let loginURL = baseURL + "/auth/signin"
    
    // signUpURL = "http://13.124.62.236/auth/signup"
    static let signUpURL = baseURL + "/auth/signup"
}
