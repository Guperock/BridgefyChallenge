//
//  TabContainerViewController.swift
//  BridgefyChallenge
//
//  Created by Eduardo Gutierrez Pastrana on 18/03/21.
//

import UIKit

class TabContainerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init(firstView: UIViewController, secondView: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        firstView.tabBarItem = UITabBarItem(title: "Countries", image: UIImage(named: "CountriesOn"), selectedImage: UIImage(named: "CountriesOff"))
        secondView.tabBarItem = UITabBarItem(title: "BLE", image: UIImage(named: "BLEOn"), selectedImage: UIImage(named: "BLEOff"))
        self.viewControllers = [firstView, secondView]
        self.tabBar.tintColor = .getAssentColor()
        self.view.backgroundColor = .lightGray
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
