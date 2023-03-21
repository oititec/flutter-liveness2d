#import "OitiLiveness2dPlugin.h"
#if __has_include(<oiti_liveness2d/oiti_liveness2d-Swift.h>)
#import <oiti_liveness2d/oiti_liveness2d-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "oiti_liveness2d-Swift.h"
#endif

@implementation OitiLiveness2dPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftOitiLiveness2dPlugin registerWithRegistrar:registrar];
}
@end
