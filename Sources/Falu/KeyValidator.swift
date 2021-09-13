import Foundation

internal class KeyValidator{
    static func requireValid(_ key: String) throws -> String{
        if key.isEmpty{
            throw FaluError.invalidPassword("Invalid Publishable Key: " +
                                                    "You must use a valid FALU API key to make a FALU API request. " +
                                                    "For more info, see https://docs.falu.io/guides/keys")
        }
        
        if key.starts(with: "sk_"){
            throw FaluError.invalidPassword(   "Invalid Publishable Key: " +
                                                    "You are using a secret key instead of a publishable one. " +
                                                    "For more info, see https://docs.falu.io/guides/keys")
        }
        
        return key
    }
}
