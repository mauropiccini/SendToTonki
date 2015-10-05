# SendToTonki
Example app to send pictures to Tonki app

Sending picture from your app to Tonki is easy.
Just copy the picure (or pictures) to the clipboard and open the tonki url ( tonki://create/clipboard )

### How to use
Just download the project, open SendToTonki.xcproject and run it on a device with Tonki app installed ( https://geo.itunes.apple.com/it/app/tonki.com/id964498250?mt=8 ).

### iOS9 schema 
If you see this message in the logs:
```
canOpenURL: failed for URL: "tonki://" - error: "This app is not allowed to query for scheme tonki"
```
you need to decalre in __Info.plist__ the tonki:// scheme

Just add an array named __LSApplicationQueriesSchemes__ with an element with value __tonki__

![alt tag](https://github.com/mauropiccini/SendToTonki/raw/master/docs/infoplist.png)

### Scheme research
To be sure that the Tonki app is installed on the user's phone, you can with canOpenUrl method

### Picture format
JPEG ang PNG are both valid but JPEG is preferred to minimize speed and memory issues

### Picture size
Since the image is copied in the clipboard, reducing the image size is a good thing.
Keep the resolution under 2048x2048. Tonki images are 1024x1024 but a larger image can enable the user to zoom and pan.


