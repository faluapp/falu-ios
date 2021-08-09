struct Falu {
    var text = "Hello, World!"
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
    
}
