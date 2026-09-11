import Foundation

enum CheckoutServiceError: Error {
    case fileNotFound
}

struct CheckoutService {
    func loadCheckout() async throws -> CheckoutData {
        guard let url = Bundle.main.url(forResource: "checkout", withExtension: "json") else {
            throw CheckoutServiceError.fileNotFound
        }

        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(CheckoutData.self, from: data)
    }
}
