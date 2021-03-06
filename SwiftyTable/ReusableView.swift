//Taken from: https://medium.com/@gonzalezreal/ios-cell-registration-reusing-with-swift-protocol-extensions-and-generics-c5ac4fb5b75e#.7c83ysimq


import Foundation
import UIKit

//TODO: Do I need to put the class requirement back in there?
public protocol ReusableView {}//: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(self)
    }
}

//Yep, all UITableViewCells get a reuseIdentifier now. Deal with it.
extension UITableViewCell: ReusableView{}