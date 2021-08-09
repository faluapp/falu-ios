
import Foundation

public enum FaluError: Error {
    case Unknown
    case InvalidKeyExpection(_ message: String)
    case ApiException(statusCode:Int?, errorCode: String?)
}
