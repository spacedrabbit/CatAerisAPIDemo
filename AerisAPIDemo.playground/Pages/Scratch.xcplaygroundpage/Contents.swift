//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


internal struct AerisURL {
  internal static let BaseURL: String = "https://api.aerisapi.com"
  internal static let ClientID: String = "aqwGb7NoFkJReYGPvZsRb"
  internal static let ClientSecret: String = "CCX6wXXefNwT6AjYYHlebF9SSZkUA59Q7eG6ZmgQ"
  
  internal struct Endpoints {
    internal static let Forecasts: String = "/forecasts"
  }
  
  internal static func formattedURL(forEndpoint endpoint: String) -> String {
    return AerisURL.BaseURL + endpoint + "/55415?" + AerisURL.authenticationParams()
  }
  
  internal static func authenticationParams() -> String {
    return "client_id=" + AerisURL.ClientID + "&client_secret=" + AerisURL.ClientSecret
  }
}

internal func basicAerisRequest() {
//  guard let aerisEndpoint: NSURL = NSURL(string: AerisURL.formattedURL(forEndpoint: AerisURL.Endpoints.Forecasts)) else {
//    return
//  }
//  guard let aerisEndpoint: NSURL = NSURL(string: "http://dl.dropboxusercontent.com/s/bh0tij9u2tok14h/InstaCats.json?dl=0") else {
//    return
//  }
  guard let aerisEndpoint: NSURL = NSURL(string: "https://api.myjson.com/bins/254uw") else {
    return
  }
  
  
  let session: NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  let task: NSURLSessionDataTask = session.dataTaskWithURL(aerisEndpoint) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    if error != nil {
      print("Error encountered: \(error!)")
    }
    
    if let validData: NSData = data {
      print("valid data returned")
      if let jsonData = try? NSJSONSerialization.JSONObjectWithData(validData, options: []) {
        print("jsonData: \(jsonData)")
      }
    }
    
    if let validResponse: NSURLResponse = response {
      print("Response: \(validResponse)")
    }
  }
  
  task.resume()
}


// Tools
// Simple JSON hosting: http://myjson.com/
// Dropbox how to host Json: http://stackoverflow.com/questions/18520456/ios-hosting-json-file-to-parse-it-using-url
// JSONlinter: http://jsonlint.com/
// NOTE - This kind of request requires that the .needsIndefiniteExecution be true. But be aware that once set, every change to the playground will result in another re-running of the code and thus another hit to the API usage limit
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
basicAerisRequest()



