from ultralytics import YOLO
import torch
import cv2
import matplotlib.pyplot as plt

def process_image_for_detection(model_path):
#def process_image_for_detection(I_rgb, model_path):
    
    model = YOLO(model_path)

    #I_rgb_yolo = cv2.cvtColor(I_rgb, cv2.COLOR_BGR2RGB)
    #results = model(I_rgb_yolo)
    
    results=model('/home/rajtagore/rgp2_ws/src/myboi_haoyi/src/Robocup_files-main/rgbImg.png',show=True,save=True)

    centers = []
    for r in results:
        boxes = r.obb.xywhr
        for box in boxes:
            center_x, center_y = box[0].item(), box[1].item()
            angle_in_degrees = box[4].item() * (180 / torch.pi)
            centers.append((center_x, center_y, angle_in_degrees))

    img_for_plot = I_rgb.copy()

    for center in centers:
        x, y, angle = int(center[0]), int(center[1]), int(center[2])
        text = f"({x}, {y}, {angle})"
        cv2.circle(img_for_plot, (x, y), radius=5, color=(0, 255, 0), thickness=-1)
        cv2.putText(img_for_plot, text, (x, y - 20), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1, cv2.LINE_AA)

    plt.figure(figsize=(10, 10))
    plt.imshow(cv2.cvtColor(img_for_plot, cv2.COLOR_BGR2RGB))
    plt.axis('off')
    plt.show()

    return centers
