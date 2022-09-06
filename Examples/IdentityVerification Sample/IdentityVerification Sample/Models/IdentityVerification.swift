import Foundation

struct IdentityVerification: Codable {

     var id: String

     var status: String?

     var type: String?

     var options: IdentityVerificationOptions?

     var clientSecret: String?

     var url: String?

     var reports: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case status
        case options
        case url
        case reports
        case clientSecret = "client_secret"
    }
}
