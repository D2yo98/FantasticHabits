//
//  AddItemViewController.swift
//  FantasticHabits
//
//  Created by 도성현 on 2023/07/28.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func itemAdded(title: String)
}

class AddItemViewController: UIViewController {


    
    @IBOutlet weak var textField: UITextField!
    var delegate: AddItemViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
        if let text = textField.text{
            if let delegate = delegate {
                delegate.itemAdded(title: text)
            }
            dismiss(animated: true)

        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
