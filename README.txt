### Facebook Share ###
## uses Facebook graph API ##

This sample shows how to share/post to Facebook wall from iOS application.
===========================================================================
Requirements:
Register your app at "http://developers.facebook.com/"   and use its AppID in the field Client_ID in FacebookShare.m.

Steps:
1.Add all the files and images of the group FBShare to your project.

2.#import"FacebookShare.h" in your current ViewController.h 

3.Add the facebookShareDelegate in header & facebookShareDelegate method in ViewController.m

4.Create an object of FacebookShare & Call the method 
>>>> [FacebookShare postToFacebook: productLink: productImageUrl:]; <<<<<
and pass the contents you need to share/post

You can try the FacebookShareSample project
===========================================================================
