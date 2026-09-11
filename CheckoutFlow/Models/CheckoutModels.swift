import Foundation

struct CartItem: Decodable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let quantity: Int
}

struct PaymentMethod: Decodable, Identifiable {
    let id: Int
    let type: String
    let lastFour: String
}

struct CheckoutData: Decodable {
    let items: [CartItem]
    let paymentMethods: [PaymentMethod]
    let deliveryFee: Double
    let taxRate: Double
}
