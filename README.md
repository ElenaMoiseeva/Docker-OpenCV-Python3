#opencv-python3
#Dockerfile for OpenCV, python3. 

Commands:

docker build -t <name>:<tag> . (inside folder with Dockerfile)
docker run -itd --device /dev/null:/dev/raw1394 <name>:<tag> (command "--device /dev/null:/dev/raw1394" to solve an error : "libdc1394 error: Failed to initialize libdc1394")

Then start the container.
