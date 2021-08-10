import Foundation
import TingleApiClient

/**
 * A middleware] that adds headers for Falu's API Version to a request before sending
 */
internal class ApiVersionMiddleware: TingleApiClientMiddleware{
    func process(request: inout URLRequest) -> URLRequest {
        request.setValue("2020-09-08", forHTTPHeaderField: "X-Falu-Version")
        return request
    }
    
    func process(response: URLResponse?, data: Data?, error: Error?) {
        
    }
}
