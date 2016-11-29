//
//  MockDataRequestable.swift
//  MockDataRequestable
//
//  Created by Shabeer Hussain on 17/11/2016.
//  Copyright © 2016 Desert Monkey. All rights reserved.
//

import Foundation

protocol MockDataRequestable {
     func serializedMockJSON(fromFile fileName: String) -> [String : AnyObject]?
}

extension MockDataRequestable {
    
    func serializedMockJSON(fromFile fileName: String) -> [String : AnyObject]? {
        
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
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
