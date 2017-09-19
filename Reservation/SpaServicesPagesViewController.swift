//
//  SpaServicesPagesViewController.swift
//  Reservation
//
//  Created by Teddy Demilew on 9/19/17.
//  Copyright © 2017 Teddy Demilew. All rights reserved.
//

import UIKit

class SpaServicesPagesViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {

    lazy var pages : [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mothersDayPage = storyboard.instantiateViewController(withIdentifier: "MothersDayPage")
        let hotStonePage = storyboard.instantiateViewController(withIdentifier: "HotStonePage")
        let deepTessuePage = storyboard.instantiateViewController(withIdentifier: "DeepTessuePage")
        return [mothersDayPage, hotStonePage, deepTessuePage]
    }()
    
    let menu: [String] = ["Swedish Massage", "Deep Tissu Massage", "Hot Stone Massage", "Reflexology", "Trigger Point Therapy"]

    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.dataSource = self;
    
        //set first page
        if let firstPage = pages.first {
            self.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        }

        //setup custom page control
        if #available(iOS 9.0, *) {
            let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
            pageControl.currentPageIndicatorTintColor = UIColor.orange
            pageControl.pageIndicatorTintColor = UIColor.lightGray
            pageControl.backgroundColor = UIColor.white
        }
        
        //setup table view
        let deviceW = self.view.frame.size.width
        let deviceH = self.view.frame.size.height
        let marginX = 20
        let marginY = 60
        let tableH = Int(deviceH/2.0) - Int(2*marginY)
        let tableW = Int(deviceW) - Int(2*marginX)
        let tableX = marginX
        let tableY = Int(deviceH/2.0) + marginY
        
        tableView = UITableView(frame: CGRect(x: tableX, y: tableY, width: tableW, height: tableH))
        tableView.layer.cornerRadius = 10
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - PageViewController DataSource
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        guard let currPageIndex = pages.index(of: viewController) else {
            return nil
        }
        
        let prevPageIndex = currPageIndex - 1;
        
        guard prevPageIndex >= 0 else {
            return nil
        }
        
        guard pages.count > prevPageIndex else {
            return nil
        }
        
        return pages[prevPageIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currPageIndex = pages.index(of: viewController) else {
            return nil
        }
        
        let nextPageIndex = currPageIndex + 1;
        
        guard pages.count != nextPageIndex else {
            return nil
        }
        
        guard pages.count > nextPageIndex else {
            return nil
        }
        
        return pages[nextPageIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // MARK: - TableView DataSource & Delegates

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        cell.textLabel?.text = menu[indexPath.row]
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
