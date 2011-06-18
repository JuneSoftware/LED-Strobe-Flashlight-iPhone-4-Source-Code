
#import "MainViewController.h"


@implementation MainViewController

@synthesize strobeTimer, strobeFlashTimer, powerButton;
@synthesize strobeSlider;
@synthesize bannerIsVisible, strobeActivated;
@synthesize flashController;

- (void)viewWillAppear:(BOOL)animated{
	[self uiSetup];
	
}

- (void)uiSetup {
	//Slider Images
	UIImage *stetchLeftTrack = [[UIImage imageNamed:@"slider-bg.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	UIImage *stetchRightTrack = [[UIImage imageNamed:@"slider-bg.png"]  stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0];
	
	//Slider: Top
	strobeSlider.backgroundColor = [UIColor clearColor];	
	[strobeSlider setThumbImage: [UIImage imageNamed:@"slider-knob.png"] forState:UIControlStateNormal];
	[strobeSlider setMinimumTrackImage:stetchLeftTrack forState:UIControlStateNormal];
	[strobeSlider setMaximumTrackImage:stetchRightTrack forState:UIControlStateNormal];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = self;
	accelerometer.updateInterval = 1.0f/60.0f;
	
	
			adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
		adView.frame = CGRectOffset(adView.frame, 0, -50);
		adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
		adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
		[self.view addSubview:adView];
		adView.delegate=self;
		self.bannerIsVisible=NO;
		[super viewDidLoad];

	
	
	strobeIsOn = NO;
	strobeActivated = NO;
	strobeFlashOn = NO;
	
	flashController = [[FlashController alloc] init];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:[self.strobeSlider value] target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
	self.strobeFlashTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(strobeFlashTimerCallback:) userInfo:nil repeats:YES];
}

- (void)strobeTimerCallback:(id)sender {
	if (strobeActivated) {
		strobeIsOn = !strobeIsOn;
		strobeFlashOn = YES;
	} else {
		strobeFlashOn = NO;
	}
}

- (void)strobeFlashTimerCallback:(id)sender {
	if (strobeFlashOn) {
		strobeFlashOn = !strobeFlashOn;
		[self startStopStrobe:strobeIsOn];
	} else {
		[self startStopStrobe:NO];
	}
}

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)powerButtonPressed:(id)sender {
	
	if(strobeActivated) {
		[powerButton setImage:[UIImage imageNamed:@"offbig.png"] forState:UIControlStateNormal];
		strobeActivated = NO;
	} else {
		[powerButton setImage:[UIImage imageNamed:@"onbig.png"] forState:UIControlStateNormal];
		strobeActivated = YES;
	}

	[self startStopStrobe:strobeActivated];
}


- (IBAction)handleSlider:(id)sender {
	[self.strobeTimer invalidate];
	
	self.strobeTimer = [NSTimer scheduledTimerWithTimeInterval:[self.strobeSlider value] target:self selector:@selector(strobeTimerCallback:) userInfo:nil repeats:YES];
}

- (IBAction)showInfo:(id)sender {
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (IBAction)onStrobeSwitch:(id)sender {
	UISwitch *mySwitch = sender;
	strobeActivated = mySwitch.on;
	
	[self startStopStrobe:strobeActivated];
	
	if(strobeActivated) {
		strobeSlider.enabled = YES;
	} else {
		strobeSlider.enabled = NO;
	}
}

- (void)startStopStrobe:(BOOL)strobeOn {	
	if (strobeOn || ([self.strobeSlider value] >= 0.29 && strobeActivated)) {
		[flashController toggleStrobe:YES];
	} else {
		[flashController toggleStrobe:NO];
	}
}



- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
	if (!self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOn" context:NULL];
		// banner is invisible now and moved out of the screen on 50 px
		banner.frame = CGRectOffset(banner.frame, 0, 50);
		[UIView commitAnimations];
		self.bannerIsVisible = YES;
	}
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
	if (self.bannerIsVisible)
	{
		[UIView beginAnimations:@"animateAdBannerOff" context:NULL];
		// banner is visible and we move it out of the screen, due to connection issue
		banner.frame = CGRectOffset(banner.frame, 0, -50);
		[UIView commitAnimations];
		self.bannerIsVisible = NO;
	}
}



- (void)dealloc {
	[flashController release];
	
	
    [super dealloc];
}


@end
