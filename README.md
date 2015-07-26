# infinitImageView

Implement map technology creating tile to draw infinity images locally or remotely. The best thing of using this technology is saving phone memory because all the images are redraw in tiles.

This library is dedicated for "អូនស្អាតរបស់បង"

## Preview

<img src="https://www.dropbox.com/s/029ghv4rho0h4qs/1.png?dl=0" width="230"/>
<img src="https://www.dropbox.com/s/ww4y1qplo6jk2z0/2.png?dl=0" width="230"/>
<img src="https://www.dropbox.com/s/3ab63d5sfsdm0zg/3.png?dl=0" width="230"/>

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

LGAlertView is released under the MIT license. See [LICENSE](https://raw.githubusercontent.com/Friend-LGA/LGAlertView/master/LICENSE) for details.
