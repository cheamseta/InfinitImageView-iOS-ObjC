# infinitImageView

Implement map technology creating tile to draw infinity images locally or remotely. The best thing of using this technology is saving phone memory because all the images are redraw in tiles.

This library is dedicated for "អូនស្អាតរបស់បង"

<h3>My Linkin</h3>
<a target="_blank" href="http://www.linkedin.com/in/cheamseta"><img width="100px" src="https://cdn4.iconfinder.com/data/icons/social-media-pro-icons/1080/Linkin-01-128.png"/></a>

<h3>My Profile</h3>
<a target="_blank" href="http://cheamseta.herokuapp.com/"><img width="100px" src="https://graph.facebook.com/10205416160197106/picture?type=large&return_ssl_resources=1"/></a>

## Preview

<img src="https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/infitImg1.png?alt=media&token=a756e847-0480-4317-b46b-97d145670f63" width="230"/>
<img src="https://firebasestorage.googleapis.com/v0/b/hubgit-cea1c.appspot.com/o/infitImg2.png?alt=media&token=b37b3997-7f63-4b23-b5c0-9902c2fee9a5" width="230"/>

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

