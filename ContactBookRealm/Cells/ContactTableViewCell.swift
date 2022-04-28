import UIKit

class ContactTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var contactFullName: UILabel!
    
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
