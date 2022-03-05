import Foundation

public class Override {
    
    enum OverrideError: Error {
        case invalidUrl
        case jsonResponseIsNotDictionary
    }
    
    public init() {
        
    }
    
    public typealias BooleanCompletionHandler = (Bool) -> Void
    
    public var userDefaultsInstance = UserDefaults.standard
    
    public var initialValues: [String: Any] = [:] {
        didSet {
            setInitialValues(config: initialValues)
        }
    }
    
    public func update(from source: String) async throws {
        guard let url = URL(string: source) else {
            throw OverrideError.invalidUrl
        }
        let request = buildRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dictionary = json as? [String: Any] else {
            throw OverrideError.jsonResponseIsNotDictionary
        }
        for (key, value) in dictionary {
            userDefaultsInstance.set(value, forKey: key)
        }
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
