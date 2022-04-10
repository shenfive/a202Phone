//
//  ViewController.swift
//  a202Phone
//
//  Created by 申潤五 on 2022/4/10.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var codeTF: UITextField!
    var verID = "AJOnW4SQznPySTx6FeN82vve7d47q77nClOo7OaM_IZNmvuWX5-1ngjA6zjSoCvbzQy729pay8JPGcQxWFJlVMMI1KvkATPBGSQM3DTp2FcjrjtSISpp3PHkRvQL6qtgczv-USxmFECvzod0BCwxHmaknY4fIfFhIy8euwXfjIuAZOHgJd9WLuqn1J0dgrnY0XOu6K6S7vu5ssLaHM9DUu8z8VahamxuKCtlzy-32IOeR8oV6PqHX9k"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                //已登
                print("phone:\(user.phoneNumber)")
            }else{
                //未登
                print("未登")
            }
        }
        
        
    }

    @IBAction func getCode(_ sender: Any) {
        let phoneNum = phoneTF.text ?? ""
        //檢查電話格式
        
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(phoneNum, uiDelegate: nil) { verificationID, error in
              if let error = error {
//                self.showMessagePrompt(error.localizedDescription)
                  print("error:\(error.localizedDescription)")
                return
              }
              print(verificationID)
              self.verID = verificationID ?? ""
              // Sign in using the verificationID and the code sent to the user
              // ...
          }
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        let code = codeTF.text ?? ""
        let credential = PhoneAuthProvider.provider().credential(
          withVerificationID: self.verID,
          verificationCode: code
        )
        Auth.auth().signIn(with: credential)
        
        
        
        
        
        
    }
}

