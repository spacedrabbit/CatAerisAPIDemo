/*
 **** just preliminary notes ****
 
 Concurrency: order independent execution and handling. More importantly, making sure that even though the actions you take are out of order, you always get the same expected results at the end.
 - For example, if you need to cook a pasta dish you could first wait for the boil the water, then put in the pasta and wait for it to cook. then strain it. then start on the sauce.. but doing things in serial execution like this would take a very long time, despite the guarantee that everything necessary will be done by a certain point.
 - A much more efficient way of doing is through doing concurrent operations, i.e. putting the pot of water to boil and while waiting for that, prep the vegetables for the sauce. If you have multiple burners, then it makes sense to do things this way.
 
 Well, computers kind of work the same way. It used to be that computers only had 1 burner available but no they have many, many more at their disposal. The purpose of this is to do as many things as possible at the same time and allow the chef to bounce between tasks as needed.
 
 Now when we talk about concurrency with API requests, it’s usually in the realm of asynchronous requests. An asynchronous request is similar to concurrency in that you start it, go do something else for a little bit, and then you get alerted when it is finished. In a kitchen, you may ask your sous chef to go prep some onions. Then, once they finish chopping, you get the results back. You don’t know exactly how long this is going to take the chef; you just know you need the onions and you can’t stop everything else you’re doing while you wait for them.
 
 Concurrency is a complicated topic, but Objective C and Swift make great strides towards you not having to worry about it too much. But, making network requests are pretty much always going to be done asynchronously
 
 NSURLSession
 
 - NSURLSessionDataTask
 - NSURLSessionUploadTask
 - NSURLSessionDownloadTask
 - Constructors
 - Rather than being executed directly, the session task is returned on constructor for further configuration. The resume method needs to be called to actually launch the request
 
 References:
 Concurrency (Wiki):  https://en.wikipedia.org/wiki/Concurrency_%28computer_science%29
 https://www.objc.io/issues/2-concurrency/concurrency-apis-and-pitfalls/
 Working with GCD: https://www.objc.io/issues/2-concurrency/low-level-concurrency-apis/
 Concurrency’s relation to Async Network requests (scroll down): https://www.objc.io/issues/2-concurrency/common-background-practices/
 Awesome talk on simple networking (advanced! uses flatmap, generics, computed properties and closures properties): https://talk.objc.io/episodes/S01E01-networking
 Move from NSURLConnection to Session: https://www.objc.io/issues/5-ios7/from-nsurlconnection-to-nsurlsession/
 
 Further reading:
 Advanced case study on data syncing - https://www.objc.io/issues/10-syncing-data/sync-case-study/
 
 
 
 */