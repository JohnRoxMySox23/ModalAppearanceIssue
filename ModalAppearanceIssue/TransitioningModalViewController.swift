//
//  TransitioningModalViewController.swift
//  SimplerTest
//
//  Created by John on 15/02/2023.
//

import UIKit

let testTransitioning = TestTransitioning()

class TestTransitioning: NSObject, UIViewControllerTransitioningDelegate {
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningModalViewControllerPresenter()
    }
    
    public func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningModalViewControllerDismisser()
    }
}

open class TransitioningModalViewController: UIViewController {
    // MARK: View Properties
    @IBOutlet weak var overlayView: UIView!
}

extension TransitioningModalViewController: UIViewControllerTransitioningDelegate {
    public func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningModalViewControllerPresenter()
    }
    
    public func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        return TransitioningModalViewControllerDismisser()
    }
}

private final class TransitioningModalViewControllerPresenter: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        let toViewController: TransitioningModalViewController = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.to
        ) as! TransitioningModalViewController
        let duration = transitionDuration(using: transitionContext)
        toViewController.overlayView.alpha = 0.0
        UIView.animate(
            withDuration: duration
        ) {
            toViewController.overlayView.alpha = 0.65
        } completion: { result in
            transitionContext.completeTransition(result)
        }
    }
}

private final class TransitioningModalViewControllerDismisser: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        let fromViewController: TransitioningModalViewController = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.from
        ) as! TransitioningModalViewController
        let duration = transitionDuration(using: transitionContext)
        UIView.animate(
            withDuration: duration
        ) {
            fromViewController.overlayView.alpha = 0.0
        } completion: { result in
            transitionContext.completeTransition(result)
        }
    }
}
