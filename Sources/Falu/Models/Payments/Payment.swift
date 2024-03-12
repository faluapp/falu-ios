import Foundation

/**
 * [The payment object](https://falu.io)
 */
public class Payment: Codable{
    /**
     * Unique identifier for the object
     */
    public var id: String = ""

    /**
     * Amount of the payment in smallest currency unit.
     */
    public var amount: Int = 0

    /**
     * Three-letter ISO currency code, in lowercase
     */
    public var currency: String = ""

    /**
     * The status of a payment
     */
    public var status: String? = nil

    /**
     * Time at which the object was created.
     */
    public var created: Date = Date()

    /**
     * Time at which the object was last updated
     */
    public var updated: Date? = nil

    /**
     * Time at which the payment succeeded.
     * Only populated when successful.
     */
    public var succeeded: Date? = nil

    /**
     * Identifier of the authorization, if the payment passed through a flow requiring authorization.
     */
    public var authorizationId: String? = nil

    /**
     * The medium used for the payment
     */
    public var type: String? = nil

    /**
     * Represents the provider details for a MPESA payment
     */
    public var mpesa: Mpesa? = nil

    /**
     * Details about failure of a payment, transfer or reversal.
     */
    public var failure: PaymentFailure? = nil

    /**
     * Identifier of the reversal, if the payment has been reversed
     */
    public var reversalId: String? = nil

    /**
     * Unique identifier for the workspace that the object belongs to
     */
    public var workspace: String? = nil

    /**
     * Indicates if this object belongs in the live environment
     */
    public var live: Bool = false


    internal init(id: String, amount: Int, currency: String, status: String, created: Date = Date(), updated: Date, succeeded: Date?, authorizationId: String?, type: String?, mpesa: Mpesa?, failure: PaymentFailure?, reversalId: String?, workspace: String?, live: Bool = false){
        self.id = id
        self.amount = amount
        self.currency = currency
        self.status = status
        self.created = created
        self.updated = updated
        self.succeeded = succeeded
        self.authorizationId = authorizationId
        self.type = type
        self.mpesa = mpesa
        self.failure = failure
        self.reversalId = reversalId
        self.workspace = workspace
        self.live = live
    }
}
