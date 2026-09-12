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
        return items.map { cartItem in
            cartItem.price
        }.reduce(0, +)
    }

    var tax: Double {
        // TODO: Calculate tax from the subtotal and tax rate.
        return subtotal * taxRate
    }

    var total: Double {
        // TODO: Calculate the final total.
        subtotal + tax + deliveryFee
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
        errorMessage = nil
        isLoading = true
        
        do {
            let checkoutData = try await service.loadCheckout()
            items = checkoutData.items
            paymentMethods = checkoutData.paymentMethods
            deliveryFee = checkoutData.deliveryFee
            taxRate = checkoutData.taxRate
            
            isLoading = false
        } catch {
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }

    func selectPaymentMethod(_ paymentMethod: PaymentMethod) {
        // TODO: Select exactly one payment method.
        selectedPaymentMethodID = paymentMethod.id
    }

    func placeOrder() {
        // TODO: Mark the order as placed only when the current state is valid.
    }
}
