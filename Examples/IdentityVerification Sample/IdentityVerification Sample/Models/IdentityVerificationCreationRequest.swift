import Foundation

struct IdentityVerificationCreationRequest: Codable {
    var type: String
    var returnUrl: String?
    var options: IdentityVerificationOptions?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case returnUrl = "return_url"
        case options
    }
}
