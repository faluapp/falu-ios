import Foundation

/**
 * [The evaluation request object](https://falu.io)
 */
public struct EvaluationRequest: Codable {
    /**
     * Represents the currency e.g kes
     */
    public var currency: String = "kes"
        
    /**
    * Represents the scope within which an evaluation is generated.
    * This can also be considered the purpose of the evaluation.
    */
    public var scope: EvaluationScope
    
    /**
    * Represents the kind of provider used for a statement in an evaluation.
    *
    */
    public var provider: StatementProvider = StatementProvider.mpesa
    
    /**
    * The full name of the person or business that owns the statement.
    *
    */
    public var name: String
    
    /**
    * The Phone number for attached to the statement.
    * Only required for statements generated against a phone number e.g. mpesa
    *
    */
    public var phone: String?
    
    /**
    * Password to open the uploaded file. Only required for password protected files.
    * Certain providers only provide password protected files.
    * In such cases the password should always be provided.
    */
    public var password: String?
    
    /**
    * Statement file uploaded with the http request
    */
    public var file: Data
    
    /**
    * Name of statement file being uploaded with the http request
    */
    public var fileName: String
}
