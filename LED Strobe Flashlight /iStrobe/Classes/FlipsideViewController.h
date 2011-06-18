

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>;

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController <ADBannerViewDelegate>{
	id <FlipsideViewControllerDelegate> delegate;
	ADBannerView *adView;
	BOOL bannerIsVisible;
}
@property (nonatomic,assign) BOOL bannerIsVisible;

- (IBAction)urlButton:(id)sender;
@property (nonatomic, assign) id <FlipsideViewControllerDelegate> delegate;
- (IBAction)done:(id)sender;
@end



@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

