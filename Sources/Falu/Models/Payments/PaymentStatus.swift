import Foundation

enum PaymentStatus: String, Codable {
    case pending
    case succeeded
    case failed
}
