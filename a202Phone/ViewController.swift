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
    
    var verID = "AJOnW4SQznPySTx6FeN82vve7d47q77nClOo7OaM_IZNmvuWX5-1ngjA6zjSoCvbzQy729pay8JPGcQxWFJlVMMI1KvkATPBGSQM3DTp2FcjrjtSISpp3PHkRvQL6qtgczv-USxmFECvzod0BCwxHmaknY4fIfFhIy8euwXfjIuAZOHgJd9WLuqn1J0dgrnY0XOu6K6S7vu5ssLaHM9DUu8z8VahamxuKCtlzy-32IOeR8oV6PqHX9k"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
              
              // Sign in using the verificationID and the code sent to the user
              // ...
          }
        
    }
    
}

