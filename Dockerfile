
FROM python:3.12

# Klona ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /ComfyUI

# Installera GPU-stöd och beroenden
RUN pip install --upgrade pip && \
    pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121 && \
    pip install -r requirements.txt

# Installera ComfyUI Manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git /ComfyUI/custom_nodes/ComfyUI-Manager

# Starta ComfyUI
CMD python3 main.py --listen 0.0.0.0 --port ${PORT:-8188}
``
