
#if canImport(UIKit)

import UIKit

public protocol PrimerIPay88ViewControllerDelegate: AnyObject {
    func primerIPay88ViewDidLoad()
    func primerIPay88PaymentSessionCompleted(payment: PrimerIPay88Payment?, error: PrimerIPay88Error?)
    func primerIPay88PaymentCancelled(payment: PrimerIPay88Payment?, error: PrimerIPay88Error?)
}

public class PrimerIPay88ViewController: UIViewController {

    private let iPay88SDK = Ipay()
    private let payment: PrimerIPay88Payment
    private weak var iPay88PaymentView: UIView!
    private let iPay88DelegateProxy = IPay88DelegateProxy()
    public weak var delegate: PrimerIPay88ViewControllerDelegate?
    
    public init(delegate: PrimerIPay88ViewControllerDelegate, payment: PrimerIPay88Payment) {
        self.payment = payment
        self.delegate = delegate
        self.iPay88SDK.delegate = self.iPay88DelegateProxy
        
        super.init(nibName: nil, bundle: nil)
        
        self.iPay88DelegateProxy.paymentSucceeded = { [weak self] refNo, transId, amount, remark, authCode in
            if let refNo {
                self?.payment.refNo = refNo
            }
            
            self?.payment.transId = transId
            
            if let amount {
                self?.payment.amount = amount
            }

            self?.payment.remark = remark
            self?.payment.authorizationCode = authCode
            
            self?.delegate?.primerIPay88PaymentSessionCompleted(payment: self?.payment, error: nil)
        }
        
        self.iPay88DelegateProxy.paymentFailed = { [weak self] refNo, transId, amount, remark, errDesc in
            if let refNo {
                self?.payment.refNo = refNo
            }
            
            self?.payment.transId = transId
            
            if let amount {
                self?.payment.amount = amount
            }

            self?.payment.remark = remark
            
            if let errDesc {
                let err = PrimerIPay88Error.iPay88Error(description: errDesc, userInfo: nil)
                self?.delegate?.primerIPay88PaymentSessionCompleted(payment: self?.payment, error: err)
            }
        }
        
        self.iPay88DelegateProxy.paymentCancelled = { [weak self] refNo, transId, amount, remark, errDesc in
            if let refNo {
                self?.payment.refNo = refNo
            }
            
            self?.payment.transId = transId
            
            if let amount {
                self?.payment.amount = amount
            }

            self?.payment.remark = remark
            
            var err: PrimerIPay88Error?
            if let errDesc {
                err = PrimerIPay88Error.iPay88Error(description: errDesc, userInfo: nil)
            }
            
            self?.delegate?.primerIPay88PaymentCancelled(payment: self?.payment, error: err)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.render()
        self.delegate?.primerIPay88ViewDidLoad()
    }
    
    private func render() {
        self.iPay88PaymentView = self.iPay88SDK.checkout(self.payment.iPay88Payment)
        self.iPay88PaymentView = self.iPay88SDK.checkout(self.payment.iPay88Payment)
        self.view.addSubview(self.iPay88PaymentView)
        
        self.iPay88PaymentView.translatesAutoresizingMaskIntoConstraints = false
        self.iPay88PaymentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0).isActive = true
        self.iPay88PaymentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        self.iPay88PaymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -0.0).isActive = true
        self.iPay88PaymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
}

class IPay88DelegateProxy: NSObject, PaymentResultDelegate {
    
    var paymentSucceeded: ((_ refNo: String?, _ transId: String?, _ amount: String?, _ remark: String?, _ authCode: String?) -> Void)?
    var paymentFailed: ((_ refNo: String?, _ transId: String?, _ amount: String?, _ remark: String?, _ errDesc: String?) -> Void)?
    var paymentCancelled: ((_ refNo: String?, _ transId: String?, _ amount: String?, _ remark: String?, _ errDesc: String?) -> Void)?
    
    public func paymentSuccess(_ refNo: String!, withTransId transId: String!, withAmount amount: String!, withRemark remark: String!, withAuthCode authCode: String!) {
        self.paymentSucceeded?(refNo, transId, amount, remark, authCode)
    }
    
    public func paymentFailed(_ refNo: String!, withTransId transId: String!, withAmount amount: String!, withRemark remark: String!, withErrDesc errDesc: String!) {
        // "Duplicate reference number"
        // "Invalid merchant"
        // "Invalid parameters"
        // "Overlimit per transaction"
        // "Payment not allowed"
        // "Permission not allow"
        // "Signature not match"
        // "Status not approved"
        // "Transaction Timeout"
        self.paymentFailed?(refNo, transId, amount, remark, errDesc)
    }
    
    public func paymentCancelled(_ refNo: String!, withTransId transId: String!, withAmount amount: String!, withRemark remark: String!, withErrDesc errDesc: String!) {
        self.paymentCancelled?(refNo, transId, amount, remark, errDesc)
    }
    
    public func requerySuccess(_ refNo: String!, withMerchantCode merchantCode: String!, withAmount amount: String!, withResult result: String!) {
        
    }
    
    public func requeryFailed(_ refNo: String!, withMerchantCode merchantCode: String!, withAmount amount: String!, withErrDesc errDesc: String!) {

    }
}

#endif
