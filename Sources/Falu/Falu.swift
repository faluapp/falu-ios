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
    public func createPayment(request: PaymentRequest, _ completion: @escaping  (Result<Payment, Error>) -> Void){
        apiClient.createPayment(paymentRequest: request) { (response, error) in
            self.responseHandler(withResponse: response, error: error, completion)
        }
    }
    
    /**
     * Create an evaluation
     *
     * See [Create a payment](https://api.falu.io/v1/evaluations).
     * `POST /v1/evaluations`
     *
     * - Parameter  request [The evaluation request object](https://falu.io)
     * - Parameter  completion to receive the result or error
     *
     */
    @available(*, deprecated, message: "Use `createFile`, then request for evaluation after the file has been created.")
    public func createEvaluation(request: EvaluationRequest,  _ completion: @escaping  (Result<Evaluation, Error>) -> Void){
        apiClient.createEvaluation(evaluationRequest: request){ (response, error) in
            self.responseHandler(withResponse: response, error: error, completion)
        }
        
    }
    
    /**
     * Create a Falu File
     *
     * See [Create a payment](https://api.falu.io/v1/files).
     * `POST /v1/files`
     *
     * - Parameter  request [The file creation request object](https://falu.io)
     * - Parameter  completion to receive the result or error
     *
     */
    public func createFile(request: UploadRequest,  _ completion: @escaping  (Result<FaluFile, Error>) -> Void){
        
        apiClient.uploadFile(uploadRequest: request){ (response, error) in
            self.responseHandler(withResponse: response, error: error, completion)
        }
        
    }
    
    private func responseHandler<TResource: Codable>(withResponse response: AnyResourceResponse<TResource>?,error : Error?, _ completion: @escaping (Result<TResource, Error>) -> Void){
        if error != nil {
            completion(.failure(error!))
            return
        }
        
        guard let response = response else {
            completion(.failure(FaluError.notFound))
            return
        }
        
        if response.successful && response.resource != nil {
            completion(.success(response.resource!))
            return
        }
        
        // generate HTTP response errors
        let problem = response.problem
        completion(.failure(FaluError.apiError(statusCode: response.statusCode, message: problem?.description)))
    }
}
