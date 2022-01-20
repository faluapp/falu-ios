<a href="https://www.falu.io">
    <img src="https://cdn.falu.io/tools/logo.png" alt="Falu Logo" title="Falu" width="120" height="120" align="right">
</a>

# Falu iOS SDK

[![Falu](https://github.com/tinglesoftware/falu-ios/actions/workflows/swift.yml/badge.svg)](https://github.com/tinglesoftware/falu-ios/actions/workflows/swift.yml)
![Language](https://img.shields.io/badge/language-Swift%205.0-orange.svg)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/tinglesoftware/falu-ios?label=spm)

Falu's iOS SDK simplifies the process of building excellent financial services into iOS applications.
The SDK exposes APIs that will enable you to make payments and evaluate your client's credit worth.

# Installation  

## Swift Package Manager

Falu is available on SPM. Add the following to you package.

``` swift
import PackageDescription

let package = Package(
    dependencies: [
        .package(url: "https://github.com/tinglesoftware/falu-ios", from: 1.0.0)
    ]
)
```

# Getting Started

## Setup Guide

Follow our [Setup Guide](https://docs.falu.io/guides/developer/quickstart) to get started.

### Create an instance of Falu

```swift
let falu =  Falu("PUBLIC_KEY")
```

The [public key](https://docs.falu.io/guides/keys) is mandatory. Failing to provide it will result into an `Error` when interacting with Falu.

# Features

Once you have finished the setup process, you can proceed to use the features and functionalities offered by the SDK

## Evaluations

Use this feature when you want to know the credit score/worth of a  user.
This will allow you to know your user's spending habits from their financial statements.
Vist [Credit scoring customers using the Evaluations API](https://docs.falu.io/guides/evaluations) for more information relating to this.

```swift
let request = EvaluationRequest(
    currency: "kes",
    scope: .personal,
    provider: .mpesa,
    name: "JOHN DOE",
    phone: "+254712345678",
    password: "pass",
    file: "file_602a8dd0a54847479a874de5"
)

falu.createEvaluation(request: request) { result in
    if case .failure(let error) = result{
        DispatchQueue.main.async {
            // show errors on the UI thread
        }
    } else {
        DispatchQueue.main.async {
            // show on UI thread
        }
    }
}
```

## Payments

Create a `Payment` object when initiating payments from a customer.
Falu supports several payment methods including `MPESA`.
See [How to Authorize Payments](https://docs.falu.io/guides/payments/authorizations) and
[How to Accept Payments](https://docs.falu.io/guides/payments) for information.

```swift
let mpesa = MpesaPaymentRequest(
    phone: "+254722000000",
    reference: "254722000000",
    paybill: true
)

let request = PaymentRequest(amount: 100, currency: "kes", mpesa: mpesa)

falu.createPayment(request: request) { result in
    if case .failure(let error) = result{
        DispatchQueue.main.async {
            // show errors on the UI thread
        }
    } else {
        DispatchQueue.main.async {
            // show on UI thread
        }
    }
}
```
