import Foundation
import FirebaseDatabase

public class DatabaseManager {

    static let shared = DatabaseManager()

    private let database = Database.database().reference()

    /// Check if username and email is available
    ///
    /// - Parameters:
    ///   - email:
    ///   - username:
    ///   - completion:
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }

    /// Inserts new user to database
    ///
    /// - Parameters:
    ///   - email:
    ///   - username:
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
            } else {
                // failed
                completion(false)
                return
            }
        }
    }


}
