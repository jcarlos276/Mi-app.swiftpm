import SwiftUI

struct ServiceError: Error, Decodable {
    let status_code: Int
    let status_message: String
    
    init(status_code: Int = 0, status_message: String = "Unknown") {
        self.status_code = status_code
        self.status_message = status_message
    }
}
