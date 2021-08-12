import Foundation

/**
 *  [The evaluation object](https://falu.io
 *  Represents a financial evaluation.
 */
public class Evaluation: Codable{
    /**
     * Unique identifier of the evaluation.
     */
    public var id: String = ""

    /**
     * Three-letter ISO currency code, in lowercase.
     */
    public var currency: String? = nil

    /**
     * Represents the scope within which an evaluation is generated.
     * This can also be considered the purpose of the evaluation.
     */
    public var scope: EvaluationScope? = nil

    /**
     * Time at which the object was created.
     */
    public var created: Date? = nil

    /**
     * Time at which the evaluation was last updated.
     */
    public var updated: Date? = nil

    /**
     * Represents the status of an evaluation
     */
    public var status: EvaluationStatus? = nil

    /**
     * Indicates if this object belongs in the live environment
     */
    public var live: Bool? = nil

    /**
     * Unique identifier for the workspace that the evaluation belongs to.
     */
    public var workspaceId: String = ""

    /**
     * Represents the scoring result for an evaluation.
     */
    public var scoring: Scoring? = nil

    /**
     * Represents details about the statement used for an evaluation.
     */
    public var statement: EvaluationStatement? = nil
}
