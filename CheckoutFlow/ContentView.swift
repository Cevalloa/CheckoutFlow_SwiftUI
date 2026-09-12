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
                
                List() {
                    Section {
                        ForEach(viewModel.items) { item in
                            HStack {
                                Text(item.name)
                                Text("\(item.quantity)")
                                Text("\(Double(item.quantity) * item.price)")
                            }
                        }
                    }
                    Section {
                        Text("Total: \(viewModel.total)")
                    }
                    
                    Section {
                        ForEach(viewModel.paymentMethods) { paymentMethod in
                            HStack {
                                Text(paymentMethod.type)
                                Text(paymentMethod.lastFour)
                                Button {
                                    viewModel.selectPaymentMethod(paymentMethod)
                                } label: {
                                    Text(viewModel.selectedPaymentMethodID == paymentMethod.id
                                         ? "Selected payment"
                                         : ""
                                    )
                                }
                            }
                        }
                    }
                    
                    Section {
                        Button {
                            if viewModel.canPlaceOrder {
                                viewModel.isOrderPlaced = true
                            }
                        } label: {
                            Text("Place order")
                        }
                        .disabled(!viewModel.canPlaceOrder)
                    }
                }
                
            }
            .navigationTitle("Checkout")
        }
        .task {
            // TODO: Trigger the initial checkout load.
            await viewModel.load()
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
