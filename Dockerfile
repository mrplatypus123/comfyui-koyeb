
FROM python:3.12

# Installera systemberoenden
RUN apt-get update && apt-get install -y git

# Klona ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /ComfyUI

# Installera Python-bibliotek med CUDA-stöd
RUN pip install --upgrade pip &&     pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 &&     pip install -r requirements.txt

RUN pip install wget

# Installera ComfyUI Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /ComfyUI/custom_nodes/ComfyUI-Manager

RUN wget https://huggingface.co/NSFW-API/NSFW-Wan-UMT5-XXL/resolve/main/nsfw_wan_umt5-xxl_fp8_scaled.safetensors -O /ComfyUI/models/text_encoders/nsfw_wan_umt5-xxl_fp8_scaled.safetensors


# Starta ComfyUI
CMD ["python3", "main.py", "--listen", "0.0.0.0", "--port", "8188"]
