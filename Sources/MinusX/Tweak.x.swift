import Orion
import MinusXC
import UIKit
import os

@available(iOS 13.0, *)
class SBMinusCloseBoxViewHook: ClassHook<UIButton> {
    static var targetName: String = "SBMinusCloseBoxView"
    
    func layoutSubviews() {
        orig.layoutSubviews()
        
//      orig.target.setImage(UIImage(systemName: "xmark"), for: [])
//      This is what I have originaly tried, but it does not work - it also replaces the button background
        
        for subview1 in orig.target.subviews {
            if subview1.isKind(of: Dynamic.SBHomeScreenMaterialView.class) {
                for subview2 in subview1.subviews {
                    if let imageView = subview2 as? UIImageView {
//                      subview2.isHidden = true
//                      Removes the icon
                        
                        imageView.image = UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: subview1.frame.size.width * 0.4, weight: .bold))
                        imageView.tintColor = .darkGray
                        
                        let size1 = subview1.frame.size
                        imageView.frame = CGRect(origin: CGPoint(x: size1.width * 0.3, y: size1.height * 0.3), size: CGSize(width: size1.width * 0.4, height: size1.height * 0.4))
                    }
                }
            }
        }
    }
}
