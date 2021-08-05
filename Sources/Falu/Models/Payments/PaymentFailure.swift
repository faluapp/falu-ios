import Foundation

/**
 * [The Payment Failure object](https://falu.io)
 */
class PaymentFailure: Codable{
    /**
     * Reason for failure of a payment, transfer or reversal
     */
    var reason: FailureReason? = nil

    /**
     * Time at which failure occurred
     */
    var timestamp: Date? = nil

    /**
     * Failure message as received from teh provider
     */
    var detail: String? = nil
}

enum FailureReason : Codable, String {
    case unknown
    case insufficient_balance
    case authentication_error
    case timeout
    case other
}
