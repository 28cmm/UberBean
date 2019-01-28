//
//  ViewController.m
//  Uber Bean
//
//  Created by Yilei Huang on 2019-01-27.
//  Copyright © 2019 Joshua Fanng. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;


@property (nonatomic) CLLocation *currentLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _mapView.mapType = MKMapTypeStandard;
//    [_mapView setZoomEnabled: true];
//    [_mapView setRotateEnabled: true];
//    [_mapView setScrollEnabled: true];
//    [_mapView showsScale];
    
    
    // Modularizing our code
//    _mapView.delegate = self;
    
   
    self.locationManager = [CLLocationManager new];
    [self.locationManager requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    self.locationManager.delegate = self;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.06, 0.06);
    MKCoordinateRegion region = MKCoordinateRegionMake(self.locationManager.location.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    
    NSLog(@"You probably should place this in a separate class and use a singleton for it");
    
    [_locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    NSLog(@"updated");
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"failed");
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if(status == kCLAuthorizationStatusAuthorizedWhenInUse || status == kCLAuthorizationStatusAuthorizedAlways) {
        [self.locationManager requestLocation];
    }
}


@end
