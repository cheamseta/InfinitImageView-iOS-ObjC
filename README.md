# infinitImageView

Implement map technology creating tile to draw infinity images locally or remotely. The best thing of using this technology is saving phone memory because all the images are redraw in tiles.

This library is dedicated for "អូនស្អាតរបស់បង"

## Preview

<img src="https://dl.dropboxusercontent.com/u/46009114/github/InfinitImageView/1.png" width="230"/>
<img src="https://dl.dropboxusercontent.com/u/46009114/github/InfinitImageView/2.png" width="230"/>
<img src="https://dl.dropboxusercontent.com/u/46009114/github/InfinitImageView/3.png" width="230"/>

## Usage

In the source files where you need to use the library, import the header file:

```objective-c
#import "InfinitScrollView.h"
```

### Initialization

You have several methods for initialization:

```objective-c
 NSArray * localImageArray = @[
                                [UIImage imageNamed:@"1.jpg"],
                                [UIImage imageNamed:@"2.jpg"],
                                [UIImage imageNamed:@"3.jpg"]
                                ];
  
  self.infinitScrollView = [[InfinitScrollView alloc] initWithFrame:self.view.frame withArray:localImageArray];
  [self.infinitScrollView setInfinitDelegate:self];
  [self.view addSubview:self.infinitScrollView];
```

### Handle actions

To handle actions you can use initialization methods with blocks or delegate, or implement it after initialization.

#### Delegate

```objective-c
- (void)InfinitScrollView:(InfinitScrollView *)scrollView didTapOnImage:(UIImage *)image;
```

### More

This technology was used in VRecommend - a trusted peer-2-peer recommendation - https://itunes.apple.com/kh/app/vrecommend/id870647274?mt=8

## License

LGAlertView is released under the MIT license.
