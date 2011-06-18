

#import "iStrobeAppDelegate.h"
#import "MainViewController.h"

@interface iStrobeAppDelegate ()
- (NSString *)myFilePath:(NSString *)fileName;
@end

@implementation iStrobeAppDelegate


@synthesize window;
@synthesize mainViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.  

    // Add the main view controller's view to the window and display.
    [window addSubview:mainViewController.view];
    [window makeKeyAndVisible];
	
	[self loadData];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	[self saveData];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	[self saveData];
}

- (void)loadData {
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSString *filePath = [self myFilePath:@"StrobeDuration.archive"];
	
	if([fileManager fileExistsAtPath:filePath]) {
		NSNumber *aNumber = [NSKeyedUnarchiver unarchiveObjectWithFile:[self myFilePath:@"StrobeDuration.archive"]];
		[mainViewController.strobeSlider setValue:[aNumber floatValue]];
		
		[mainViewController handleSlider:nil];
	}
	else {
	}
	
	filePath = [self myFilePath:@"StrobeOnOff.archive"];
	
	if([fileManager fileExistsAtPath:filePath]) {
		NSNumber *aNumber = [NSKeyedUnarchiver unarchiveObjectWithFile:[self myFilePath:@"StrobeOnOff.archive"]];
		mainViewController.strobeActivated = [aNumber boolValue];
		
		if(mainViewController.strobeActivated) {
			[mainViewController.powerButton setImage:[UIImage imageNamed:@"onbig.png"] forState:UIControlStateNormal];
		} else {
			[mainViewController.powerButton setImage:[UIImage imageNamed:@"offbig.png"] forState:UIControlStateNormal];
		}
	}
	else {
		mainViewController.strobeActivated = YES;
	}
	
	[mainViewController startStopStrobe:mainViewController.strobeActivated];
}

- (void)saveData {
	CGFloat sliderValue = [mainViewController.strobeSlider value];
	
	NSNumber *tempNumber = [NSNumber numberWithFloat:sliderValue];
	[NSKeyedArchiver archiveRootObject:tempNumber toFile:[self myFilePath:@"StrobeDuration.archive"]];
	
	tempNumber = [NSNumber numberWithBool:mainViewController.strobeActivated];
	[NSKeyedArchiver archiveRootObject:tempNumber toFile:[self myFilePath:@"StrobeOnOff.archive"]];
}

- (NSString *)myFilePath:(NSString *)fileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	return [documentsDirectory stringByAppendingPathComponent:fileName];
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
