import Foundation

/**
 * [The Payment Failure object](https://falu.io)
 */
public class PaymentFailure: Codable{
    /**
     * Reason for failure of a payment, transfer or reversal
     */
    public var reason: String? = nil
    
    /**
     * Time at which failure occurred
     */
    public var timestamp: Date? = nil
    
    /**
     * Failure message as received from the provider
     */
    public var detail: String? = nil
}

public enum FailureReason : String, Codable {
    case unknown
    case insufficient_balance
    case authentication_error
    case timeout
    case other
}
