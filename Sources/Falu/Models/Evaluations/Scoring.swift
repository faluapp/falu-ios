import Foundation

/**
 * Represents the scoring result for an evaluation.
 */
class Scoring: Codable{
    /**
     * Risk probability. The higher the value, the higher the risk
     */
    var risk: Float? = nil

    /**
     * Limit advised for lending in the smallest currency unit.
     */
    var limit: Float? = nil

    /**
     * Risk probability. The higher the value, the higher the risk
     */
    var expires: Date? = nil 
}
