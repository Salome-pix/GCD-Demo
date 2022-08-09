//
//  ViewController.swift
//  HM#20
//
//  Created by Mcbook Pro on 09.08.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printButton.addTarget(self, action: #selector(printPrime), for: .touchUpInside)
    }

    @objc func printPrime(){
        self.printButton.isEnabled = false
        let queue = DispatchQueue.global(qos: .default)
        
        queue.async {
           
            for each in 1...100_000 {
                if self.isPrime(num: each) {
                    print(each)
                }
            }
            
            DispatchQueue.main.async {
                self.printButton.isEnabled = true
            }
        }
        
        
}

    private func isPrime(num: Int) -> Bool {
            if num < 2 {
                return false
            }
            
            for i in 2..<num {
                if num % i == 0 {
                    return false
                }
            }
            
            return true
        }

    
}
