from ultralytics import YOLO

# Load your trained YOLOv8 model
model = YOLO('/home/rajtagore/rgp2_ws/cv/model1.pt')

# Export the model to ONNX format
model.export(format='onnx', opset=12)
