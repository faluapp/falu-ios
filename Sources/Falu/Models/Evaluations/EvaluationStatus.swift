import Foundation

public enum EvaluationStatus: String, Codable{
    case created
    case scoring
    case completed
    case failed
}
