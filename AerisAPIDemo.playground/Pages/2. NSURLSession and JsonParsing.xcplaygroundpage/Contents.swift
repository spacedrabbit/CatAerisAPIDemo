//: [Previous](@previous)

import Foundation
import UIKit
import XCPlayground

let catInstaEndpoint: NSURL = NSURL(string: "https://api.myjson.com/bins/254uw")! // again, be careful with force unwraps
// same exact data as before, but hosted on the web via myjson!


// STEP 1 - Intro to NSURLSession
func makeInstaCatRequest() {
  
  // 1. every request begins with a session, which is used to configure blah blah... (add info)
  let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
  session.dataTaskWithURL(catInstaEndpoint) { (data: NSData?, response: NSURLResponse?, error: NSError?) in
    // 1. why all optional? well, you might not get data back if the request is bad, you might not get a response if the internet is down (is this true? not sure when you wouldnt get a response,), and you might not get an error is everything goes right
    
    // 2. check for errors first
    if error != nil {
      print("Error encountered!: \(error!)")
    }
    
    // 3. check for returned data
    if let validData: NSData = data {
      // 3. we could print out the data here, but its not going to be of much use as encoded bits...
      print(validData)
      
      // 5. Ok now we have data... presumably JSON. But how do we get it out now.... *sly wink*
      let allTheCats: [InstaCat]? = InstaCatFactory.createCatsFromData(validData)
      if allTheCats != nil {
        for cat in allTheCats! {
          print(cat.description)
        }
      }
    }
    }.resume() // 4. Easily forgotten, but we need to call resume to actually launch the task
  
}

// 1. setup
//XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
//makeInstaCatRequest()
