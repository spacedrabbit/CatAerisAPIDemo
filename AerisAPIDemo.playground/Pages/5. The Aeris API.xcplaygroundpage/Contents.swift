//: ----------------------------------------------------
//: ## The Aeris API
//: ----------------------------------------------------
/*:
   
#### Aeris
Now, one example of a weather API is the Aeris API. I will caution that this API has a lot of options to make requests, and many bits of information in its responses. So, one good trick to have in mind when trying out a new API is to have a specific goal in mind and to work towards it.

The primary way I use weather apps is during the morning when I'm looking for an overview of the day's weather. So let's try to simulate that experience by generating a request that will return today's weather for our current location.
*/
  
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
    guard let aerisEndpoint: NSURL = NSURL(string: AerisURL.formattedURL(forEndpoint: AerisURL.Endpoints.Forecasts)) else {
      return
    }
    
    //: - callout(Instructor:): The take away here is that this is nearly exactly the same as the instaCat example. the differences being how we will ultimately parse out the response since the json response will be much more complex
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
  
  
// NOTE - This kind of request requires that the .needsIndefiniteExecution be true. But be aware that once set, every change to the playground will result in another re-running of the code and thus another hit to the API usage limit
//  XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//  basicAerisRequest()