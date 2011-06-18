

#import <AVFoundation/AVFoundation.h>


@interface FlashController : NSObject {
	AVCaptureSession *captureSession;
	AVCaptureDevice *captureDevice;
}

@property (nonatomic, retain) AVCaptureSession *captureSession;

- (id)init;
- (void)toggleStrobe:(BOOL)strobeOn;

@end
