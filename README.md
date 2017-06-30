# Photos App

Given a plist file that defines a dictionary where the keys are image names and the values are strings that contain a url address that points to an image, create an app that contains a table view that displays the list of images and image names. If the user selects an item in the table view display a detail page that shows the title of the image at the top of the screen and use the rest of the screen to display the image. 



## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/tikekar/Photos/blob/master/PhotosApp_Walkthrough.gif' title='Video Walkthrough' width='200px' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Features
1. Added a List of image names and image urls in the plist file.
2. When app is opened, showing images in a tableView.
3. Implement searching of images with simple image name searching. Search as you type
4. When image cell is clicked, go to details page.
5. Show image name in the navigation bar title and full screen image on the page.
6. Image Details page: Allows zooming of the image
7. Image Details page: Shows a strip of similar images at the bottom of the screen. Eg. if the image is Red Flower, then all the images having Red or Flower will show up in the strip.
8. Image Details Page: When the page loads, there is a fading effect to load the image.
9. The image loading is done two ways - Using AFNetworking (using cocoapods) and my own UIImageView extension code.
10. URLCache is used to cache images.

## Code Structure
1. "Photo" model class.
2. "utilities" for ImageViewExtension for image loading.
3. ViewController and custom TableViewCell and CollectionViewCell

## UI Components Used
1. Navigation Controller
2. Container View embedded inside the PhotoDetailsViewController to show the bottom similar photos strip.
3. Table View
4. Collection View
5. Search Bar inside TableView


## License

    Copyright [2017] [Gauri Tikekar]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

