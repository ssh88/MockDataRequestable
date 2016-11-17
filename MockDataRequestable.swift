//
//  MockDataRequestable.swift
//  MockDataRequestable
//
//  Created by Shabeer Hussain on 17/11/2016.
//  Copyright © 2016 Desert Monkey. All rights reserved.
//

import Foundation

enum FileType: String {
    case JSON = "json"
}

protocol MockDataRequestable {
    func serializedJSON(from fileName: String) -> [String : AnyObject]?
}

extension MockDataRequestable {
    
    func serializedJSON(from fileName: String) -> [String : AnyObject]? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: FileType.JSON.rawValue) else {
            debugPrint("Error: Unable to find json file '\(fileName)'")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            guard let mockData = try JSONSerialization.jsonObject(with: jsonData, options:[]) as? [String : AnyObject] else {
                debugPrint("Error: Incorrect JSON format for file '\(fileName)'")
                return nil
            }
            return mockData
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
}
