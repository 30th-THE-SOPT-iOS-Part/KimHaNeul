# [Alamofire](https://github.com/Alamofire/Alamofire) 스터디_하늘
💡 Alamofire 사용 방법을 익히고자 은희, 지민이와 진행한 스터디입니다. 

## ✏️ HTTP Method

---

```swift
public struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    public static let connect = HTTPMethod(rawValue: "CONNECT")
    public static let delete = HTTPMethod(rawValue: "DELETE")
    public static let get = HTTPMethod(rawValue: "GET")
    public static let head = HTTPMethod(rawValue: "HEAD")
    public static let options = HTTPMethod(rawValue: "OPTIONS")
    public static let patch = HTTPMethod(rawValue: "PATCH")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let trace = HTTPMethod(rawValue: "TRACE")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
```

### ✏️ 서버 필요 요소

1. Base URL
2. HTTP Method
3. Path
4. 요청 방식
    1. `Header` 바디 타입 명시
    2. `Parameter` = Body 어떤 구조의
5. 응답 바디(Status Code, Value) 

### ✏️ Request - 요청서 작성

```swift
let dataRequest = 
    AF.request(**url**, // 어디에 있는
            **method**: .post, // 어떻게
            **parameters**: body, // 어떤 형식을
            encoding: JSONEncoding.default, // 넘겨줄 방법
            headers: header // 받아올 컨텐츠의 타입
)
```

1. `URL` 어디에 있는 
    
    ```swift
    // 선언
    struct APIConstants {
        // MARK: - Base URL
        static let baseURL = "http://13.124.62.236"
        
        // MARK: - Feature URL
        // loginURL = "http://13.124.62.236/auth/signin"
        static let loginURL = baseURL + "/auth/signin"
        
        // signUpURL = "http://13.124.62.236/auth/signup"
        static let signUpURL = baseURL + "/auth/signup"
    }
    
    // 호출
    let url = APIConstants.loginURL
    ```
    
2. `HTTP Method` 어떻게 
    
    `post`, `get`, `put`, `delete`
    
3. `JSON` 어떤 모양을 한 것을 
    
    ```swift
    *let body: Parameters = [                                            // HTTP body
                "name": name,
                "email": email,
                "password": password
            ]*
    ```
    

### ✏️ Response

```swift
dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let **statusCode** = response.response?.statusCode else { return }
                guard let **value** = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
```

1. `상태코드` 
2. `메시지` 
3. `데이터`(=value) 
    
    

## ❤️ POST → 수행한다

- 리소스를 생성, 업데이트할 때 사용
- 전송할 데이터를 Body에 담아서 전송
- Body의 길이 제한 없이 데이터 전송 가능(GET은 불가능)
- 요청 body 내용이 눈에 보이지 않음!
- **Non-idempotent**

### ✏️ Request

```swift
let dataRequest = 
    AF.request(**url**, // 어디에 있는
            **method**: .post, // 어떻게
            **parameters**: body, // 어떤 형식을
            encoding: JSONEncoding.default, // 넘겨줄 방법
            headers: header // 받아올 컨텐츠의 타입
)
```

1. Request-Header (요청 헤더)
    
    ```swift
    // 명세서
    Content-Type: application/json
    ```
    
    ```swift
    // 구현
    let header: HTTPHeaders = ["Content-Type" : "application/json"]
    ```
    
2. Request-Parameters (요청 파라미터) : 없음

```json
No parameters
```

```swift
없음
```

1. Request-Body (요청 바디)

```json
// 회원가입, 로그인 요청 json
{
    "name": "김태현2",
    "email": "iOS2@sopt.org",
    "password": "123456"
}
```

```swift
// 회원가입, 로그인 구현
let body: Parameters = [                                            // HTTP body
            "name": name,
            "email": email,
            "password": password
        ]
```

### ✏️ Response

```json
// 회원가입 response json
{
    "status": 201,
    "success": true,
    "message": "회원가입 성공",
    "data": {
        "id": 133
    }
}
```

```swift
// 회원가입 구현
struct SignUpResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: IdData?
}

struct IdData: Codable {
    let id: Int
}
```

```json
// 로그인 response json
{
    "status": 200,
    "success": true,
    "message": "로그인 성공",
    "data": {
        "name": "김태현",
        "email": "iOS@sopt.org"
    }
}
```

```swift
// 로그인 구현
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
```

## ❤️ GET → 가져온다

- 데이터를 읽거나 검색할 때 사용
- 오로지 데이터를 읽을 때만! 수정에는 x
- 요청을 전송할 때 URL 끝에 파라미터로 포함되어 전송→ 이 부분을 쿼리 스트링이라고 부름
    
    **`www.example-url.com/resources?name1=송유현&name2=곽철용`**
    
- **Idempotent**

```swift
let dataRequest = 
    AF.request(url,
             method: .get,
             parameters: nil,
             encoding: URLEncoding.default,
             headers: header )
  
        }
```

### ✏️ Request

1. 요청 헤더
    
    
    ```swift
    Content-Type: application/json
    Accept: application/json
    ```
    
    ```swift
    // 구현
    let header: HTTPHeaders = ["Content-Type" : "application/json", "Accept":"application/json"]
    ```
    
2. 요청 파라미터 (없음)
    
    
3. 요청 바디
    
    ```json
    {
        userId: int,
        carId: int,
        isLiked: boolean,
    }
    
    EX)
    {
        "userId": 1,
        "carId": 2,
        "isLiked": false
    }
    ```
    

### ✏️ Response

```json
{
    "status": 200,
    "success": true,
    "message": "좋아요 상태 변경 성공",
    "data": {
        "carId": 2,
        "isLiked": false
    }
}
```

POST, GET 의 차이

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/6476f7f6-bf80-43a4-9d7c-5e6b47bc8934/Untitled.png)

GET은 **Idempotent : 서버에 동일한 요청을 여러번 전송해도 동일한 응답이 돌아옴**

POST는 **Non-idempotent**
