import Foundation
import Observation

@MainActor
@Observable
final class CheckoutViewModel {
    private let service: CheckoutService

    var items: [CartItem] = []
    var paymentMethods: [PaymentMethod] = []
    var selectedPaymentMethodID: Int?

    var deliveryFee: Double = 0
    var taxRate: Double = 0

    var isLoading = false
    var errorMessage: String?
    var isOrderPlaced = false

    init(service: CheckoutService = CheckoutService()) {
        self.service = service
    }

    var subtotal: Double {
        // TODO: Calculate the subtotal from item price and quantity.
        0
    }

    var tax: Double {
        // TODO: Calculate tax from the subtotal and tax rate.
        0
    }

    var total: Double {
        // TODO: Calculate the final total.
        0
    }

    var canPlaceOrder: Bool {
        // TODO: An order should only be placeable when the cart is not empty
        // and a payment method has been selected.
        false
    }

    func load() async {
        // TODO:
        // 1. Set loading state.
        // 2. Clear any previous error.
        // 3. Load CheckoutData from the service.
        // 4. Copy the loaded values into the observable properties above.
        // 5. Handle errors and restore loading state.
    }

    func selectPaymentMethod(_ paymentMethod: PaymentMethod) {
        // TODO: Select exactly one payment method.
    }

    func placeOrder() {
        // TODO: Mark the order as placed only when the current state is valid.
    }
}
