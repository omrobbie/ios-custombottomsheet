//
//  BottomSheetViewController.swift
//  CustomBottomSheet
//
//  Created by omrobbie on 20/04/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController {

    var viewHeight: CGFloat = 50

    fileprivate let screenSize: CGFloat = UIScreen.main.bounds.height
    fileprivate lazy var yPos: CGFloat = screenSize - viewHeight

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPanGestureRecognizer()
        view.frame = UIScreen.main.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateFrame(yPos: screenSize)
        UIView.animate(withDuration: 0.2, animations: {
            self.updateFrame(yPos: self.yPos - 20)
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                self.updateFrame(yPos: self.yPos)
            }
        }
    }

    func bringToFront(_ sender: UIViewController) {
        if view.isDescendant(of: sender.view.window!) {
            removeFromSuperview()
        } else {
            sender.view.window!.addSubview(view)
        }
    }

    func removeFromSuperview() {
        UIView.animate(withDuration: 0.2, animations: {
            self.updateFrame(yPos: self.screenSize)
        }) { (_) in
            self.view.removeFromSuperview()
        }
    }

    fileprivate func updateFrame(yPos: CGFloat) {
        let width = view.frame.width
        let height = view.frame.height
        view.frame = CGRect(x: 0, y: yPos, width: width, height: height)
    }

    fileprivate func updateFrame(panGestureRecognizer pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: view)
        let minY = view.frame.minY

        if (minY + translation.y) > 20 {
            updateFrame(yPos: minY + translation.y)
            pan.setTranslation(CGPoint.zero, in: view)
        }
    }

    fileprivate func setupPanGestureRecognizer() {
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(panGestureRecognizer))
        view.addGestureRecognizer(gesture)
    }

    @objc private func panGestureRecognizer(_ panGestureRecognizer: UIPanGestureRecognizer) {
        updateFrame(panGestureRecognizer: panGestureRecognizer)

        if panGestureRecognizer.state == .ended {
            if panGestureRecognizer.velocity(in: self.view).y >= 0 {
                self.removeFromSuperview()
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.updateFrame(yPos: self.yPos)
                }
            }
        }
    }
}
