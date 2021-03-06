
import Foundation
import Alamofire
import Locksmith

struct API {
  static let preferences = Preferences.get()!
  static let parametersName = preferences.parameters!
  static let headers = HTTPHeaders(dictionaryLiteral: (parametersName.token, preferences.token))
  
  static func loadParameters(for funcName: String) -> [String: String] {
    var parameters: [String: String] = [parametersName.a: funcName]
    switch funcName {
    case preferences.newSession:
      return parameters
    default:
      guard let data = Locksmith.loadDataForUserAccount(userAccount: preferences.user) else {return parameters}
      let session = data as! [String: String]
      parameters += session
      return parameters
    }
  }
  
  static func startNewSession(complition: @escaping () -> (), failureComplition: @escaping (_ error: Error)->())  {
    guard Locksmith.loadDataForUserAccount(userAccount: preferences.user) == nil else {return}
    Alamofire.request(preferences.url, method: .post, parameters: loadParameters(for: preferences.newSession), encoding: URLEncoding.default, headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success:
        guard let responseData = response.data else {return}
        let decoder = JSONDecoder()
        let response = try! decoder.decode(ResponseData.SessionResponse.self, from: responseData)
        do {
          try Locksmith.saveData(data: [parametersName.session : response.data.session], forUserAccount: preferences.user)
        } catch {
          print(error)
        }
        complition()
      case .failure(let error):
        failureComplition(error)
      }
    }
  }
  
  static func getEntries(complition: @escaping ([[Entry]]) -> (), failureComplition: @escaping (_ error: Error)->()) {
    Alamofire.request(preferences.url, method: .post, parameters: loadParameters(for: preferences.getEntries), encoding: URLEncoding.default ,headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success:
        guard let responseData = response.data else {return}
        let decoder = JSONDecoder()
        let response = try! decoder.decode(ResponseData.EntriesResponse.self, from: responseData)
        complition(response.data)
      case .failure(let error):
        failureComplition(error)
      }
    }
  }
  
  static func addEntry(body: String, complition: @escaping () -> (), failureComplition: @escaping (_ error: Error)->()) {
    var parameters = loadParameters(for: preferences.addEntry)
    parameters[parametersName.body] = body
    Alamofire.request(preferences.url, method: .post, parameters: parameters, encoding: URLEncoding.default ,headers: headers).validate().responseJSON { response in
      switch response.result {
      case .success:
        complition()
      case .failure(let error):
        failureComplition(error)
      }
    }
  }
}

extension Dictionary where Key == String, Value == String{
  static func += (left: inout [String:String], right: [String:String]) {
    for (key, value) in right {
      left[key] = value
    }
  }
}
