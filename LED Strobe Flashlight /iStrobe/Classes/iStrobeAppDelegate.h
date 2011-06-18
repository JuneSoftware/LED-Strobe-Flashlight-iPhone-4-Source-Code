

#import <UIKit/UIKit.h>

@class MainViewController;

@interface iStrobeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MainViewController *mainViewController;
}

- (void)saveData;
- (void)loadData;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainViewController *mainViewController;

@end

