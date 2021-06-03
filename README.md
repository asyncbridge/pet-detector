# pet-detector

This repository is a mypet detector docker container for object detection based on Clova custom extension. 
This detector will response if my pet eats or water. 

## Pre-built based on
- Nvidia Driver 460.80
- Docker CE 18.06.2-ce 
- Nvidia Docker2
- Ubuntu 18.04
- CUDA 10.2  
- cuDNN 8.0  
- Python 3.6.9

## Buid 
```bash
./build.sh
```

## Test
```bash
./run.sh
```

## Reference
- https://github.com/AlexeyAB/darknet  
- https://developers.naver.com/console/clova/custom_ext/  
