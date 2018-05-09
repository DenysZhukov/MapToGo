//
//  MainContainerViewController.swift
//  MapToGo
//
//  Created by Denys on 5/8/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

class MainContainerViewController: UIViewController {
    
    var contentViewController: UIViewController?
    @IBOutlet weak var contentView: UIView!
    var nextTransitionBlock: VoidClosure?
    var inTransition = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showContentController(controller: UIViewController) {
        childViewControllers.count > 0 ?
            transitToContentController(controller: controller) :
            displayContentController(childController: controller)
    }
    
    func transitToContentController(controller: UIViewController) {
        inTransition ?
            setNextTransitionWithController(controller: controller) :
            performTransitionToController(controller: controller)
    }
    
    func setNextTransitionWithController(controller: UIViewController) {
        nextTransitionBlock = { [weak self] in
            self?.performTransitionToController(controller: controller)
        }
    }
    
    func performTransitionToController(controller: UIViewController) {
        guard contentViewController != controller else {return}
        inTransition = true
        transitionToContentController(controller: controller) { [weak self] in
            self?.inTransition = false
            self?.performNextTransition()
        }
    }
    
    func performNextTransition() {
        nextTransitionBlock?()
        nextTransitionBlock = nil
    }
    
    func displayContentController(childController: UIViewController) {
        addChildViewController(childController)
        childController.view.frame = contentView.bounds
        contentView.addSubview(childController.view!)
        childController.didMove(toParentViewController: self)
        contentViewController = childController
    }
    
    func transitionToContentController(controller: UIViewController, completion: VoidClosure) {
        guard let contentVC = contentViewController else {return}
        contentVC.willMove(toParentViewController: nil)
        controller.view.frame = contentView.bounds
        addChildViewController(controller)
        contentVC.view.removeFromSuperview()
        contentView.addSubview(controller.view)
        self.contentViewController?.removeFromParentViewController()
        controller.didMove(toParentViewController: self)
        self.contentViewController? = controller
        completion()
    }
}
