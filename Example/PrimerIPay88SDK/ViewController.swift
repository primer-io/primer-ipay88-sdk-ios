//
//  ViewController.swift
//  PrimerIPay88SDK
//
//  Created by EvansPie on 12/12/2022.
//  Copyright (c) 2022 EvansPie. All rights reserved.
//

import PrimerIPay88SDK
import UIKit

class ViewController: UIViewController, PrimerIPay88ViewControllerDelegate {
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        PrimerIPay88().test()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let payment = PrimerIPay88Payment(
            amount: "1.00",
            currency: "MYR",
            paymentId: "payment-id",
            merchantKey: "",
            merchantCode: "M05133",
            refNo: "Z001",
            prodDesc: "Galaxy Tab1111",
            userName: "Angela",
            userEmail: "angela@ipay.com",
            userContact: "60123456789",
            country: "MY",
            backendPostURL: "http://www.mobile88.com/epayment/testing/RequestForm_savetemp.asp",
            remark: nil,
            lang: "UTF-8")
        
        let vc = PrimerIPay88SDK.PrimerIPay88ViewController(delegate: self, payment: payment)
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.present(vc, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func primerIPay88ViewDidLoad() {
        
    }
    
    func primerIPay88PaymentSessionCompleted(payment: PrimerIPay88Payment?, error: PrimerIPay88SDK.PrimerIPay88Error?) {
        self.dismiss(animated: true) {
//            self.vc = nil
        }
        
    }
}

