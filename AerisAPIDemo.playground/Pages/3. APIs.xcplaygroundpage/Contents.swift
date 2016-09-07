//: ----------------------------------------------------
//: ## APIs
//: ----------------------------------------------------
/*:
 - callout(LESSON OBJECTIVES):
    - Introduce the concept of web based APIs
    - Give examples of popular webservices as being APIs to reinforce their ubiquity
    - Frame using APIs as being able to develop amazing apps that would not be possible on your own or without large development teams
    - (Interactive example) Explain JSON a bit and show how to view some simple JSON using the Maps Geocode API
    - Bring in API documentation as what defines which requests are possible, and what their responses will be
    - (Interactive example) Introduce Postman as a utility for quickly testing APIs
      - Search Geocode API in Postman
 
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
 #### Why do APIs matter
 Firstly, they allow you to develop software faster! The existance of APIs let you perform a variety of tasks that just take way too long to write out yourself. Can you imagine having to write out your own custom `print()` function for every app you create?
 
 In the context of web-based REST APIs, they are how your app is going to talk to the world! There are hundreds of services out there that you might want to develop an app around
    - A messaging app might use Firebase for realtime communication
    - A social media app that aggregates your top tweets will make use of the Twitter API (Fabric)
    - A cloud-based, file storage app may decide to use the Dropbox API for storing, retrieving and editing files
    - Perhaps you have a new take on location-based B2B services, and will make use of the Foursquare API to load local business data
    - Have a way to track pokemon in PokemonGo? Seems like a good place to use the Google Maps API to display live GPS data
 
 Practically, apps can use multiple REST API's to perform complex tasks and create novel experiences for their users. With enough practice and skill, you can even develop your own APIs that other developers will use
 
 ----
 #### JSON (explained)
 Since there is a wide possibility of devices that use API's and many differnt APIs providing unique services, there needs to be a standard for how it can all communicate effectively. The most common format in use is JSON (Javascript Object Notation). JSON defines how the data returned from an API will be formatted, and at its core is just a dictionary. You may even often hear json referred to as a "json dictionary." Though, how exactly that json dictionary's key/value pairs are returned is up to the API. This is what we mean when we say that an API defines it's data response.
 
- callout(Instructor:): Go into Chrome and plug in the (URL)[http://maps.googleapis.com/maps/api/geocode/json]

To get a sense of what JSON looks like, and how its used, let's go ahead and navigate to: http://maps.googleapis.com/maps/api/geocode/json
 
!["alt text"](googleMapsAPI.png)

Not an exciting result, but there's way more here than you might initially expect. For one, we see that the page is essentially a dictionary with three keys, `error_message, results, and status`. Why those three keys, and how can we know to expect them? And moreover, how did we know to go to that URL to even try this out?
 
 
 ----
 #### API Documentation
 As mentioned before, API's define a standard for how software can communicate. Meaning that they define the kinds of *requests* that can be made to them, along with the *response* they will return. JSON defines the structure and syntax of the request/response, but its up to the API as to what should be included in a request and what could be included in the response. 
 
 All APIs will provide documentation on exactly what they expect in a request, and what they will return in a response. 
 
 ![](error_message.png)
 ![](status_codes.png)
 
 - callout(Instructor:): Switch out to Chrome and plug in the (URL)[https://developers.google.com/places/web-service/search] and scroll down the "Search" section
 
 The above is just an example to give background to the JSON response we got earlier. If we check out https://developers.google.com/places/web-service/search we'll be able to see every possible request and response that can be made by the API.
 
 ----
 
 #### Trying out the API
 So looking at this particular request, we see we're getting back an error. And judging by the APIs documentation, this is expected. Fortunately in the event of a bad request to an API, it is possible that the API returns a response with helpful error messages regarding what was bad about the request. In this case, we made an "invalid request" because we didn't include some additional information it was expecting to get along with the request. This additional information passed along with a request is called **parameters**. Parameters specify additional constraints on the requests we make. They may limit the data requested by filtering it by some criteria
 
- callout(Instructor:):
    1. Example: Continue google maps geocode API on adding the "address" key along with a "value" of the address of C4Q
        - something like: http://maps.googleapis.com/maps/api/geocode/json?address=%2243-06%2045th%20Street%22
        - Worth mentioning that parameters appear following a ? and spaces are replaced by %20 for the actual request, but the google api will understand the request the exact same way as if you put in "43-06 45th Street"
    2. Review the results briefly and show how the results differ from the previous bad request
        - Highlight the new data passed along with a valid request. 
        - (optional) bring up the API documentation page again and compare the keys with what the API states will be returned
        - Explain that all of these results are listed in the API's documentation for this kind of response, so we will always know what to expect.

 Plugging away in a webbrowser is a lightweight way to test out an API, but we can get some real power by using some utilities specifically meant for making API requests...

 
 -----
 #### [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en)
 
 Link for [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop?hl=en)
 
 - callout(Instructor:): 
    1. Open Postman and enter the previous googleapis request http://maps.googleapis.com/maps/api/geocode/json along with an `address` parameter and value to illustrate what can be done. (or include a saved Postman request library for quick completion)
      - (optional) have class try out some of the other available parameters, such as "zipcode"
 */

//: ----
