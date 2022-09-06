import Foundation
import TingleApiClient

class IdentityVerificationApiClient: TingleApiClient{
    
    init() {
        super.init(authenticationProvider: EmptyAuthenticationProvider())
    }
    
    @discardableResult
    public func createIdentityVerification(verification: IdentityVerificationCreationRequest, _ completionHandler: @escaping (AnyResourceResponse<IdentityVerification>?, Error?) -> Void) -> URLSessionTask{
        let url = URL(string: "https://falu-sample.herokuapp.com/identity/create-verification/")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try! encoder.encode(verification)
        
        return sendRequest(request: &request, completionHandler: completionHandler)
    }
}
