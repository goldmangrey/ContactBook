import RealmSwift
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

class Contact: Object {
    @objc dynamic var fullName: String?
    @objc dynamic var phoneNumber: String?
    @objc dynamic var image: String
    
    init(fullName: String, phoneNumber: String?, image: String){
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.image = image
    }
    
}
