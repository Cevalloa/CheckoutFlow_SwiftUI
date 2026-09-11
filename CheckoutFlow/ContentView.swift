import SwiftUI

struct ContentView: View {
    @State private var viewModel = CheckoutViewModel()

    var body: some View {
        NavigationStack {
            Group {
                // TODO: Build the checkout UI.
                //
                // Include:
                // - loading state
                // - error state
                // - empty-cart state
                // - cart item rows
                // - subtotal, delivery fee, tax, and total
                // - payment-method selection
                // - a Place Order button
                Text("Checkout")
            }
            .navigationTitle("Checkout")
        }
        .task {
            // TODO: Trigger the initial checkout load.
        }
        .alert("Order Confirmed", isPresented: $viewModel.isOrderPlaced) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Your order has been placed.")
        }
    }
}

#Preview {
    ContentView()
}
