//
//  IndicatorImageView.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 19/03/21.
//

import UIKit

class IndicatorImageView: UIImageView {
    
    private let activityIdicator = UIActivityIndicatorView()

    override var image: UIImage? {
        didSet{
            if image != nil {
                activityIdicator.stopAnimating()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        activityIdicator.color = .black
        activityIdicator.hidesWhenStopped = true
        activityIdicator.startAnimating()
        activityIdicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIdicator)
        activityIdicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIdicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 6)
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    /*
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
 */

}
