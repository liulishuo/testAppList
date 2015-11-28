//
//  ViewController.m
//  testAppList
//
//  Created by liulishuo on 15/11/23.
//  Copyright © 2015年 liulishuo. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickToShowInfo:(id)sender {
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
    NSArray *appList = [workspace performSelector:@selector(allApplications)];
    
    Class LSApplicationProxy_class = object_getClass(@"LSApplicationProxy");
    
    //可以得到73个
//    int count = 0;
//    Method *memberMethods = class_copyMethodList(LSApplicationWorkspace_class, &count);
//    for (int i = 0; i < count; i++) {
//        SEL name = method_getName(memberMethods[i]);
//        NSString *methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
//        NSLog(@"member method:%@", methodName);
//    }
//    
//    NSLog(@"count: %d",count);
//    
//    //获取不到成员变量
//    int count = 0;
//    Ivar *members = class_copyIvarList([LSApplicationProxy_class class], &count);
//    for (int i = 0 ; i < count; i++) {
//        Ivar var = members[i];
//        const char *memberName = ivar_getName(var);
//        const char *memberType = ivar_getTypeEncoding(var);
//        NSLog(@"%s: %s",memberType,memberName);
//    }
//    
//    NSLog(@"count: %d",count);
//    //获取不到有用的方法
//    count = 0;
//    Method *memberMethods = class_copyMethodList(LSApplicationProxy_class, &count);
//    for (int i = 0; i < count; i++) {
//        SEL name = method_getName(memberMethods[i]);
//        NSString *methodName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];
//        NSLog(@"member method:%@", methodName);
//    }
//    
//    NSLog(@"count: %d",count);
    
    
    NSMutableDictionary *list = [NSMutableDictionary new];
    
    for (LSApplicationProxy_class in appList)
    {
        NSString *bundleID = [LSApplicationProxy_class performSelector:@selector(applicationIdentifier)];
        
        NSString *version = [LSApplicationProxy_class performSelector:@selector(bundleVersion)];
        
        NSString *teamID = [LSApplicationProxy_class performSelector:@selector(teamID)];
        
        NSArray *groupIdentifiers = [LSApplicationProxy_class performSelector:@selector(groupIdentifiers)];
        
        NSInteger originalInstallType = [LSApplicationProxy_class performSelector:@selector(originalInstallType)];
        
        NSInteger installType = [LSApplicationProxy_class performSelector:@selector(installType)];
        
        NSNumber *itemID = [LSApplicationProxy_class performSelector:@selector(itemID)];
        
        NSObject *description = [LSApplicationProxy_class performSelector:@selector(description)];
        
        NSObject *iconStyleDomain = [LSApplicationProxy_class performSelector:@selector(iconStyleDomain)];
        
        NSObject *localizedShortName = [LSApplicationProxy_class performSelector:@selector(localizedShortName)];
        
        NSObject *localizedName = [LSApplicationProxy_class performSelector:@selector(localizedName)];
        
        NSObject *privateDocumentTypeOwner = [LSApplicationProxy_class performSelector:@selector(privateDocumentTypeOwner)];
        
        NSObject *privateDocumentIconNames = [LSApplicationProxy_class performSelector:@selector(privateDocumentIconNames)];
        
        NSObject *resourcesDirectoryURL = [LSApplicationProxy_class performSelector:@selector(resourcesDirectoryURL)];
        
        NSObject *installProgress = [LSApplicationProxy_class performSelector:@selector(installProgress)];
        
        NSObject *appStoreReceiptURL = [LSApplicationProxy_class performSelector:@selector(appStoreReceiptURL)];
        
        NSNumber *storeFront = [LSApplicationProxy_class performSelector:@selector(storeFront)];
        
//        NSNumber *dynamicDiskUsage = [LSApplicationProxy_class performSelector:@selector(dynamicDiskUsage)];
        
        NSNumber *staticDiskUsage = [LSApplicationProxy_class performSelector:@selector(staticDiskUsage)];
        
        NSObject *deviceIdentifierForVendor = [LSApplicationProxy_class performSelector:@selector(deviceIdentifierForVendor)];
        
        NSArray *requiredDeviceCapabilities = [LSApplicationProxy_class performSelector:@selector(requiredDeviceCapabilities)];
        
        NSArray *appTags = [LSApplicationProxy_class performSelector:@selector(appTags)];
        
        NSArray *plugInKitPlugins = [LSApplicationProxy_class performSelector:@selector(plugInKitPlugins)];
        
        NSArray *VPNPlugins = [LSApplicationProxy_class performSelector:@selector(VPNPlugins)];
        
        NSArray *externalAccessoryProtocols = [LSApplicationProxy_class performSelector:@selector(externalAccessoryProtocols)];
        
        NSArray *audioComponents = [LSApplicationProxy_class performSelector:@selector(audioComponents)];
        
        NSArray *UIBackgroundModes = [LSApplicationProxy_class performSelector:@selector(UIBackgroundModes)];
        
        NSArray *directionsModes = [LSApplicationProxy_class performSelector:@selector(directionsModes)];
        
        NSDictionary *groupContainers = [LSApplicationProxy_class performSelector:@selector(groupContainers)];
        
        NSString *vendorName = [LSApplicationProxy_class performSelector:@selector(vendorName)];
        
        NSString *applicationType = [LSApplicationProxy_class performSelector:@selector(applicationType)];
        
        NSString *sdkVersion = [LSApplicationProxy_class performSelector:@selector(sdkVersion)];
        
        NSMutableDictionary *dict = [NSMutableDictionary new];
        [dict setValue:version forKey:@"bundleVersion"];
        [dict setValue:teamID forKey:@"teamID"];
        [dict setValue:groupIdentifiers forKey:@"groupIdentifiers"];
        [dict setValue:@(originalInstallType) forKey:@"originalInstallType"];
        [dict setValue:@(installType) forKey:@"installType"];
        [dict setValue:itemID forKey:@"itemID"];
        [dict setValue:description forKey:@"description"];
        [dict setValue:itemID forKey:@"itemID"];
        [dict setValue:iconStyleDomain forKey:@"iconStyleDomain"];
        [dict setValue:localizedShortName forKey:@"localizedShortName"];
        [dict setValue:localizedName forKey:@"localizedName"];
        [dict setValue:privateDocumentTypeOwner forKey:@"privateDocumentTypeOwner"];
        [dict setValue:privateDocumentIconNames forKey:@"privateDocumentIconNames"];
        [dict setValue:resourcesDirectoryURL forKey:@"resourcesDirectoryURL"];
        [dict setValue:installProgress forKey:@"installProgress"];
        [dict setValue:appStoreReceiptURL forKey:@"appStoreReceiptURL"];
        [dict setValue:storeFront forKey:@"storeFront"];
//        [dict setValue:dynamicDiskUsage forKey:@"dynamicDiskUsage"];
        [dict setValue:staticDiskUsage forKey:@"staticDiskUsage"];
        [dict setValue:deviceIdentifierForVendor forKey:@"deviceIdentifierForVendor"];
        [dict setValue:requiredDeviceCapabilities forKey:@"requiredDeviceCapabilities"];
        [dict setValue:appTags forKey:@"appTags"];
        [dict setValue:plugInKitPlugins forKey:@"plugInKitPlugins"];
        [dict setValue:VPNPlugins forKey:@"VPNPlugins"];
        [dict setValue:externalAccessoryProtocols forKey:@"externalAccessoryProtocols"];
        [dict setValue:audioComponents forKey:@"audioComponents"];
        [dict setValue:UIBackgroundModes forKey:@"UIBackgroundModes"];
        [dict setValue:directionsModes forKey:@"directionsModes"];
        [dict setValue:groupContainers forKey:@"groupContainers"];
        [dict setValue:vendorName forKey:@"vendorName"];
        [dict setValue:applicationType forKey:@"applicationType"];
        [dict setValue:sdkVersion forKey:@"sdkVersion"];
        
        
        
        [list setValue:dict forKey:bundleID];
    }
    
    NSLog(@"%ld",list.count);
    NSLog(@"%@",list);
    
    //    [workspace performSelector:@selector(uninstallApplication:withOptions:) withObject:@"com.dianping.dpscope" withObject:nil];
}

@end
