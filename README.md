# MockDataRequestable
Really simple Swift protocol to easily parse mock data files to use in your unit tests - currently only supports JSON.

### Usage

First conform to the protocol

```swift
class MyServiceTests: XCTestCase, MockDataRequestable {
```

When you need to use your mock data file simply call one of the 4 following functions depending on your required output:
```swift
    //Returns a [String : AnyObject] dictonary from a mock json file
    func mockDictionary(fromJsonFile filename: String) -> [String : AnyObject]?
    
    //Returns a data object from a mock json file
    func mockData(fromJsonFile filename: String) -> Data?
    
    //Decodes and returns a decodable object from a mock json file
    func mockObject<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> T?
    
    //Decodes and returns an array of decodable objects from a mock json file
    func mockObjects<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> [T]?
```

For example to get a simple ```[String : AnyObject]``` dictonary call the ```mockDictionary:fromJsonFile:``` function by passing in the file name (excluding the file extension) as shown below:

```swift
 guard let mockObject = mockDictionary(fromJsonFile: "mockResponse") else {  return }
```

Though lets be real, why would you guard in a unit test!, practical example is to fail early so we simply call with a force unwrap:

```swift
 let mockObject = mockDictionary(fromJsonFile: "mockResponse")!
```

Again, currently only supports JSON

Enjoy!

### Requirements

- iOS 9.0+
- Swift 3
- Xcode 8

### Integration

#### CocoaPods

Will be a pod soon :)
