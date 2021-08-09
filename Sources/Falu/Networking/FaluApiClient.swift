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
