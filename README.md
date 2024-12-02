# Time_and_Length_Stamp_in_a_Video
This MATLAB script allows you to add a length scale and a time stamp to your video. Simply input the original duration of your time-compressed video (in seconds), and the code will automatically adjust the time scale to match your compressed video's timing. Additionally, it overlays a length scale bar on the video.
## How to use the code:
There are two parts in the code. 

Step1: Specify the location of the original video file in line 3. // readFile = " ................................"

Step2: Set the location where the edited video will be saved in line 4. // editedVideoFile = " ........................."
### To add the time stamp:
Step1: Determine the original video duration in seconds and input this value in line 7 of the code.  // originalDuration = -----; 

Step2: Specify the (X, Y) position within the video frames where the timestamp will be displayed. Update this in line 23 of the code.  // timestampPosition = [-- --]; 
       You can use software like ImageJ to identify the exact coordinates within the frames where you want the timestamp to appear. 
       
Step3: Adjust the format for displaying the time values in line 34 of the code.  // timestamp = datestr(seconds(currentTime), '---------'); For example mm:ss or hh:mm:ss or (mm:ss) 

Step4: Modify the font color, text size, and other properties of the timestamp in line 37. // frame = insertText(frame, timestampPosition, timestamp, 'FontSize', 35,'TextColor', 'red', 'BoxOpacity', 0);

### To add the length stamp:
Step1: Input the actual length value (e.g., 55 cm or 50 mm) in line 8 of the code. // lengthScaleValue = 55;

Step2: Specify the pixel value of the measurable length in the video in the 3rd column of the 1D matrix at line 21. Use software like ImageJ to determine this value. // scaleBarPosition = [-- -- ** --];

Step3: In the same previous line, in 1st and 2nd coloumn give the (X,Y) position of the scale bar and in the 4th coloumn give the width of the scale bar. // // scaleBarPosition = [** ** -- **]; 

Step4: Define the position of the text to be displayed below the scale bar at line 22. // scaleTextPosition = [-- --];

Step5: Modify the color of the scale bar at line 40. // frame = insertShape(frame, 'FilledRectangle', scaleBarPosition, 'Color', 'black');

Step6: Define the unit of the length in line 43. // lengthScaleText = sprintf('%d mm', lengthScaleValue);

Step7: Customize the font size, text color, and other text properties for the length scale value in line 44. // frame = insertText(frame, scaleTextPosition, lengthScaleText, 'FontSize', 35, 'TextColor', 'red', 'BoxOpacity', 0);
