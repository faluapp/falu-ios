import Foundation

public enum FilePurpose: String, Codable {
    case businessIcon
    case businessLogo
    case customerSignature
    case customerSelfie
    case customerTaxDocument
    case customerEvaluation
    case identityDocument
    
    
    internal var purpose: String{
        switch self {
        case .businessIcon:
            return "business.icon"
        case .businessLogo:
            return "business.logo"
        case .customerSignature:
            return "customer.signature"
        case .customerSelfie:
            return "customer.selfie"
        case .customerTaxDocument:
            return "customer.tax.document"
        case .customerEvaluation:
            return "customer.evaluation"
        case .identityDocument:
            return "identity.document"
        }
    }
    
    enum CodingKeys: String, CodingKey  {
        case businessIcon = "business.icon"
        case businessLogo = "business.logo"
        case customerSignature = "customer.signature"
        case customerSelfie = "customer.selfie"
        case customerTaxDocument = "customer.tax.document"
        case customerEvaluation = "customer.evaluation"
        case identityDocument = "identity.document"
    }
}
