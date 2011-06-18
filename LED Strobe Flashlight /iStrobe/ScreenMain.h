//
//  ScreenMain.h
//
//  Created by Frahaan Hussain on 17/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ScreenMain : UIView {
	
	IBOutlet UIView *main;
	IBOutlet UIView	 *white;
	IBOutlet UIView	 *yellow;
	IBOutlet UIView	 *red;
	IBOutlet UIView	 *purple;
	IBOutlet UIView	 *orange;
	IBOutlet UIView	 *magenta;
	IBOutlet UIView	 *green;
	IBOutlet UIView	 *cyan;
	IBOutlet UIView	 *brown;
	IBOutlet UIView	 *blue;
	IBOutlet UIView	 *black;
	IBOutlet UIView	 *ff3366;
	IBOutlet UIView	 *oo33cc;
	IBOutlet UIView	 *cc33cc;
	IBOutlet UIView	 *ooffcc;
	IBOutlet UIView	 *ffcccc;
	
}

-(IBAction)white;
-(IBAction)yellow;
-(IBAction)red;
-(IBAction)purple;
-(IBAction)orange;
-(IBAction)magenta;
-(IBAction)green;
-(IBAction)cyan;
-(IBAction)brown;
-(IBAction)blue;
-(IBAction)black;
-(IBAction)ff3366;
-(IBAction)oo33cc;
-(IBAction)cc33cc;
-(IBAction)ooffcc;
-(IBAction)ffcccc;

-(IBAction)main;

-(IBAction)about;
-(IBAction)instructions;

@end
