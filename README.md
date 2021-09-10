# Orange-Fruit-Recognition
To do Orange Fruit recognition using Color Based and Edge Based Segmentation.

# Color Based Detection:
Color detection is the process of detecting the name of any color. Human eyes and brains work together to translate light into color. Light receptors that are present in our eyes transmit the signal to the brain. Our brain then recognizes the color. An object has many global features like color and shape, which describe the object as a whole. These
features can be utilized for the detection of an object and tracking it in a sequence of frames. In this section, we will use color as a feature to detect an object with a particular color. This method is useful when an object to be detected is of a specific color and this color is different from the color of the background. If the object and background have the same color, then this method for detection will fail.


# Edge based Segmentation:
In edge-based segmentation, an edge filter is applied to the image, pixels are classified as edge or
non-edge depending on the filter output, and pixels which are not separated by an edge are allocated
to the same category.
Segmentation separates an image into its component regions or objects. Image segmentation t needs
to segment the object from the background to read the image properly and identify the content of
the image carefully. In this context, edge detection is a fundamental tool for image segmentation.

# Steps:
Step 1: Reading the Image <br>
Step 2: To convert image to gray scale. <br>
  Step 2.2: To find orange colored Objects. <br>
  Step 2.3: To get the segmented image for Orange coloured Objects. <br>

-> After get the gray scale image of only the orange fruit from the given image we apply Edge based Segmentation to get a more accurate result with border around the identified      fruit.<br>

Step 3: Detecting the entire Object:<br>
Step 4: Dilating the Image<br>
Step 5: Filling the Interior Gaps <br>
Step 6: Removing Connected Objects on the Border <br>
Step 7: Smoothing the Object <br>
Step 8: To get the original outlined Image.<br>
