

@interface MorseCode : NSObject {
	NSArray *morseLetterKeys;
}

@property (nonatomic, retain) NSArray *morseLetterKeys;

- (void)setupMorse;
- (id)init;

@end
