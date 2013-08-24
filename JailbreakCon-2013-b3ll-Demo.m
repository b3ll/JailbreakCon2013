// JailbreakCon 2013 Demo
// Adam Bell
//
// Quick demo showing off the power of BKSProcessAssertion
// Shows 4 baby apps on top of SpringBoard using cycript :D
// All of this code is used in MessageBox at some point http://www.github.com/b3ll/MessageBox/
// Feel free to message me if you have any questions!

// Cycript Setup (thanks kennytm!) http://iphonedevwiki.net/index.php/User:KennyTM~/std.cy
// Standard C functions
function CGPointMake(x, y) { return {x:x, y:y}; }
function CGSizeMake(w, h) { return {width:w, height:h}; }
function CGRectMake(x, y, w, h) { return {origin:CGPointMake(x,y), size:CGSizeMake(w, h)}; }

// Load in Cycript for /each/ app you want to display
[UIWindow setAllWindowsKeepContextInBackground:YES]

// Replace this function using MobileSubstrate with a dylib into backboardd (or install MessageBox)
static int hax_XPConnectionHasEntitlement(id connection, NSString *entitlement)
{
    //Only grant the required entitlement
    if (xpc_connection_get_pid(connection) == PIDForProcessNamed(@"SpringBoard") && [entitlement isEqualToString:@"com.apple.multitasking.unlimitedassertions"])
        return 1;

    return orig_XPConnectionHasEntitlement(connection, entitlement);
}

// Facebook
app1 = [[SBApplicationController sharedInstance] applicationWithDisplayIdentifier:@"com.facebook.Facebook"];
view1 = [app1 contextHostViewForRequester:@"epichax1" enableAndOrderFront:YES];
[[UIApp keyWindow] addSubview:view1];
view1.transform = CGAffineTransformMakeScale(0.4, 0.4);
view1.frame = CGRectMake(0,0,320,568);

keepAlive1 = [[BKSProcessAssertion alloc] initWithPID:[app1 pid]
                                                   flags:0xF
                                                  reason:7
                                                    name:@"epichax1"
                                             withHandler:nil];

//  kProcessAssertionReasonBackgroundUI = 7

//  ProcessAssertionFlagPreventSuspend         = 1 << 0,
//  ProcessAssertionFlagPreventThrottleDownCPU = 1 << 1,
//  ProcessAssertionFlagAllowIdleSleep         = 1 << 2,
//  ProcessAssertionFlagPreventThrottleDownUI  = 1 << 3

// Twitterrific
app2 = [[SBApplicationController sharedInstance] applicationWithDisplayIdentifier:@"com.iconfactory.Blackbird"];
view2 = [app2 contextHostViewForRequester:@"epichax2" enableAndOrderFront:YES];
[[UIApp keyWindow] addSubview:view2];
view2.transform = CGAffineTransformMakeScale(0.4, 0.4);
view2.frame = CGRectMake(160,0,320,568);

keepAlive2 = [[BKSProcessAssertion alloc] initWithPID:[app2 pid]
                                                   flags:0xF
                                                  reason:7
                                                    name:@"epichax2"
                                             withHandler:nil];

// Meal Plan
app3 = [[SBApplicationController sharedInstance] applicationWithDisplayIdentifier:@"ca.adambell.MealPlan"];
view3 = [app3 contextHostViewForRequester:@"epichax3" enableAndOrderFront:YES];
[[UIApp keyWindow] addSubview:view3];
view3.transform = CGAffineTransformMakeScale(0.4, 0.4);
view3.frame = CGRectMake(0,284,320,568);

keepAlive3 = [[BKSProcessAssertion alloc] initWithPID:[app3 pid]
                                                   flags:0xF
                                                  reason:7
                                                    name:@"epichax3"
                                             withHandler:nil];

// Weather
app4 = [[SBApplicationController sharedInstance] applicationWithDisplayIdentifier:@"com.apple.weather"];
view4 = [app4 contextHostViewForRequester:@"epichax4" enableAndOrderFront:YES];
[[UIApp keyWindow] addSubview:view4];
view4.transform = CGAffineTransformMakeScale(0.4, 0.4);
view4.frame = CGRectMake(160,284,320,568);

keepAlive4 = [[BKSProcessAssertion alloc] initWithPID:[app4 pid]
                                                   flags:0xF
                                                  reason:7
                                                    name:@"epichax4"
                                             withHandler:nil];

