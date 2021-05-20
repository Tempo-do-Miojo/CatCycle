//
//  PageViewController.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 19/05/21.
//

import SwiftUI
import UIKit

struct PageViewController: UIViewControllerRepresentable {

    var pages: [UIViewController]
    @Binding var currentPageIndex: Int

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        // Remove swipe scroll from pageViewController
        for view in pageViewController.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }

        return pageViewController
    }

    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [pages[currentPageIndex]], direction: .forward, animated: true)
    }

    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

        var parent: PageViewController

        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }

        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore viewController: UIViewController) -> UIViewController? {
            // Retrieves the index of the currently displayed view controller
            guard let index = parent.pages.firstIndex(of: viewController) else {
                 return nil
             }

            // Shows the last view controller when the user swipes back from the first view controller
            if index == 0 {
                return parent.pages.last
            }

            // Show the view controller before the currently displayed view controller
            return parent.pages[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerAfter viewController: UIViewController) -> UIViewController? {
            // Retrieves the index of the currently displayed view controller
            guard let index = parent.pages.firstIndex(of: viewController) else {
                return nil
            }
            // Shows the first view controller when the user swipes further from the last view controller
            if index + 1 == parent.pages.count {
                return parent.pages.first
            }
            // Show the view controller after the currently displayed view controller
            return parent.pages[index + 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController,
                                didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],
                                transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = parent.pages.firstIndex(of: visibleViewController) {
                parent.currentPageIndex = index
            }
        }
    }
}

/* Resources:
 
 https://developer.apple.com/tutorials/swiftui/interfacing-with-uikit
 https://blckbirds.com/post/how-to-create-a-onboarding-screen-in-swiftui-1/
 
 **/
