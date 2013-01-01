//
//  StylePreferencesViewController.m
//  SCU
//
//  Created by Neo on 12/27/12.
//  Copyright (c) 2012 Neo. All rights reserved.
//

#import "StylePreferencesViewController.h"
#import "RimeConfigController.h"

@interface StylePreferencesViewController ()

@end

@implementation StylePreferencesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _delegate = [NSApp delegate];
        
        // UI inialization and properties default value
        _numbersOfCandidates = [[NSArray alloc] initWithObjects:
                                [NSDictionary dictionaryWithObjectsAndKeys:@"3", @"name", @"3", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"4", @"name", @"4", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"5", @"name", @"5", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"6", @"name", @"6", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"7", @"name", @"7", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"8", @"name", @"8", @"value", nil],
                                [NSDictionary dictionaryWithObjectsAndKeys:@"9", @"name", @"9", @"value", nil],
                                nil];
        _colorThemes = [[NSArray alloc] initWithObjects:
                        [NSDictionary dictionaryWithObjectsAndKeys:@"系统／Native", @"name", @"native", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"碧水／Aqua", @"name", @"aqua", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"青天／Azure", @"name", @"azure", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"暗堂／Dark Temple", @"name", @"dark_temple", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"谷歌／Google", @"name", @"google", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"墨池／Ink", @"name", @"ink", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"孤寺／Lost Temple", @"name", @"lost_temple", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"明月／Luna", @"name", @"luna", @"value", nil],
                        [NSDictionary dictionaryWithObjectsAndKeys:@"星際我爭霸／StarCraft", @"name", @"starcraft", @"value", nil],
                        nil];

        _numberOfCandidates = 5;
        _fontSize = [NSFont systemFontSize];
        _currentFont = [NSFont systemFontOfSize:_fontSize];
        _cornerRadius = 5;
        _borderHeight = 0;
        _borderWidth = 0;
        _alpha = 0.85;
        _colorTheme = @"native";
    }
    
    return self;
}

- (void)awakeFromNib {
    [self reload];
}

- (void)reload {
    [self updateFontField];
}

- (void)updateFontField {
    [_fontField setStringValue:[NSString stringWithFormat:@"%@", [_currentFont fontName]]];
}

- (IBAction)chooseFont:(id)sender {
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    [fontManager setSelectedFont:_currentFont isMultiple:NO];
    [fontManager orderFrontFontPanel:nil];
}

// Callback called by the shared NSFontManager when user chooses a new font or size in the Font Panel
- (void)changeFont:(id)sender {
    NSFontManager *fontManager = [NSFontManager sharedFontManager];
    [self setCurrentFont:[fontManager convertFont:[fontManager selectedFont]]];
    [self setFontSize:[_currentFont pointSize]];
    [self updateFontField];
}

-(NSString *)identifier {
    return @"Style";
}

-(NSImage *)toolbarItemImage {
    return [NSImage imageNamed:NSImageNameColorPanel];
}

-(NSString *)toolbarItemLabel {
    return NSLocalizedString(@"Style tab label", nil);
}

@end
