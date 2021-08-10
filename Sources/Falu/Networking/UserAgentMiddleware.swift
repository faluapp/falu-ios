import Foundation
import TingleApiClient
import UIKit

/**
 * A middleware] that adds headers for Falu's API Version to a request before sending
 */
internal class UserAgentMiddleware: TingleApiClientMiddleware{
    func process(request: inout URLRequest) -> URLRequest {
        request.setValue(agent, forHTTPHeaderField: "User-Agent")
        return request
    }
    
    func process(response: URLResponse?, data: Data?, error: Error?) {
        
    }
    
    private var agent: String {
        let model = UIDevice.current.model
        let version = "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
                
        return "falu-iOS/(\(model);\(version));"
    }
}
