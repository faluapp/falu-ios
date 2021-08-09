import Foundation

public enum PaymentStatus: String, Codable {
    case pending
    case succeeded
    case failed
}
