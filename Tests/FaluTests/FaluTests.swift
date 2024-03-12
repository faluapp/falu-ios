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

    func testMpesaPaymentRequestSucceeds(){
        let expectation = self.expectation(description: "Payments")
        let url = URL(string: "\(baseUrl)/v1/payments")!

        let mockPayment = Payment(id: "payment_123", amount: 100000, currency: "kes", status: "succeeded",
                                  updated: Date(), succeeded: Date(), authorizationId: nil, type: nil, mpesa: nil, failure: nil,
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

    func testMoneyPatternConversion(){
        let money = Money(
            amount: 1000,
            currencyCode: "bhd"
        )
        XCTAssertEqual("BHD", money.currency.code)
        XCTAssertEqual(1000000, money.amountInMinorUnits)
    }

    func testFileUploadWorks(){
        let expectation = self.expectation(description: "Files")
        let url = URL(string: "\(baseUrl)/v1/files")!

        let mockedFile = FaluFile(id: "fl_123", created: Date(), updated: Date(), description: "", purpose: "customer.selfie", type: "png", fileName: "me.png", size: 10, expires: Date())
        let mock = Mock(url: url, dataType: .json, statusCode: 200, data: [.post: try! encoder.encode(mockedFile)])
        mock.register()

        let request = UploadRequest(
            file: Data(),
            fileName: "me.png",
            purpose: "customer.selfie",
            description: "Test description",
            expires: Date()
        )

        var file: FaluFile? = nil

        falu.createFile(request: request) { result in
            if case .success(let model) = result{
                file = model
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertNotNil(file)
    }
}
