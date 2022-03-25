import XCTest
@testable import Falu
@testable import Mocker

final class FaluTests: XCTestCase {
    private var mockUrlSession: URLSession!
    
    private let baseUrl = "https://api.falu.io"
    
    private var falu: Falu!
    
    private let encoder: JSONEncoder = JSONEncoder()
    
    override func setUpWithError() throws {
        falu = Falu("pk_test_cbw2Bxslzkxf7sUAg6932NYm1ApTX7C0TEMbvCYss")
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockingURLProtocol.self]
        mockUrlSession = URLSession(configuration: configuration)
        
        encoder.dateEncodingStrategy = .iso8601
    }
    
    func testMpesaPaymentRequestFails(){
        let mpesa = MpesaPaymentRequest(
            phone: "+254722000000",
            reference: "254722000000",
            paybill: true,
            destination: "00110"
        )
        
        let request = PaymentRequest(amount: 100, currency: "kes", mpesa: mpesa)
        var faluError: Error? = nil
        
        falu.createPayment(request: request) { result in
            if case .failure(let error) = result{
                faluError = error
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(faluError)
    }
    
    func testMpesaPaymentRequestSucceeds(){
        let expectation = self.expectation(description: "Payments")
        let url = URL(string: "\(baseUrl)/v1/payments")!
        
        let mockPayment = Payment(id: "payment_123", amount: 100000, currency: "kes", status: "succeeded",
                                  updated: Date(), succeeded: Date(), authorizationId: nil, type: nil, mpesa: nil, faliure: nil,
                                  reversalId: nil, workspace: "workspace_123")
        
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.post: try! encoder.encode(mockPayment)])
        mock.register()
        
        let mpesa = MpesaPaymentRequest(
            phone: "+254722000000",
            reference: "254722000000",
            paybill: true
        )
        
        let request = PaymentRequest(amount: 200.70, currency: "kes", mpesa: mpesa)
        var payment: Payment? = nil
        falu.createPayment(request: request) { result in
            if case .success(let resource) = result{
                payment = resource
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(payment)
    }
    
    func testEvaluationCreationFails(){
        
        let request = EvaluationRequest(
            currency: "kes",
            scope: "personal",
            provider: "mpesa",
            name: "JOHN DOE",
            phone: "+254712345678",
            password: "pass",
            file: "file_602a8dd0a54847479a874de4"
        )
        
        var faluError: Error? = nil
        let expectation = self.expectation(description: "Evaluations")
        
        falu.createEvaluation(request: request) { result in
            if case .failure(let error) = result{
                faluError = error
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(faluError)
    }
    
    func testMoneyPatternConversion(){
        let money = Money(
            amount: 1000,
            currencyCode: "bhd"
        )
        XCTAssertEqual("BHD", money.currency.code)
        XCTAssertEqual(1000000, money.amountInMinorUnits)
    }
    
    func testFileCreationFails(){
        
        let request = UploadRequest(
            file: Data(),
            fileName: "statement.pdf",
            purpose: "customer.evaluation",
            description: "Test description",
            expires: Date()
        )
        
        var faluError: Error? = nil
        let expectation = self.expectation(description: "Files")
        
        falu.createFile(request: request) { result in
            if case .failure(let error) = result{
                faluError = error
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(faluError)
    }
}
