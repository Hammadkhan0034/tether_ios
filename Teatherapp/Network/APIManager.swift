//
//  APIManager.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    static let shared = APIManager()
    
    class func headers() -> HTTPHeaders {
        var headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json",
        ]
        
        if let authToken = Constant.sharedInstance.bearerToken{
            headers["Authorization"] = "Bearer \(authToken)"
        }
        
        return headers
    }
    
    func requestGET(url: String,
                    parameter: NSDictionary = [:],
                    header: HTTPHeaders? = nil,
                    completionHandler: @escaping (_ result: Data?, _ error: String?) -> Void) {
        
        //MARK: check internet connection here
        if !isNetworkReachable() {
            completionHandler(nil,Constant.NO_INTERNET)
            return
        }
        
        AF.request(url,
                   method: .get,
                   encoding: URLEncoding.default,
                   headers: header)
        .validate(statusCode: 200..<505)
        .responseData { response in
            switch response.result {
            case .success:
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200, 201:
                        completionHandler(response.data,nil)
                    case 400...403:
                        let bodyMessage = response.data.map { String(decoding: $0, as: UTF8.self) } ?? ""
                        completionHandler(nil,bodyMessage)
                    case 500:
                        completionHandler(nil,Constant.INTERNAL_SERVER_ERROR)
                    case 502 ... 504:
                        completionHandler(nil,Constant.SERVER_BUSY_ERROR)
                    default:
                        completionHandler(response.data,nil)
                    }
                }
            case .failure(let error):
                if error._code == NSURLErrorTimedOut {
                    completionHandler(nil, Constant.REQUEST_TIMEOUT)
                }
            }
        }
    }
    
    func requestPOST(url: String,
                     parameter: [String: Any]?,
                     method: HTTPMethod = .post,
                     header: HTTPHeaders? = nil,
                     completionHandler: @escaping (_ result: Data?, _ error: String?) -> Void) {
        
        //MARK: check internet connection here
        if !isNetworkReachable() {
            completionHandler(nil,Constant.NO_INTERNET)
            return
        }
        
        AF.request(url,
                   method: .post,
                   parameters: parameter,
                   encoding: URLEncoding.default,
                   headers: header)
        
        .validate(statusCode: 200..<505)
        .responseData { response in
            switch response.result {
            case .success:
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200, 201:
                        completionHandler(response.data,nil)
                    case 400...404:
                        let bodyMessage = response.data.map { String(decoding: $0, as: UTF8.self) } ?? ""
                        
                        completionHandler(nil,bodyMessage)
                    case 500:
                        completionHandler(nil,Constant.INTERNAL_SERVER_ERROR)
                    case 502 ... 504:
                        completionHandler(nil,Constant.SERVER_BUSY_ERROR)
                    default:
                        completionHandler(response.data,nil)
                    }
                }
            case .failure(let error):
                completionHandler(nil,error.localizedDescription)
            }
        }
    }
    
    func requestDELETE(url: String,
                       method: HTTPMethod = .post,
                       header: HTTPHeaders? = nil,
                       completionHandler: @escaping (_ result: Data?, _ error: String?) -> Void) {
        
        //MARK: check internet connection here
        if !isNetworkReachable() {
            completionHandler(nil,Constant.NO_INTERNET)
            return
        }
        
        AF.request(url,
                   method: .post,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: header)
        .validate(statusCode: 200..<505)
        .responseJSON { (response) in
            switch response.result {
            case .success:
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200, 201:
                        completionHandler(response.data,nil)
                    case 400:
                        completionHandler(response.data,nil)
                    case 500, 501, 502:
                        completionHandler(nil,Constant.INTERNAL_SERVER_ERROR)
                    default:
                        completionHandler(response.data,nil)
                    }
                }
            case .failure(let error):
                completionHandler(nil,error.localizedDescription)
            }
        }
    }
    
    
    // MARK: - Upload Requests
    func requestUPLOAD(url: String,
                       method: HTTPMethod,
                       header: HTTPHeaders? = nil,
                       formData: @escaping (MultipartFormData) -> Void,
                       progress: @escaping (_ progress: CGFloat) -> Void,
                       completion: @escaping (_ response: Data?, _ error: Error?) -> Void) {
        
        //MARK: check internet connection here
        if !isNetworkReachable() {
            completion(nil, Constant.NO_INTERNET as? Error)
            return
        }
        
//        AF.upload(multipartFormData: formData, to: url, method: method, headers: header, encodingCompletion: { (response) in
//            self.handleUploadResponse(response, progress: progress, completion: completion)
//        })
    }
    
//    func handleUploadResponse(_ response: SessionManager.MultipartFormDataEncodingResult, progress:@escaping (_ progress: CGFloat) -> Void, completion: @escaping (_ response: Data?, _ error: Error?) -> Void) {
//        switch response {
//        case .success(let request, _, _):
//            
//            request.uploadProgress(closure: { (progressObject) in
//                let percentage = CGFloat(progressObject.completedUnitCount) / CGFloat(progressObject.totalUnitCount)
//                progress(percentage)
//            })
//            
//            request.responseJSON(completionHandler: { (response) in
//                print("Upload Response JSON Result: \(response.result)")
//                print("Upload Response JSON: \(response)")
//                print("Upload Response JSON Data: \(String(describing: response.data))")
//                completion(response.data, response.error)
//            })
//            
//        case .failure(let error):
//            completion(nil, error)
//        }
//    }
    
    func isNetworkReachable() -> Bool {
        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: "www.google.com")
        return reachabilityManager!.isReachable
    }
}
