import Foundation

/**
 * Represents the scoring result for an evaluation.
 */
public class Scoring: Codable{
    /**
     * Risk probability. The higher the value, the higher the risk
     */
    public var risk: Float? = nil

    /**
     * Limit advised for lending in the smallest currency unit.
     */
    public var limit: Float? = nil

    /**
     * Risk probability. The higher the value, the higher the risk
     */
    public var expires: Date? = nil 
}
