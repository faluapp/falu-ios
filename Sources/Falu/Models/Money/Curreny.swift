import Foundation


internal struct Currency{
    /**
     * Currency code e.g KES
     */
    var code: String
    
    /**
     * Currency Name e.g Kenyan Shilling
     */
    var name: String
    
    /**
     * Number of decimal places used to express any minor units for the currency
     */
    var minorUnits: Int
    
    /**
     * Sign/Symbol  e.g Sh
     */
    var sign: String?
    
    init(isoCurrencyCode: String){
        let locale = Locale.getLocale(isoCurrencyCode: isoCurrencyCode) ?? Locale.current
        
        let formatter = NumberFormatter.currencyFormatter
        formatter.locale = locale
        
        self.code = isoCurrencyCode
        self.name = Locale.current.localizedString(forCurrencyCode: isoCurrencyCode) ?? isoCurrencyCode
        self.minorUnits = formatter.maximumFractionDigits
        self.sign = formatter.currencySymbol
    }
}


private extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
