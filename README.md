# MockDataRequestable
Really simple Swift protocol to easily parse mock data files to use in your unit tests - only supports JSON right now.

### Usage

First conform to the protocol

```
class MyServiceTests: XCTestCase, MockDataRequestable {
```

When you need to use your mock data file simply call the ```serializedJSON:from:``` function by passing in the file name (excluding the file extension)

```
 guard let responseData = serializedJSON(from: mockDatafileName) else {  return }
```

Currently only supports JSON

### Requirements

- iOS 9.0+
- Swift 3
- Xcode 8

### Integration

#### CocoaPods

Will be a pod soon :)
