from ultralytics import YOLO
import torch
import cv2
import matplotlib.pyplot as plt
import numpy as np


model=YOLO('/home/rajtagore/rgp2_ws/src/myboi_haoyi/src/Robocup_files-main/robocup_obb.pt')
#results=model('/home/rajtagore/rgp2_ws/src/myboi_haoyi/src/Robocup_files-main/rgbImg.png',show=True,save=True)
results=model('/home/rajtagore/rgp2_ws/src/myboi_haoyi/src/Robocup_files-main/rgbimg0327.jpg',show=True,save=True)
centers = []
angles = []
for r in results:

    boxes = r.obb.xywhr

    for box in boxes:
        center_x, center_y = box[0].item(), box[1].item()
        centers.append((center_x, center_y))


        angle_in_degrees = box[4].item() * (180 / torch.pi)
        angles.append(angle_in_degrees)
        print(f"Angle in degrees: {angle_in_degrees}")


print(centers)

img = cv2.imread('D:/PycharmProjects/robocup_getCoordinate/rgbImg.png')


for center, angle in zip(centers, angles):
    x, y = int(center[0]), int(center[1])
    text = f"({x}, {y}, {int(angle)})"


    cv2.circle(img, (x, y), radius=5, color=(0, 255, 0), thickness=-1)


    cv2.putText(img, text, (x, y - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1, cv2.LINE_AA)


img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)


plt.imshow(img_rgb)
plt.axis('off')
plt.show()