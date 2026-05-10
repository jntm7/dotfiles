# Install llama.cpp with vulkan packages
yay -S llama.cpp-vulkan

# Authenticate HuggingFace w/ token
hf auth login --token your_token

# Download Model
hf download bartowski/Qwen3.6-27B-GGUF \
  --include "*Q3_K_M*" \
  --local-dir ~/models

# Verify install
llama-server --version
vulkaninfo | grep deviceName

# Run
llama-server \
  -m ~/models/Qwen_Qwen3.6-27B-Q3_K_M.gguf \
  -ngl 999 \
  -c 65536 \
  -b 512 \
  --ubatch-size 128 \
  --flash-attn on \
  --cache-type-k q4_0 \
  --cache-type-v q4_0 \
  --host 0.0.0.0 \
  --port 8080
