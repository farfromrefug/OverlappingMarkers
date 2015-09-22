# [#8591](https://code.google.com/p/gmaps-api-issues/issues/detail?id=8591) marker click: cycle through overlaying markers 

This project is an attempt to replicate the issue documented at:
[gmaps-api-issues/8591](https://code.google.com/p/gmaps-api-issues/issues/detail?id=8591)

Simply try to select markers while marker are overlapping. It should cycle through markers.
Instead the same one always get's selected/unselected
It should also handle "tappable" and GMSPolyline (which i did not add here)

To get this sample to work, first clone the repo in GitHub and checkout
your clone:

    $ git clone https://github.com/YOUR-USER-NAME/OverlappingMarkers.git

Move inside the project:

    $ cd OverlappingMarkers

Download the dependencies:

    $ pod update

Obtain an [API key](https://developers.google.com/maps/documentation/ios/start#obtaining_an_api_key)
and add the resulting API key to the `AppDelegate.m` file:

    $ vim OverlappingMarkers/AppDelegate.m

Open the project:

    $ open OverlappingMarkers.xcworkspace

Edit the resulting project in Xcode until you have the effect you are after,
add the changes and issue a pull request:

    $ git add file-changes.swift
    $ git commit
    $ git push

Thanks!
