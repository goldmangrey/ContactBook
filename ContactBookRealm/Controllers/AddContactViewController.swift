import UIKit

class AddContactViewController: UIViewController {
    
    var pickers = ["male", "female"]
    public var completion: ((String, String, String) -> Void)?
    
    var delegateAdd: editContact?
    
    @IBOutlet weak var addNameSurname: UITextField!
    @IBOutlet weak var addPhoneNumber: UITextField!
    @IBOutlet weak var choosedGender: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let fullname = addNameSurname.text
        let number = addPhoneNumber.text
        var gender = choosedGender.text
        
        if (gender != pickers[1]){
            gender = pickers[0]
        }

        if !fullname!.isEmpty, !number!.isEmpty{
            delegateAdd?.addContact(fullName: fullname, phone: number, gender: gender)
            navigationController?.popToRootViewController(animated: true)
        }
    }
    
}

extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        choosedGender.text = pickers[row]
    }
}
