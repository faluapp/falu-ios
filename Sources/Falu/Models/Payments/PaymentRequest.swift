import Foundation


/**
 * [The payment request object](https://falu.io)
 *
 */
public struct PaymentRequest: Codable {
    /**
     * Amount of the payment in smallest currency unit.
     */
    var amount: Int
    
    /**
     * Three-letter ISO currency code, in lowercase.
     */
    var currency: String
    
    /**
     * The shortcode of the receiver. When not provided, it defaults to the default recipient.
     * When not provided, either the default incoming business code or the first business code for the workspace is used depending on the kind.
     * This value is usually required and different from the business short code when using BuyGood
     */
    var mpesa: MpesaPaymentRequest?
}
