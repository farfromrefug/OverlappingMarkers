#import "ViewController.h"

#define CENTER_POS CLLocationCoordinate2DMake(45.1841656,5.7155425)

@import GoogleMaps;
@import CoreLocation;

@interface ViewController () <GMSIndoorDisplayDelegate, GMSMapViewDelegate>

@property (strong, nonatomic) IBOutlet GMSMapView *mapView;
@property (nonatomic, strong) NSArray *markers;
@property (nonatomic) NSInteger count;

-(void) updateMarkerDetails;

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
//  CLLocationCoordinate2D location = CLLocationCoordinate2DMake(40.295210, -124.032841);
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:CENTER_POS zoom:8];
  [self.mapView animateToCameraPosition:camera];
  [self.mapView setMapType:kGMSTypeHybrid];
  
    // Seed random
    srand48(arc4random());
    self.count = 0;
  self.markers = @[
                   [self createMarker],
                   [self createMarker],
                   [self createMarker],
                   ];
    
    [self.markers enumerateObjectsUsingBlock:^(GMSMarker*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.map = self.mapView;

    }];
  }

#pragma mark - ViewController class extension methods

-(GMSMarker*)createMarker
{
    self.count += 1;
    
    double latDelta = (drand48() - 0.5) / 20;
    double lngDelta = (drand48() - 0.5) / 20;
    GMSMarker* marker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(CENTER_POS.latitude + latDelta, CENTER_POS.longitude + lngDelta)];
    marker.title = [NSString stringWithFormat:@"marker %ld", (long)self.count];
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    marker.icon = [GMSMarker markerImageWithColor:[UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1]];
    return marker;
    
}

@end
