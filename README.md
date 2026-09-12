# CheckoutFlow

A small SwiftUI checkout app built with native iOS APIs.

## Overview

Complete the checkout experience using the bundled `checkout.json` data.

### Functionality

- Load and decode the bundled checkout data.
- Display every cart item with its name, quantity, and line total.
- Calculate and display:
  - Subtotal
  - Delivery fee
  - Tax
  - Final total
- Display the available payment methods.
- Allow exactly one payment method to be selected at a time.
- Disable **Place Order** until the cart contains items and a payment method is selected.
- Show an order confirmation after a valid order is placed.
- Provide appropriate loading, error, and empty-cart states.

## Technical Details

- SwiftUI
- iOS 17+
- Swift Observation (`@Observable`)
- Swift Concurrency (`async` / `await`)
- Local JSON decoding with `Decodable`
- No third-party dependencies

## Optional Extension

Allow the quantity of each cart item to be increased or decreased and have all totals update immediately.

<img width="334" height="705" alt="Screenshot 2026-09-12 at 11 13 19 AM" src="https://github.com/user-attachments/assets/ee2c8885-3382-4d2a-8316-5c1984956253" />

