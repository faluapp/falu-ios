import Foundation

struct IdentityVerificationOptions: Codable{
    var allowUploads: Bool?

    var idNumber: IdentityVerificationOptionsForIdNumber? = nil

    var document: IdentityVerificationOptionsForDocument?

    var selfie: IdentityVerificationOptionsForSelfie? = nil

    var video: IdentityVerificationOptionsForVideo? = nil

    private enum CodingKeys: String, CodingKey {
        case allowUploads = "allow_uploads"
        case idNumber = "id_number"
        case document
        case selfie
        case video
    }
}
