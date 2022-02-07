import Foundation

public struct UploadRequest{
    
    /// Contents of the file. It should follow the specifications of RFC 2388
    let file: Data
    
    
    /// Name of the file being uploaded
    let fileName: String
    
    
    /// Purpose of the file upload
    let purpose: String
    
    
    /// The description of the upload
    let description: String?
    
    
    /// The time which the file expires
    let expires: Date?
    
    public init(
        file: Data,
        fileName: String,
        purpose: String,
        description:String? = nil,
        expires: Date? = nil){
        self.file = file
        self.fileName = fileName
        self.purpose = purpose
        self.description = description
        self.expires = expires
    }
    
}
