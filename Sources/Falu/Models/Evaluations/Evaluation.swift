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
    public var scope: String? = nil

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
    public var status: String? = nil

    /**
     * Indicates if this object belongs in the live environment
     */
    public var live: Bool? = nil

    /**
     * Unique identifier for the workspace that the evaluation belongs to.
     */
    public var workspace: String = ""

    /**
     * Represents the scoring result for an evaluation.
     */
    public var scoring: Scoring? = nil

    /**
     * Represents details about the statement used for an evaluation.
     */
    public var statement: EvaluationStatement? = nil
    
    internal init(id: String, currency: String, scope: String?, created: Date = Date(), updated: Date?, status: String, live: Bool = false, workpsace: String, scoring: Scoring?, statement: EvaluationStatement?){
        self.id = id
        self.currency = currency
        self.scope = scope
        self.created = created
        self.updated = updated
        self.status = status
        self.live = live
        self.workspace = workpsace
        self.scoring = scoring
        self.statement = statement
    }
}
