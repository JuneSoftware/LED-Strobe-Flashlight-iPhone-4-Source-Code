//
//  ScreenMain.m
//
//  Created by Frahaan Hussain on 17/08/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ScreenMain.h"

@implementation ScreenMain

-(void)awakeFromNib{

	[self addSubview:main];
	
}

-(IBAction)main{
	
	[black removeFromSuperview];
	[blue removeFromSuperview];
	[ffcccc removeFromSuperview];
	[ooffcc removeFromSuperview];
	[cc33cc removeFromSuperview];
	[oo33cc removeFromSuperview];
	[ff3366 removeFromSuperview];
	[brown removeFromSuperview];
	[cyan removeFromSuperview];
	[green removeFromSuperview];
	[magenta removeFromSuperview];
	[orange removeFromSuperview];
	[purple removeFromSuperview];
	[red removeFromSuperview];
	[yellow removeFromSuperview];
	[white removeFromSuperview];
	[self addSubview:main];
	
	
	
}

-(IBAction)white{
	[main removeFromSuperview];
	[self addSubview:white];
	
}

-(IBAction)yellow{
	[main removeFromSuperview];
	[self addSubview:yellow];
	
}

-(IBAction)red{
	[main removeFromSuperview];
	[self addSubview:red];
	
}

-(IBAction)purple{
	[main removeFromSuperview];
	[self addSubview:purple];
	
}

-(IBAction)orange{
	[main removeFromSuperview];
	[self addSubview:orange];
	
}

-(IBAction)green{
	[main removeFromSuperview];
	[self addSubview:green];
	
}

-(IBAction)cyan{
	[main removeFromSuperview];
	[self addSubview:cyan];
	
}

-(IBAction)brown{
	[main removeFromSuperview];
	[self addSubview:brown];
	
}

-(IBAction)blue{
	[main removeFromSuperview];
	[self addSubview:blue];
	
}

-(IBAction)black{
	[main removeFromSuperview];
	[self addSubview:black];
	
}

-(IBAction)ff3366{
	[main removeFromSuperview];
	[self addSubview:ff3366];
	
}

-(IBAction)oo33cc{
	[main removeFromSuperview];
	[self addSubview:oo33cc];
	
}

-(IBAction)cc33cc{
	[main removeFromSuperview];
	[self addSubview:cc33cc];
	
}

-(IBAction)ooffcc{
	[main removeFromSuperview];
	[self addSubview:ooffcc];
	
}

-(IBAction)ffcccc{
	[main removeFromSuperview];
	[self addSubview:ffcccc];
	
}

-(IBAction)magenta{
	[main removeFromSuperview];
	[self addSubview:magenta];
	
}

-(IBAction)instructions {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Instructions" message:@"Just tap the colour you want and tap the screen again to return to the main menu" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	
}

-(IBAction)about {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" message:@"Created by ThunderKeyBolt owned by Frahaan Hussain" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles:nil];
	[alert show];
	[alert release];
	
	
}







@end
