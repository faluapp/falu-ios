import Foundation
import TingleApiClient

internal class FaluApiClient: TingleApiClient{
    private let baseUrl = "https://api.falu.io"

    internal init(_ apiKey: String){
        super.init(authenticationProvider: FaluAuthHeaderProvider(apiKey))
    }
    
    override public func setupJsonSerialization(encoder: JSONEncoder, decoder: JSONDecoder) {
        encoder.dateEncodingStrategy = .iso8601
        decoder.dateDecodingStrategyFormatters = [
            DateFormatter.iSO8601Date,
            DateFormatter.iSO8601DateWithMillisec
        ]
    }

    public override func buildMiddleware() -> [TingleApiClientMiddleware] {
        [
            AppDetailsMiddleware(Bundle.main.bundleIdentifier ?? "",
                                 Bundle.main.shortBundleVersion ?? "",
                                 Bundle.main.bundleVersion ?? "",
                                 _appKind: "iOS"),
            LoggingMiddleware(.BODY, .info),
            ApiVersionMiddleware()
        ]
    }
    
    @discardableResult
    func createPayment(paymentRequest: PaymentRequest,_ completionHandler: @escaping (AnyResourceResponse<Payment>?, Error?) -> Void) -> URLSessionTask{
        let url = URL(string: "\(baseUrl)/v1/payments")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try! encoder.encode(paymentRequest)
        
        return sendRequest(request: &request, completionHandler: completionHandler)
    }
    
    @discardableResult
    func createEvaluation(evaluationRequest: EvaluationRequest,_ completionHandler: @escaping (AnyResourceResponse<Evaluation>?, Error?) -> Void) -> URLSessionTask{
        let url = URL(string: "\(baseUrl)/v1/evaluations")!
        
        let boundary:String = "\(UUID().uuidString)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
       
        var requestBody = Data()
        
        let startingBoundary = "\r\n--\(boundary)\r\nContent-Type: application/pdf\r\nContent-Disposition: form-data; filename=\(evaluationRequest.fileName); name=file\r\n\r\n"
        
        
        if let d = startingBoundary.data(using: .utf8) {
            requestBody.append(d)
        }
        
        requestBody.append(evaluationRequest.file)
        
        
        let closingBoundary = "\r\n--\(boundary)--"
        
        if let d = closingBoundary.data(using: .utf8) {
            requestBody.append(d)
        }

        let params = "Currency=\(evaluationRequest.currency)&Scope=\(evaluationRequest.scope)&Provider=\(evaluationRequest.provider)&Name=\(evaluationRequest.name)&Phone=\(evaluationRequest.phone ?? "")&Password=\(evaluationRequest.password ?? "")"
                  .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        
        if let params = params.data(using: .utf8) {
            requestBody.append(params)
        }

        request.httpBody = requestBody
        return sendRequest(request: &request, completionHandler: completionHandler)
    }
}

internal class FaluAuthHeaderProvider: AuthenticationHeaderProvider{
    private var apiKey: String
    
    override init(_ key: String) {
        self.apiKey = key
        super.init()
    }
    
    override func getParameter(request: inout URLRequest) -> String {
        return apiKey
    }
}
