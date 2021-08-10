import TingleApiClient
/**
 * Entry-point to the Falu SDK
 *
 * Supports asynchronous methods to access the following Falu APIs:
 *
 * * [Evaluations API] [Create Evaluation] - Create an evaluation
 */
public class Falu {
    private let apiClient: FaluApiClient
    
    /**
     * Constructor with an public  key.
     *
     * - Parameter publicKey  the client's public key
     */
    public init(_ publicKey: String){
        let key = try! KeyValidator.requireValid(publicKey)
        self.apiClient = FaluApiClient(key)
    }
    
    
    /**
     * Create a payment
     *
     * See [Create a payment](https://api.falu.io/v1/payments).
     * `POST /v1/payments`
     *
     * - Parameter  request [The payment request object](https://falu.io)
     * - Parameter  completion to receive the result or error
     *
     */
    public func createPayment(request: PaymentRequest, _ completion: @escaping  (Result<Payment, FaluError>) -> Void){
        apiClient.createPayment(paymentRequest: request) { (response, error) in
            
            if (error != nil) {
                // show a network error here
                completion(.failure(error as! FaluError))
                return
            }
            
            guard let response = response else {
                completion(.failure(.Unknown))
                return
            }
            
            if response.successful && response.resource != nil {
                completion(.success(response.resource!))
                return
            }
            
            let problem = response.problem
            completion(.failure(.ApiException(statusCode:response.statusCode, errorCode: problem?.error_code)))
        }
    }
    
    /**
     * Create an evaluation
     *
     * See [Create a payment](https://api.falu.io/v1/evaluations).
     * `POST /v1/payments`
     *
     * - Parameter  request [The evaluation request object](https://falu.io)
     * - Parameter  completion to receive the result or error
     *
     */
    public func createEvaluation(request: EvaluationRequest,  _ completion: @escaping  (Result<Evaluation, FaluError>) -> Void){
        apiClient.createEvaluation(evaluationRequest: request){ (response, error) in
            if (error != nil) {
                // show a network error here
                completion(.failure(error as! FaluError))
                return
            }
            
            guard let response = response else {
                completion(.failure(.Unknown))
                return
            }
            
            if response.successful && response.resource != nil {
                completion(.success(response.resource!))
                return
            }
            
            let problem = response.problem
            completion(.failure(.ApiException(statusCode:response.statusCode, errorCode: problem?.error_code)))
        }
        
    }
}
