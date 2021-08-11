//
//  File.swift
//  
//
//  Created by Seth Onyango on 11/08/2021.
//

import Foundation

internal extension Locale{
    static func getLocale(isoCurrencyCode: String) -> Locale?{
        guard self.isoCurrencyCodes.contains(isoCurrencyCode) else {
            return nil
        }
        
        guard let availableLocale = self.getAvailableLocales(for: isoCurrencyCode).first else {
            let localeComponents = [NSLocale.Key.currencyCode.rawValue: isoCurrencyCode]
            let localeIdentifier = Locale.identifier(fromComponents: localeComponents)
            let canonical = Locale.canonicalIdentifier(from: localeIdentifier)
            return Locale(identifier: canonical)
        }
        
        let canonical = self.canonicalIdentifier(from: availableLocale.identifier)
        return Locale(identifier: canonical)
    }
    
    
    private static func getAvailableLocales(for currencyCode: String) -> [Locale] {
        return Locale.availableIdentifiers
            .map { Locale(identifier:$0) }
            .filter { $0.currencyCode == currencyCode }
    }
}
