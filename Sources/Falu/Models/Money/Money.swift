import Foundation

/**
 * Implementation of Martin Fowler Money Design Pattern

 */
internal struct Money{
    let amount:  Decimal
    let currency: Currency
    
    init(amount: Decimal, currencyCode: String) {
        self.currency = Currency(isoCurrencyCode: currencyCode.uppercased())
        self.amount = amount
    }
}

/// Minor Unit is a fraction of the base (ex. cents, stotinka, etc.)
extension Money{
    
    public var amountInMinorUnits: Int {
        return NSDecimalNumber(decimal: amount * pow(10, currency.minorUnits)).intValue
    }
}
