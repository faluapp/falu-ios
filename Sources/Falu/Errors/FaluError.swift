
import Foundation

public enum FaluError: Error {
    case invalidPassword(_ message: String)
    case notFound
    case apiError(statusCode: Int?, message: String?)
}
