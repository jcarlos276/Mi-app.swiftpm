import SwiftUI

struct ServiceError: Error, Codable {
    let statusCode: Int
    let statusMessage: String
    
    init(statusCode: Int = 0, statusMessage: String = "Unknown") {
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
}
