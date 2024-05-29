#!/usr/bin/env python
import numpy as np
from getImages import get_images
import cv2
from getTransMatrix import get_transformation_matrix
from ultralytics import YOLO
import torch
import cv2
import matplotlib.pyplot as plt
import numpy as np
from detection import process_image_for_detection






def display_images():
    I_rgb, I_depth = get_images()
    if I_rgb is not None:
        cv2.imshow("RGB Image", I_rgb)
    if I_depth is not None:
        cv2.imshow("Depth Image", I_depth)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

def print_transMatrix():
    TransMatrix = get_transformation_matrix('panda_link0', 'camera_depth_link')
    if TransMatrix is not None:
        print("Transformation Matrix:\n", TransMatrix)
    else:
        print("Failed to get transformation matrix.")

if __name__ == '__main__':
    #display_images()
    #print_transMatrix()
    I_rgb, I_depth = get_images()
    TransMatrix = get_transformation_matrix('panda_link0', 'camera_depth_link')
    cv2.imwrite('rgbimg0327.jpg',I_rgb)
   # centers = process_image_for_detection(I_rgb, 'robocup_obb.pt')
    #centers = process_image_for_detection('robocup_obb.pt')

