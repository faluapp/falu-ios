import Foundation
import TingleApiClient
#if os(macOS)
    import AppKit
#else
    import UIKit
#endif

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
        #if os(macOS)
        let model = "macOS"
        let version = "10.15.7"
        #else
        let model = UIDevice.current.model
        let version = "\(UIDevice.current.systemName) \(UIDevice.current.systemVersion)"
        #endif

        return "falu-iOS/(\(model);\(version));"
    }
}
