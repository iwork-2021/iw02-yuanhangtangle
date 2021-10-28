//
//  ItemViewController.swift
//  MyTodo
//
//  Created by yuanhang tangle on 2021/10/27.
//  Copyright © 2021 yuanhang. All rights reserved.
//

import UIKit

protocol AddItemDelegate {
    func addItem(item: TodoItem)
}
	
protocol EditItemDelegate {
    func editItem(newItem: TodoItem, itemIndex: Int)
}

class ItemViewController: UIViewController {

    @IBOutlet weak var isCheck: UISwitch!
    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var addItemDelegate: AddItemDelegate?
    var editItemDelegate: EditItemDelegate?
    var itemToEdit: TodoItem?
    var itemIndex:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        if itemToEdit != nil{
            doneButton.isEnabled = true
            self.titleInput.text! = itemToEdit!.title
            self.isCheck.isOn = itemToEdit!.isChecked
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func done(_ sender: Any) {
        if itemToEdit == nil{
            self.addItemDelegate?.addItem(item: TodoItem(title: titleInput.text!, isChecked: isCheck.isOn))
        }else{
            self.editItemDelegate?.editItem(newItem: TodoItem(title: titleInput.text!, isChecked: isCheck.isOn), itemIndex: self.itemIndex)
        }
        self.dismiss(animated: true, completion: nil)
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

extension ItemViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let StringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: StringRange, with: string)
        doneButton.isEnabled = !newText.isEmpty
        return true
    }
}
