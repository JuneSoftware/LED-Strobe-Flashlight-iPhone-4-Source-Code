

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate;
@synthesize bannerIsVisible;


- (void)viewDidLoad {
		adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
		adView.frame = CGRectOffset(adView.frame, 0, -50);
		adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
		adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
		[self.view addSubview:adView];
		adView.delegate=self;
		self.bannerIsVisible=NO;
		[super viewDidLoad];
	
	
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
}


- (IBAction)done:(id)sender {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

- (IBAction)urlButton:(id)sender {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.DwarfCamel.com"]]; 
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


- (void)dealloc {
    [super dealloc];
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



@end
