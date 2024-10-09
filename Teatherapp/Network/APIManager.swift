//
//  APIManager.swift
//  Teatherapp
//
//  Created by Muhammad Qayyum on 20/10/2023.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit

class APIManager {
    
    static let shared = APIManager()
    private let baseURL = "https://tether.mydispatchapp.com/V2/services/"
    
    
    func headers() -> HTTPHeaders {
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
        return Alamofire.NetworkReachabilityManager(host: "www.google.com")?.isReachable ?? false
    }
    
    
    func post(endpoint: String,
              parameter: [String: Any]?,
              header: HTTPHeaders? = nil,
              completed: @escaping (Result<Data?,ApiErrorModel>) -> Void) {
        
        //MARK: check internet connection here
        if !isNetworkReachable() {
            completed(.failure(ApiErrorModel(status: "0", errorType: .noInternet, message: Constant.NO_INTERNET)))
            return
        }
        
        AF.request(baseURL + endpoint,
                   method: .post,
                   parameters: parameter,
                   encoding: URLEncoding.default,
                   headers: header)
        //        .validate(statusCode: 200..<505)
        .responseData { response in
            switch response.result {
            case .success:
                if let httpStatusCode = response.response?.statusCode {
                    switch(httpStatusCode) {
                    case 200, 201:
                        do{
                            print("here is the data : \(response.data!)")
                            
                            let decodedResponse = self.getResponseModel(data: response.data!)
                            if(decodedResponse.status == "0"){
                                completed(.failure(ApiErrorModel(status: "0", errorType: .invalidData, message: decodedResponse.message)))
                                return
                            }
                            
                            print("aaaaaaaaaaaaaa");
                            completed(.success(response.data!))
                            return
                            
                        }
                        catch{
                            print("Error decoding request response")
                            completed(.failure(ApiErrorModel(status: "0", errorType: .invalidData, message: "Got invalid data from the server")))
                            return
                        }
                        
                    case 400...404:
                        let bodyMessage = response.data.map { String(decoding: $0, as: UTF8.self) } ?? ""
                        completed(.failure(ApiErrorModel(status: String(httpStatusCode), errorType: .invalidStatusCode(description: bodyMessage), message: bodyMessage)))
                        return
                        
                    case 500:
                        completed(.failure(ApiErrorModel(status: String(httpStatusCode), errorType: .invalidStatusCode(description: Constant.INTERNAL_SERVER_ERROR), message: Constant.INTERNAL_SERVER_ERROR)))
                        return
                    case 502 ... 504:
                        completed(.failure(ApiErrorModel(status: String(httpStatusCode), errorType: .invalidStatusCode(description: Constant.SERVER_BUSY_ERROR), message: Constant.SERVER_BUSY_ERROR)))
                        return
                        
                        
                    default:
                        completed(.failure(ApiErrorModel(status: "", errorType: .defaultError, message: "Something went wrong. Please try again")))
                    }
                }
            case .failure(let error):
                completed(.failure(ApiErrorModel(status: "", errorType: .unknownError(error: error), message: error.localizedDescription)))
                return
                
            }
        }
    }
    
    
    func postAsync(endpoint: String,
                   parameter: [String: Any]?,
                   header: HTTPHeaders? = nil) async throws -> ApiResponseModel{
        
        if !isNetworkReachable() {
            return ApiResponseModel(status: "0", message: "No internet connection. Please connect to internet and try again.")
        }
        
        do {
            
            let request = AF.request(baseURL + endpoint,
                                     method: .post,
                                     parameters: parameter,
                                     encoding: URLEncoding.default,
                                     headers: header)
            
            let response =  await request.serializingData().response
            //            let (data , _) = try await URLSession.shared.data(for: request)
            guard let data = response.data else{
                
                return ApiResponseModel(status: "0", message: response.error?.localizedDescription ?? "Unknow error occured \(endpoint)")
            }
            
            
            return getResponseModel(data: data)
        }
        catch(let error){
            print(error.localizedDescription)
            print(endpoint)
            return ApiResponseModel(status: "0", message: error.localizedDescription + endpoint)
        }
        
    }
    
    func getResponseModel(data:Data) -> ApiResponseModel{
        do{
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            let dict = json as! [String: Any]
            let apiResponseModel = ApiResponseModel(status: dict["status"]! as! String, message: dict["message"]! as! String, data: dict["data"] as? [String:Any] )
            return apiResponseModel
        }
        catch(let error){
            print("parsing error while converting data to api response model \(error)")
            return ApiResponseModel(status: "0", message: "Exception while parsing response from the server")
        }
    }
    
}




enum ApiErrors{
    case invalidUrl
    case jsonParsingError(description: String)
    case noInternet
    case errorFindingEndpoint(endpoint: String)
    case invalidData
    case jsonParsingFailure
    case requesFailed(description: String)
    case invalidStatusCode(description: String)
    case unknownError(error: Error)
    case defaultError
    
    var customDescriptionString: String{
        switch self {
        case .invalidUrl:
            return "Invalid URL"
        case .noInternet:
            return "No internet connection available"
        case let .errorFindingEndpoint(endpoint):
            return "Endpoint \(endpoint) does not exists"
        case .invalidData:
            return "Invalid Data"
        case .jsonParsingFailure:
            return "Failed to parse JSON"
        case let .requesFailed(description):
            return "Request Failed: \(description)"
        case let .invalidStatusCode(description):
            return "Invalid status code: \(description)"
        case let .unknownError(error):
            return "Unknown error: \(error.localizedDescription)"
        case .defaultError:
            return "Something went wrong please try again"
        case let .jsonParsingError(description):
            return "Invalid params : \(description)"
        }
    }
}
