import Foundation

struct IdentityVerificationOutputs: Codable{
       var idNumberType: String?

       var idNumber: String?

       var firstName: String?
       
       var lastName: String?

       var birthday: Date?

       var otherNames: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case idNumberType = "id_number_type"
        case idNumber = "id_number"
        case firstName = "first_name"
        case lastName = "last_name"
        case birthday
        case otherNames = "other_names"
    }
}
