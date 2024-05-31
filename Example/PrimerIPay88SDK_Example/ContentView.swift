//
//  ContentView.swift
//  PrimerIPay88SDK_Example
//
//  Created by Jack Newcombe on 31/05/2024.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import SwiftUI
import PrimerIPay88MYSDK

struct WrapperView: UIViewControllerRepresentable {

    let delegate: IPay88ViewControllerDelegate = .init()

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let payment = PrimerIPay88Payment(merchantCode: "merchant_code",
                                          paymentId: "payment_id",
                                          refNo: "ref_no",
                                          amount: "amount",
                                          currency: "currency",
                                          prodDesc: "prod_desc",
                                          userName: "user_name",
                                          userEmail: "user_email",
                                          userContact: "user_contact",
                                          remark: "remark",
                                          lang: "lang",
                                          country: "country",
                                          backendPostURL: "https://backend_post_url",
                                          appdeeplink: "merchant://app",
                                          actionType: nil,
                                          tokenId: nil,
                                          promoCode: nil,
                                          fixPaymentId: nil,
                                          transId: nil,
                                          authCode: nil)
        let viewController = PrimerIPay88ViewController(delegate: delegate,
                                                        payment: payment)

        return viewController
    }
}

struct ContentView: View {

    var body: some View {
        WrapperView()
    }
}

class IPay88ViewControllerDelegate: PrimerIPay88ViewControllerDelegate {
    func primerIPay88ViewDidLoad() {
        //
    }
    
    func primerIPay88PaymentSessionCompleted(payment: PrimerIPay88MYSDK.PrimerIPay88Payment?, error: PrimerIPay88MYSDK.PrimerIPay88Error?) {
        //
    }
    
    func primerIPay88PaymentCancelled(payment: PrimerIPay88MYSDK.PrimerIPay88Payment?, error: PrimerIPay88MYSDK.PrimerIPay88Error?) {
        //
    }
}

#Preview {
    ContentView()
}
