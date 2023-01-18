//
//  PrimerIPay88Payment.swift
//  PrimerIPay88SDK
//
//  Created by Evangelos on 12/12/22.
//

#if canImport(UIKit)

import Foundation

public class PrimerIPay88Payment: NSObject {
    
    public internal(set) var paymentId: String
    public internal(set) var merchantKey: String
    public internal(set) var merchantCode: String
    public internal(set) var refNo: String
    public internal(set) var amount: String
    public internal(set) var currency: String
    public internal(set) var prodDesc: String
    public internal(set) var userName: String
    public internal(set) var userEmail: String
    public internal(set) var userContact: String
    public internal(set) var country: String
    public internal(set) var backendPostURL: String
    public internal(set) var remark: String?
    public internal(set) var lang: String?
    
    public internal(set) var transId: String?
    public internal(set) var authorizationCode: String?
    
    public init(
        amount: String,
        currency: String,
        paymentId: String,
        merchantKey: String,
        merchantCode: String,
        refNo: String,
        prodDesc: String,
        userName: String,
        userEmail: String,
        userContact: String,
        country: String,
        backendPostURL: String,
        remark: String?,
        lang: String?
    ) {
        self.amount = amount
        self.currency = currency
        self.paymentId = paymentId
        self.merchantKey = merchantKey
        self.merchantCode = merchantCode
        self.refNo = refNo
        self.prodDesc = prodDesc
        self.userName = userName
        self.userEmail = userEmail
        self.userContact = userContact
        self.country = country
        self.backendPostURL = backendPostURL
        self.remark = remark
        self.lang = lang
        super.init()
    }
    
    internal var iPay88Payment: IpayPayment {
        let iPay88Payment = IpayPayment()
        iPay88Payment.paymentId = self.paymentId
        iPay88Payment.merchantKey = self.merchantKey
        iPay88Payment.merchantCode = self.merchantCode
        iPay88Payment.refNo = self.refNo
        iPay88Payment.amount = self.amount
        iPay88Payment.currency = self.currency
        iPay88Payment.prodDesc = self.prodDesc
        iPay88Payment.userName = self.userName
        iPay88Payment.userEmail = self.userEmail
        iPay88Payment.userContact = self.userContact
        iPay88Payment.remark = self.remark
        iPay88Payment.lang = self.lang
        iPay88Payment.country = self.country
        iPay88Payment.backendPostURL = self.backendPostURL
        return iPay88Payment
    }
}

#endif
