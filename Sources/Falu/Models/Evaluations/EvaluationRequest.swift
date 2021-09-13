import Foundation

/**
 * [The evaluation request object](https://falu.io)
 */
public struct EvaluationRequest: Codable {
    /// Represents the currency e.g kes
    var currency: String
    
    /// Represents the scope within which an evaluation is generated.
    /// This can also be considered the purpose of the evaluation.
    var scope: EvaluationScope
    
    
    /// Represents the kind of provider used for a statement in an evaluation.
    var provider: StatementProvider
    
    
    /// The full name of the person or business that owns the statement.
    var name: String
    
    
    /// The Phone number for attached to the statement.
    /// Only required for statements generated against a phone number e.g. mpesa
    var phone: String?
    
    /// Password to open the uploaded file. Only required for password protected files.
    /// Certain providers only provide password protected files.
    /// In such cases the password should always be provided.
    var password: String?
    
    /// Unique identifier of the file containing the statement.
    var fileId: String

    
    public init(currency: String, scope: EvaluationScope, provider: StatementProvider, name: String, phone: String? = nil, password: String? = nil, fileId: String){
        self.currency = currency.lowercased()
        self.scope = scope
        self.provider = provider
        self.name = name
        self.phone = phone
        self.password = password
        self.fileId = fileId
    }
}
