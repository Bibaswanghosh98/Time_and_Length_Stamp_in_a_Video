clear;
% File paths
readFile = 'F:\Longitudinal and transverse MSD1\M1=M2=100_D1_R\PrasentationVideo\29-07-24_M1_100_M2_100_D1_R_FrameSkip_2.avi';
editedVideoFile = 'F:\Longitudinal and transverse MSD1\M1=M2=100_D1_R\PrasentationVideo\29-07-24_M1_100_M2_100_D1_R_FrameSkip_3.avi';

% Parameters
originalDuration = 425;  % Total duration of the original video in seconds
lengthScaleValue = 55;  % Length scale value (e.g., 50 micrometers)

% Create objects to read and write video frames
vidReader = VideoReader(readFile);
vidWriter = VideoWriter(editedVideoFile);
vidWriter.FrameRate = vidReader.FrameRate;
open(vidWriter);

% Precompute the time step per frame (based on the original video length)
numFrames = vidReader.NumFrames;
timeStep = originalDuration / numFrames;  % Adjusted time step considering the original video length

% Position for the scale bar and text
scaleBarPosition = [50 605 100 10];  % [x y width height] for the bar
scaleTextPosition = [30 610];  % Position for the length scale text
timestampPosition = [10 10];  % Position for the timestamp (top-left corner)

% Read and process each frame
for i = 1:numFrames
    % Read the next video frame
    frame = readFrame(vidReader);

    % Calculate the current time in the adjusted timeline
    currentTime = (i - 1) * timeStep;

    % Generate the timestamp string (in "hh:mm:ss" format)
    timestamp = datestr(seconds(currentTime), 'MM:SS');

    % Add the timestamp to the frame
    frame = insertText(frame, timestampPosition, timestamp, 'FontSize', 35,'TextColor', 'red', 'BoxOpacity', 0);

    % Add the length scale bar
    frame = insertShape(frame, 'FilledRectangle', scaleBarPosition, 'Color', 'black');

    % Add the length scale text
    lengthScaleText = sprintf('%d mm', lengthScaleValue);
    frame = insertText(frame, scaleTextPosition, lengthScaleText, 'FontSize', 35, 'TextColor', 'red', 'BoxOpacity', 0);

    % Write the updated frame to the video writer
    writeVideo(vidWriter, frame);
end

% Clean up
close(vidWriter);
fprintf("Processing complete.\n");
