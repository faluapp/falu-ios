import Foundation


/**
 * [The payment request object](https://falu.io)
 *
 */
public struct PaymentRequest: Codable {
    /**
     * Amount of the payment in smallest currency unit.
     */
    let amount: Int
    
    /**
     * Three-letter ISO currency code, in lowercase.
     */
    let currency: String
    
    /**
     * The shortcode of the receiver. When not provided, it defaults to the default recipient.
     * When not provided, either the default incoming business code or the first business code for the workspace is used depending on the kind.
     * This value is usually required and different from the business short code when using BuyGood
     */
    var mpesa: MpesaPaymentRequest?
    
    public init(amount: Decimal, currency: String, mpesa: MpesaPaymentRequest?) {
        self.currency = currency.lowercased()
        self.amount = Money(amount: amount, currencyCode: self.currency).amountInMinorUnits
        self.mpesa = mpesa
    }
}
