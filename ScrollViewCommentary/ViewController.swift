//
//  ViewController.swift
//  ScrollViewCommentary
//
//  Created by Jonathon Staff on 6/16/16.
//  Copyright © 2016 Nplexity LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  weak var scrollView: UIScrollView!
  weak var boundsLabel: UILabel!
  weak var contentOffsetLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    view.translatesAutoresizingMaskIntoConstraints = false

    scrollView = createScrollView()
    boundsLabel = createBoundsLabel()
    contentOffsetLabel = createContentOffsetLabel()

    NSLayoutConstraint(item: boundsLabel,
                       attribute: .Bottom,
                       relatedBy: .Equal,
                       toItem: contentOffsetLabel,
                       attribute: .Top,
                       multiplier: 1.0,
                       constant: -8).active = true
  }
}

private extension ViewController {
  func createScrollView() -> UIScrollView {
    let scrollView = UIScrollView()
    scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
    scrollView.frame = CGRect(origin: .zero, size: view.bounds.size)
    view.addSubview(scrollView)

    let image = UIImage(named: "death-valley")
    let imageView = UIImageView(image: image)
    imageView.center.y = scrollView.center.y

    scrollView.addSubview(imageView)
    scrollView.contentSize.width = CGRectGetWidth(imageView.bounds)

    scrollView.delegate = self
    return scrollView
  }

  func createBoundsLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .whiteColor()
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint(item: label,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true

    return label
  }

  func createContentOffsetLabel() -> UILabel {
    let label = UILabel()
    label.textColor = .whiteColor()
    label.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(label)

    NSLayoutConstraint(item: label,
                       attribute: .Bottom,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Bottom,
                       multiplier: 1.0,
                       constant: -8).active = true
    NSLayoutConstraint(item: label,
                       attribute: .Leading,
                       relatedBy: .Equal,
                       toItem: view,
                       attribute: .Leading,
                       multiplier: 1.0,
                       constant: 8).active = true

    return label
  }
}

extension ViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(scrollView: UIScrollView) {
    boundsLabel.text = String(format: "origin.x (bounds): %.2f", scrollView.bounds.origin.x)
    contentOffsetLabel.text = String(format: "contentOffset.x: %.2f", scrollView.contentOffset.x)
  }
}
