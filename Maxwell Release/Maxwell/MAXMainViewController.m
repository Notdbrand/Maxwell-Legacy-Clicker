//
//  MAXMainViewController.m
//  Maxwell
//
//  Created by Notdbrand on 2/12/25.
//  Copyright (c) 2025 Notdbrand. All rights reserved.
//

#import "MAXMainViewController.h"
#import <AVFoundation/AVFoundation.h>

static AVAudioPlayer *sharedAudioPlayer;

@interface MAXMainViewController ()
@property (nonatomic) NSInteger pressCount;
@end

@implementation MAXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pressCount = [[NSUserDefaults standardUserDefaults] integerForKey:@"TapCounter"];
    self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)self.pressCount];
    
    if (!sharedAudioPlayer) {
        NSURL *soundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Maxwell" ofType:@"mp3"]];
        sharedAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
        sharedAudioPlayer.numberOfLoops = -1;
        [sharedAudioPlayer prepareToPlay];
    }
}

- (void)playMusic {
    if (!sharedAudioPlayer.isPlaying) {
        [sharedAudioPlayer play];
    }
}

- (void)incrementCounter {
    self.pressCount++;
    self.counterLabel.text = [NSString stringWithFormat:@"%ld", (long)self.pressCount];
    
    [[NSUserDefaults standardUserDefaults] setInteger:self.pressCount forKey:@"TapCounter"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)maxwellButtonPressed:(id)sender {
    [self incrementCounter];
    [self playMusic];
}

@end
