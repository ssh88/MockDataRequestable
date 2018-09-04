# MockDataRequestable
Really simple Swift protocol to easily parse mock data files to use in your unit tests - currently only supports JSON.

### Usage

First conform to the protocol

```
class MyServiceTests: XCTestCase, MockDataRequestable {
```

When you need to use your mock data file simply call the ```serializedJSON:from:``` function by passing in the file name (excluding the file extension) as shown below:

```
 guard let responseData = serializedMockJSON(from: "mockResponse") else {  return }
```

Though let be real, why would you guard in a unit test!, practical example is to simply call with a force unwrap:

```
 let responseData = serializedMockJSON(from: "mockResponse")!
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
