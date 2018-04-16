//
//  ViewController.swift
//  mo-stack
//
//  Created by Garvan Keeley on 2018-04-16.
//  Copyright © 2018 garvankeeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var topLevelStack: UIStackView!
    @IBOutlet weak var pageInfo_topStack: UIStackView!
    @IBOutlet weak var hiddenLabel: UILabel!
    @IBOutlet weak var popupHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("hello")
        self.hiddenLabel.alpha = 0

        popup.layer.cornerRadius = 8
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 3.0) {
                self.popupHeight.constant = 100
                self.topLevelStack.arrangedSubviews.forEach {
                    if $0 != self.pageInfo_topStack,$0 is UIStackView {
                        $0.removeFromSuperview()
                    }
                    if $0 is HorizontalSeparatorView {
                        $0.removeFromSuperview()
                    }
                }
                self.hiddenLabel.isHidden = false
                self.view.layoutIfNeeded()
                self.hiddenLabel.alpha = 1
            }
        }
    }

}

private let onePixelInPoints = 1 / UIScreen.main.scale
@IBDesignable
public class HorizontalSeparatorView: UIView {
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: onePixelInPoints)
    }
}
