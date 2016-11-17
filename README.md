# MockDataRequestable
Swift protocol to easily parse mock data files to use in your unit test

Really simple protocol to retrieve and parse a mock data file - only supports JSON right now.

### Example

First conform to the protocol

```
class MyServiceTests: XCTestCase, MockDataRequestable {
```

Then when you need to use your mock data file simply call the ```serializedJSON:from:``` function by passing in the file name (excluding the file extension)

```
 guard let responseData = serializedJSON(from: mockDatafileName) else {  return }
```

Currently only supports JSON
