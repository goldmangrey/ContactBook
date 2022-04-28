import UIKit

class InfoContactViewController: UIViewController {
    
    var name_surname: String?
    var phone_number: String?
    var gender: UIImage?
    
    var delegateDelete: editContact?
    var currentIndex: Int?
    
    
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoFullName: UILabel!
    @IBOutlet weak var infoPhoneNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoFullName.text = name_surname
        infoPhoneNumber.text = phone_number
        infoImageView.image = gender
        
    }
    
    
    @IBAction func deletePressed(_ sender: UIButton) {
        delegateDelete?.deleteContact(index: currentIndex)
        navigationController?.popViewController(animated: true)
    }
    
}
