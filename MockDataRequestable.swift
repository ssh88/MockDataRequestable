//
//  MockDataRequestable.swift
//  MockDataRequestable
//
//  Created by Shabeer Hussain on 17/11/2016.
//  Copyright © 2016 Desert Monkey. All rights reserved.
//

import Foundation
import XCTest

protocol MockDataRequestable {
    /**
     Returns a [String : AnyObject] dictonary from a mock json file
     */
    func mockDictionary(fromJsonFile filename: String) -> [String : AnyObject]?
    
    /**
     Returns a data object from a mock json file
     */
    func mockData(fromJsonFile filename: String) -> Data?
    
    /**
     Decodes and returns a decodable object from a mock json file
     */
    func mockObject<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> T?
    
    /**
     Decodes and returns an array of decodable objects from a mock json file
     */
    func mockObjects<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> [T]?
}

extension MockDataRequestable where Self : XCTestCase {
    
    func mockDictionary(fromJsonFile filename: String) -> [String : AnyObject]? {
        
        let bundle = Bundle(for: type(of: self))
        
        guard let path = bundle.path(forResource: filename, ofType: "json") else {
            debugPrint("Error: Unable to find json file '\(filename)'")
            return nil
        }
        
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            guard let mockData = try JSONSerialization.jsonObject(with: jsonData, options:[]) as? [String : AnyObject] else {
                debugPrint("Error: Incorrect JSON format for file '\(filename)'")
                return nil
            }
            return mockData
        } catch {
            debugPrint(error.localizedDescription)
            return nil
        }
    }
    
    func mockData(fromJsonFile filename: String) -> Data? {
        guard let jsonObject = mockDictionary(fromJsonFile: filename) else { return nil }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            return data
        } catch {
            debugPrint("Error: unable to create mock data object for file '\(filename)'. /(error.localizedDescription)")
            return nil
        }
    }
    
    func mockObject<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> T? {
        guard let data = self.mockData(fromJsonFile: filename) else { return nil }
        
        do {
            let mockObject = try JSONDecoder().decode(T.self , from: data)
            return mockObject
        } catch {
            debugPrint("Error: unable to decode mock object. \(error.localizedDescription)")
            return nil
        }
    }
    
    func mockObjects<T: Decodable>(_ type: T.Type, fromJsonFile filename: String) -> [T]? {
        guard let data = self.mockData(fromJsonFile: filename) else { return nil }
        
        do {
            let mockObject = try JSONDecoder().decode([T].self , from: data)
            return mockObject
        } catch {
            debugPrint("Error: unable to decode mock objects. \(error.localizedDescription)")
            return nil
        }
    }
}


