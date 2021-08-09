import Foundation

/**
 *  [The evaluation object](https://falu.io
 *  Represents a financial evaluation.
 */
public class Evaluation: Codable{
    /**
     * Unique identifier of the evaluation.
     */
    var id: String = ""

    /**
     * Three-letter ISO currency code, in lowercase.
     */
    var currency: String? = nil

    /**
     * Represents the scope within which an evaluation is generated.
     * This can also be considered the purpose of the evaluation.
     */
    var scope: EvaluationScope? = nil

    /**
     * Time at which the object was created.
     */
    var created: Date? = nil

    /**
     * Time at which the evaluation was last updated.
     */
    var updated: Date? = nil

    /**
     * Represents the status of an evaluation
     */
    var status: EvaluationStatus? = nil

    /**
     * Indicates if this object belongs in the live environment
     */
    var live: Bool? = nil

    /**
     * Unique identifier for the workspace that the evaluation belongs to.
     */
    var workspaceId: String = ""

    /**
     * Represents the scoring result for an evaluation.
     */
    var scoring: Scoring? = nil

    /**
     * Represents details about the statement used for an evaluation.
     */
    var statement: EvaluationStatement? = nil
}
