import Foundation

enum PaymentStatus: Codable, String {
    case pending
    case succeeded
    case failed
}
