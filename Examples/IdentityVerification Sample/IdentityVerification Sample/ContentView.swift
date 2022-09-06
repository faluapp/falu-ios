import SwiftUI

struct ContentView: View {
    private var apiClient = IdentityVerificationApiClient()
    @State private var allowDrivingLicense = true
    @State private var allowPassport = true
    @State private var allowIdentityCard = true
    @State private var allowDocumentSelfie = false
    @State private var allowUploads = false
    @State private var loading = false

    var body: some View {
        NavigationView {
            List{
                DisclosureGroup("Available document types") {
                    VStack{
                        Toggle(isOn: $allowIdentityCard) {
                            Label("Identity Card", systemImage: "person.text.rectangle")
                        }
                        Toggle(isOn: $allowPassport) {
                            Label("Passport", systemImage: "person.crop.artframe")
                        }
                        Toggle(isOn: $allowDrivingLicense) {
                            Label("Driver License", systemImage: "car.circle.fill")
                        }
                    }
                }
                
                Section(header: Text("Identity Verification Options")) {
                    Toggle(isOn: $allowDocumentSelfie) {
                        Label("Use document and selfie", systemImage: "camera.circle.fill")
                    }
                    
                    Toggle(isOn: $allowUploads) {
                        Label("Allow uploads", systemImage: "tray.and.arrow.up")
                    }
                }
            }
            .navigationBarTitle("Identity Verification Sample", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if(loading){
                        ProgressView()
                    } else {
                        Button("Verify") {
                            createVerification()
                        }
                    }
                }
            }

        }
    }
    
    private func createVerification() {
        let options = IdentityVerificationOptions(
            allowUploads: allowUploads,
            document: optionsForDocument,
            selfie: optionsForSelfie
        )
        
        let request = IdentityVerificationCreationRequest(type: verificationType, returnUrl: nil, options: options)
       
        loading = true
        apiClient.createIdentityVerification(verification: request) { response, error in
            
            if (error != nil) {
                // show a network error here
                DispatchQueue.main.async {
                }
                return
            }
            
            guard let response = response else {
                return
            }
            
            DispatchQueue.main.async {
                if response.successful && response.resource != nil {
                    let verification = response.resource!
                    guard let url = URL(string: verification.url!   ) else { return }
                    UIApplication.shared.open(url)
                }
           
            }
        }
    }
    
    private var optionsForSelfie: IdentityVerificationOptionsForSelfie? {
        if(allowDocumentSelfie){
            return IdentityVerificationOptionsForSelfie()
        } else {
            return nil
        }
    }
    
    private var optionsForDocument: IdentityVerificationOptionsForDocument? {
        var allowed: [String] = []
        if (allowDrivingLicense){
            allowed.append("driving_license")
        } else if (allowPassport) {
            allowed.append("passport")
        } else if(allowIdentityCard) {
            allowed.append("id_card")
        }
        return IdentityVerificationOptionsForDocument(allowed:allowed)
    }
    
    private var verificationType: String{
        if(allowDocumentSelfie){
            return "document_and_selfie"
        }
        return "document"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
