//
//  HWPPrinter.h
//  PrinterPlugin
//

#ifndef HWPPrinter_h
#define HWPPrinter_h

#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

#include <stdio.h>
#include <cups/cups.h>

@interface Printer : CDVPlugin

- (void) getAvailablePrinters:(CDVInvokedUrlCommand*)command;

- (void) testPrinter:(NSString*) printerName;

@end

#endif /* SwiftCUPS_h */
