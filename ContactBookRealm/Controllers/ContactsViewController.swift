import UIKit
import RealmSwift
import SwiftUI

class ContactsViewController: UIViewController {
    
    let realm = try! Realm()
    var contacts: Results<ContactModel>!

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = realm.objects(ContactModel.self)
    }
    
    @IBAction func addPressedBtn(_ sender: UIBarButtonItem) {
        let addContactVC = self.storyboard?.instantiateViewController(withIdentifier: "AddContactViewController") as! AddContactViewController
        addContactVC.title = "Add Contact"
        addContactVC.delegateAdd = self
        
        navigationController?.pushViewController(addContactVC, animated: true)
    }

}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if contacts.count != 0{
            return contacts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = 80
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewCell") as? ContactTableViewCell
        cell?.accessoryType = .none
        
        let contact = contacts[indexPath.row]
        cell?.contactFullName.text = contact.fullName
        cell?.contactPhoneNumber.text = contact.phoneNumber
        cell?.contactImageView.image = UIImage.init(named: contact.gender!)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoContactVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoContactViewController") as! InfoContactViewController
        infoContactVC.title = "Contact Info"
        let index = myTableView.indexPathForSelectedRow?.row
        
        let contact = contacts[index!]
        infoContactVC.name_surname = contact.fullName
        infoContactVC.phone_number = contact.phoneNumber
        infoContactVC.gender = UIImage.init(named: contact.gender!)
        infoContactVC.currentIndex = index
        infoContactVC.delegateDelete = self
        
        navigationController?.pushViewController(infoContactVC, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let editingRow = contacts[indexPath.row]
        try! self.realm.write({
            self.realm.delete(editingRow)
        })
        myTableView.deleteRows(at: [indexPath], with: .automatic)
    }
}

extension ContactsViewController: editContact {
    func addContact(fullName: String?, phone: String?, gender: String?) {
        let contact = ContactModel()
        contact.fullName = fullName
        contact.phoneNumber = phone
        contact.gender = gender
        
        try! self.realm.write({
            self.realm.add(contact)
        })
        
        myTableView.reloadData()
    }
    
    func deleteContact(index i: Int?) {
        let editingRow = contacts[i!]
        try! self.realm.write({
            self.realm.delete(editingRow)
        })
        myTableView.reloadData()
    }
}
