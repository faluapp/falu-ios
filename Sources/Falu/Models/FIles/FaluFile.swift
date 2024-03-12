import Foundation

public class FaluFile: Codable {

    /// Unique identifier for the file.
    public var id: String = ""


    /// Time at which the file was created.
    public var created: Date? = nil


    /// Time at which the object was last updated
    public var updated: Date? = nil


    /// An optional arbitrary string attached to the file. Mainly used to describe the object and often useful for displaying to users.
    public var description: String? = nil


    /// Purpose for a file.
    public var purpose: String? = nil


    /// Type of file.
    public var type: String? = nil


    /// A name of the file suitable for saving to a filesystem.
    public var fileName: String?  = nil


    /// Size in bytes of the file.
    public var size: Int64 = 0


    /// Time at which the file expires.
    public var expires: Date? = nil

    internal init(id: String, created: Date = Date(), updated: Date?, description: String, purpose: String, type: String?, fileName: String, size: Int64 = 0, expires: Date?){
        self.id = id
        self.created = created
        self.updated = updated
        self.description = description
        self.purpose = purpose
        self.type = type
        self.fileName = fileName
        self.size = size
        self.expires = expires
    }
}
