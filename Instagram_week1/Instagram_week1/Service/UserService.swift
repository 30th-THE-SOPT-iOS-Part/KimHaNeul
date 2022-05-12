//
//  UserService.swift
//  Instagram_week1
//
//  Created by 김하늘 on 2022/05/13.
//

import Foundation
import Alamofire

class UserService {
    // 싱글톤 변수(Singleton)
    //
    static let shared = UserService()
    
    private init() {}
    
    func signUp(name: String,
                email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.signUpURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value, purpose: .singUp)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }
    func login(name: String,
               email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.loginURL                                     // URL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]     // HTTP Headers
        let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        // 서버 통신 시작 - Request 시작
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value, purpose: .login)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 상태 코드와 값(value, data)를 가지고 통신의 결과를 핸들링하는 함수입니다.
    private func judgeStatus(by statusCode: Int, _ data: Data, purpose: Purpose) -> NetworkResult<Any> {
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200...299: return isVaildData(data: data, purpose: purpose)
        case 400...499: return .pathErr
        case 500...599: return .serverErr
        default: return .networkFail
        }
    }
    
    // 성공 시 넘겨받은 데이터를 decode하는 함수입니다.
    // 이 때 우리가 codable을 채택해서 만들어 놓은 구조체 형식의 데이터 모델을 사용합니다.
    private func isVaildData(data: Data, purpose: Purpose) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        switch purpose {
        case .login:
            guard let decodedData = try? decoder.decode(LoginResponse.self, from: data)
            else { return .pathErr }
            return .success(decodedData as Any)

        case .singUp:
            guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data)
            else { return .pathErr }
            return .success(decodedData as Any)
        }
        
    }
}
