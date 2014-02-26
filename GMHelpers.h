//
//  GMHelpers.h
//  
//
//  Created by Gabi Martelo on 28/10/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import <Foundation/Foundation.h>

UIImage *loadImageWithName(NSString *name);

NSString *pathInDocumentDirectory(NSString *fileName);

NSString *pathInLibraryCacheDirectory(NSString *fileName);

NSString *pathInTmpDirectory(NSString *fileName);

BOOL addSkipBackupAttributeToItemAtURL(NSURL *URL);

