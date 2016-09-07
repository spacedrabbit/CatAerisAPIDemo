//: ----------------------------------------------------
//: ## APIs
//: ----------------------------------------------------
/*:
 ### Intro (Instructor)
 - callout(Instructor:): Begin by posing the question: **How many weather apps do you think there are in the app store?**
 
 I’d wager there must be in the thousands, at least. Some of those apps have entire teams dedicated to building the app, while some of them are a single person; a person who might have just done it as a weekend project. And despite the great variety of apps made, all of their data is relatively consistent.
 
 But where are those developer teams, large and small, getting their weather data? I mean here you have 1000’s of different apps and they all have the same data set. How are they able to all present the same information?
 
 The answer: from an API (Application Programming Interface)
 
 An API is a digital middleman - delivering data from some service as long as you ask for it in the right way. In this case, all of these apps are asking a weather API for data on the weather. In a broad sense **An API is a standard set of requests and responses that allows software to communicate.** And it is not just iOS apps that use API's: websites use them, Android devices use them, and computers use them. 
 
 When iOS developers talk about API's we usually mean one of two things: 
 1. Any library used to do a specific function in an app (for example CoreData could be considered a native iOS API for data storage... note sub any example here that the students will know)
 2. A REST API that is used to communicate with some service on the web, (like a weather API!)
 
 
 ----
 #### JSON (explained)
 Since there is a wide possibility of devices that use API's, there needs to be a standard for how they can all communicate effectively. The most common format in use is JSON (Javascript Object Notation). JSON defines how the data returned from an API will be formatted, and it is at its core just a dictionary. How exactly that dictionary's key/value pairs are returned is up to the API. This is what we mean when we say that an API defines it's data response. 
 
- callout(Instructor:): Go into Chrome and plug in the URL http://maps.googleapis.com/maps/api/geocode/json

To get a sense of what JSON looks like, and how its used, let's go ahead and navigate to: http://maps.googleapis.com/maps/api/geocode/json
 
!["alt text"](googleMapsAPI.png)

Not an exciting result, but there's way more here than you might initially expect. For one, we see that the page is essentially a dictionary with three keys, `error_message, results, and status`. Why those three keys, and how can we know to expect them? And moreover, how did we know to go to that URL to even try this out?
 
 
 ----
 #### API Documentation
 As mentioned before, API's define a standard for how software can communicate. Meaning that they define the kinds of *requests* that can be made to them, along with the *response* they will return. JSON defines the structure and syntax of the request/response, but its up to the API as to what should be included in a request and what could be included in the response. 
 
 All APIs will provide documentation on exactly what they expect in a request, and what they will return in a response. 
 
 ![](error_message.png)
 ![](status_codes.png)
 
 - callout(Instructor:): Switch out to Chrome and plug in the URL: https://developers.google.com/places/web-service/search and scroll down the "Search" section
 
 The above is just an example to give background to the JSON response we got earlier. If we check out https://developers.google.com/places/web-service/search we'll be able to see every possible request and response that can be made by the API.
 
 ----
 
 #### Trying out the API
 So looking at this particular request, we see we're getting back an error. And judging by the APIs documentation, this is expected. Fortunately in the event of a bad request to an API, it is possible that the API returns a response with helpful error messages regarding what was bad about the request. In this case, we made an "invalid request" because we didn't include some additional information it was expecting to get along with the request. This additional information passed along with a request is called **parameters**.
 
 >> Info on parameters
 >> Example: show demo on adding the "address" key along with a "value" of the address of C4Q
 >> Review the results briefly and show how the results differ from the previous bad request
 >> Explain that all of these results are listed in the API's documentation for this kind of response, so we will always know what to expect. 

 >> Plugging away in a webbrowser is a lightweight way to test out an API, but we can get some real power by using some utilities specifically meant for making API requests

 -----
 
 #### Postman (https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en)
 
 - callout(Instructor:):
 */

import Foundation

var str = "Hello, playground"

//: [Next](@next)
