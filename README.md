# LitePopover
Show a UIViewController/UIView  in a popover for iPhone

# how to use

There is 4 method to presenting a Popover menu 

1. Show content and point to FromView

	```
	// Pop from this Button
	let fromBtn = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
	fromBtn.center = CGPointMake(150, 200)
	
	// The content will be shown
	let redView = UIView(frame: CGRectMake(0, 0, 100, 100))
	redView.backgroundColor = UIColor.greenColor()
	
	// content: The view will be shown
	// fromView: The born point
	// popFinish: Calling when the animation finished
	// dismiss: Calling when disappeared
	LitePopover.sharedLitePopover.present(content: redView, fromView: fromBtn, popFinish: nil, dismiss: nil)
	```

2. Show content and point to the center-bottom of rect in some view
	
	```
	// The content will be shown
	let redView = UIView(frame: CGRectMake(0, 0, 100, 100))
	redView.backgroundColor = UIColor.greenColor()
	
	// point to this rect's center-bottom
	let rect = CGRectMake(0,0,100,100)
	
	// 
	let basedView = UIView(frame: CGRectMake(0, 0, 200, 200))
	
	// content: The view will be shown
	// fromRect: Rect be pointed
	// inView: The rect in this view
	// popFinish: Calling when the animation finished
	// dismiss: Calling when disappeared
	LitePopover.sharedLitePopover.present(content: redView, fromRect:rect, inView:basedView popFinish: nil, dismiss: nil)
	```
	
3. Method #1 - Show controller 

	```
	// Pop from this Button
	let fromBtn = UIButton.buttonWithType(UIButtonType.ContactAdd) as! UIButton
	fromBtn.center = CGPointMake(150, 200)
	
	// This ctrl's view will be shown
	let demoVC = UIViewController()
	
	// viewController: This controller's view will be shown
	// fromView: The born point
	// popFinish: Calling when the animation finished
	// dismiss: Calling when disappeared
	LitePopover.sharedLitePopover.present(viewController: demoVC, fromView: fromBtn, popFinish: nil, dismiss: nil)
	```
4.  Method #2 - Show controller
	
	```
	// This ctrl's view will be shown
	let demoVC = UIViewController()
	
	// point to this rect's center-bottom
	let rect = CGRectMake(0,0,100,100)
	
	// 
	let basedView = UIView(frame: CGRectMake(0, 0, 200, 200))
	
	// viewController: This controller's view will be shown
	// fromRect: Rect be pointed
	// inView: The rect in this view
	// popFinish: Calling when the animation finished
	// dismiss: Calling when disappeared
	LitePopover.sharedLitePopover.present(viewController: demoVC, fromRect:rect, inView:basedView popFinish: nil, dismiss: nil)
	```
