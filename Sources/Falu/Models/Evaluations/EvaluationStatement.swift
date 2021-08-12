import Foundation

/**
 * Represents details about the statement used for an evaluation.
 */
public class EvaluationStatement: Codable{
    /**
     * Represents the kind of provider used for a statement in an evaluation.
     */
    public var provider: StatementProvider? = nil

    /**
     * Email found in the statement.
     */
    public var email: String? = nil

    /**
     * Name found in the statement
     */
    public var name: String? = nil

    /**
     * Phone number found in the statement.
     */
    public var phone: String? = nil

    /**
     * Time at which the statement was generated by the provider.
     */
    public var generated: Date? = nil

    /**
     * The period of the statement
     */
    public var period: Period? = nil
}


public struct Period: Codable {
    public var start: Date?
    public var end: Date?
}
