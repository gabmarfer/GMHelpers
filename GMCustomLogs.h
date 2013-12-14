//
//  GMCustomLogs.h
//  iParticipa
//
//  Created by Gabi Martelo on 14/12/13.
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

/*
 * Manage custom logs
 */

// Turn ON custom logs
#define GMLog(fmt, ...) NSLog((@"%s: " fmt), __PRETTY_FUNCTION__, ##__VA_ARGS__);

// Turn OFF custom logs
//#define GMLog(...) do {} while(0)
