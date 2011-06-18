

#import "FlipsideViewController.h"
#import "FlashController.h"
#import <iAd/iAd.h>;

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, ADBannerViewDelegate> {
	
	NSTimer *strobeTimer;
    
	NSTimer *strobeFlashTimer;
    
    IBOutlet UISlider *strobeSlider;
	IBOutlet UIButton *powerButton;

	BOOL strobeIsOn; // For our code to turn strobe on and off
	BOOL strobeActivated; // To allow user to turn off the light all together
	BOOL strobeFlashOn; // For our code to turn strobe on and off rapidly
	
	ADBannerView *adView;
	BOOL bannerIsVisible;

	
	
	FlashController *flashController;
}

@property (nonatomic, retain) NSTimer *strobeTimer;
@property (nonatomic, retain) NSTimer *strobeFlashTimer;
@property (nonatomic, retain) IBOutlet UISlider *strobeSlider;
@property (nonatomic, retain) IBOutlet UIButton *powerButton;


@property (nonatomic, assign) BOOL strobeActivated;
@property (nonatomic,assign) BOOL bannerIsVisible;
@property (nonatomic, retain) FlashController *flashController;


- (IBAction)powerButtonPressed:(id)sender;
- (IBAction)showInfo:(id)sender;
- (IBAction)onStrobeSwitch:(id)sender;
- (void)strobeTimerCallback:(id)sender;
- (void)strobeFlashTimerCallback:(id)sender;
- (IBAction)handleSlider:(id)sender;
- (IBAction)urlButton:(id)sender;
- (void)uiSetup;
- (void)startStopStrobe:(BOOL)strobeOn;

@end
