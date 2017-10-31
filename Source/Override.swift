//
//  Override.swift
//  Override
//
//  Created by Tyler Hillsman on 10/25/17.
//  Copyright © 2017 Tyler Hillsman. All rights reserved.
//

import Foundation

class Override {
    
    typealias BooleanCompletionHandler = (Bool) -> Void
    
    public var userDefaultsInstance = UserDefaults.standard
    
    public var initialValues: [String: Any] = [:] {
        didSet {
            setInitialValues(config: initialValues)
        }
    }
    
    public func update(from source: String, completion: BooleanCompletionHandler? = nil) {
        guard let url = URL(string: source) else {
            print("Override warning: The Override URL is invalid.");
            return
        }
        let request = buildRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, sessionError in
            guard let data = data else {
                print("Override warning: The Override URL is not returning any data.");
                if let completion = completion {
                    completion(false)
                }
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []), let overrideObject = json as? [String: Any] else {
                print("Override warning: The Override URL is not returning valid JSON.");
                if let completion = completion {
                    completion(false)
                }
                return
            }
            for (key, value) in overrideObject {
                self.userDefaultsInstance.set(value, forKey: key)
            }
            if let completion = completion {
                completion(true)
            }
        }
        task.resume()
    }
    
    private func setInitialValues(config: [String: Any]) {
        for (key, value) in config {
            if userDefaultsInstance.object(forKey: key) == nil {
                userDefaultsInstance.set(value, forKey: key)
            }
        }
    }
    
    private func buildRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
