//
//  HWPPrinter.m
//  PrinterPlugin
//

#import "HWPPrinter.h"
#import <Cordova/CDVPlugin.h>

@implementation Printer

- (void) getAvailablePrinters:(CDVInvokedUrlCommand*)command {
    int i;
    cups_dest_t *dests, *dest;
    int num_dests = cupsGetDests(&dests);
    CDVPluginResult *pluginResult = nil;

    NSMutableArray *anArray = [[NSMutableArray alloc] init];

    for (i = num_dests, dest = dests; i > 0; i --, dest ++)
    {
        NSString* string = [NSString stringWithFormat:@"%s" , dest->name];
        [anArray addObject:string];
    }

    NSArray *_array = [anArray copy];

    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray: _array];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) testPrinter:(NSString*) printerName {
    cups_option_t *options;
    NSString* path = @"/Users/ed/test/test.txt";
    const char *charPath = [path UTF8String];
    const char *charPrinterName = [printerName UTF8String];
    int printJob = cupsPrintFile(charPrinterName, charPath, "my job", 0, options);
}

@end