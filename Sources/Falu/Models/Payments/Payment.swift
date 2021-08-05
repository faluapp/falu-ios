import Foundation

/**
 * [The payment object](https://falu.io)
 */
class Payment: Codable{
    /**
         * Unique identifier for the object
         */
        var id: String = ""

        /**
         * Amount of the payment in smallest currency unit.
         */
        var amount: Int = 0

        /**
         * Three-letter ISO currency code, in lowercase
         */
        var currency: String = ""

        /**
         * The status of a payment
         */
        var status: PaymentStatus? = nil

        /**
         * Time at which the object was created.
         */
        var created: Date = Date()

        /**
         * Time at which the object was last updated
         */
        var updated: Date? = nil

        /**
         * Time at which the payment succeeded.
         * Only populated when successful.
         */
        var succeeded: Date? = nil

        /**
         * Identifier of the authorization, if the payment passed through a flow requiring authorization.
         */
        var authorizationId: String? = nil

        /**
         * The medium used for the payment
         */
        var type: PaymentType? = nil

        /**
         * Represents the provider details for a MPESA payment
         */
        var mpesa: Mpesa? = nil

        /**
         * Details about failure of a payment, transfer or reversal.
         */
        var failure: PaymentFailure? = nil

        /**
         * Identifier of the reversal, if the payment has been reversed
         */
        var reversalId: String? = nil

        /**
         * Unique identifier for the workspace that the object belongs to
         */
        var workspaceId: String? = nil

        /**
         * Indicates if this object belongs in the live environment
         */
        var live: Bool = false
    
}
