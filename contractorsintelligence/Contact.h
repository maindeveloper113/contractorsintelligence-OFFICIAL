//
//  Contact.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#ifndef contractorsintelligence_Contact_h
#define contractorsintelligence_Contact_h

#define ISIPHONE5 (([[UIScreen mainScreen] bounds].size.height == 568) ? 1 : 0)


#define SERVICEPATH		@"https://www.contractorsischool.com/mobile-services/"
//#define SERVICEPATH		@"https://www.contractorsischool.com/Services/"
//#define SERVICEPATH		@"http://192.168.0.12/ExamPrep/Services/"

#define LOGIN                 SERVICEPATH	  @"login.php"
#define REGISTRATION          SERVICEPATH	  @"createaccount.php"
#define SEND_PASSWORD         SERVICEPATH     @"forgot_password.php"
#define UPLOAD_APPLICATION    SERVICEPATH     @"upload_application.php"
#define TEST_SUBSCRIPTION     SERVICEPATH     @"get_test_subscription.php"
#define ONLION_TEST           SERVICEPATH     @"get_test_subtests.php"
#define UPDATE_ACCOUNT        SERVICEPATH     @"updateaccount.php"
#define LEVEL0_DEMOTEST       SERVICEPATH     @"level0_demotest.php"
#define GETCLASSIFICATION     SERVICEPATH     @"getClassification.php"
#define DISPLAYCATEGORY       SERVICEPATH     @"displaycategory.php"
#define DISPLAYCATEGORY       SERVICEPATH     @"displaycategory.php"
#define REGISTER_DEVICE_TOKEN SERVICEPATH     @"updatedevice.php"


#endif