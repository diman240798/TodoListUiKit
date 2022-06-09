import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "ic_checkbox_checked")! as UIImage
    let uncheckedImage = UIImage(named: "ic_checkbox")! as UIImage
    
    // Click Listener
    var checkedListener: ((Bool) -> Void)? = nil
    func setOnCheckedListener(listener: ((Bool) -> Void)?) {
        self.checkedListener = listener
    }
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            self.checkedListener?(isChecked)
        }
    }
}
