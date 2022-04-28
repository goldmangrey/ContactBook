import UIKit
import RealmSwift

protocol editContact{
    func deleteContact(index i: Int?)
    func addContact(fullName: String?, phone: String?, gender: String?)
}

class ContactModel: Object {
    @objc dynamic var fullName: String?
    @objc dynamic var phoneNumber: String?
    @objc dynamic var gender: String?
}
