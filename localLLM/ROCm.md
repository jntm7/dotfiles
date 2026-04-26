# Arch Linux + ROCm + Radeon GPU (gfx1201)

## Import a GGUF into Ollama
```bash
echo 'FROM /path/to/model-Q3_K_M.gguf' > Modelfile
ollama create my-model -f Modelfile
ollama run my-model
```
## Limit context to save VRAM (for large models)
```bash
cat > Modelfile << 'EOF'
FROM my-model
PARAMETER num_ctx 2048
EOF
ollama create my-model-small-ctx -f Modelfile
```

## llama.cpp (manual build with ROCm + gfx1201)
```bash
# prereqs
sudo pacman -S cmake ninja clang go git rocm-hip-sdk
echo '/opt/rocm/lib' | sudo tee /etc/ld.so.conf.d/rocm.conf
sudo ldconfig

# build
git clone https://github.com/ggerganov/llama.cpp ~/llama.cpp
cd ~/llama.cpp
cmake -B build \
  -DGGML_HIPBLAS=ON \
  -DAMDGPU_TARGETS="gfx1201" \
  -DCMAKE_C_COMPILER=clang \
  -DCMAKE_CXX_COMPILER=clang++
cmake --build build --config Release -j$(nproc)

# add to PATH
echo 'export PATH="$HOME/llama.cpp/build/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

## Update llama.cpp
```bash
cd ~/llama.cpp && git pull
cmake --build build --config Release -j$(nproc)
```

## Quantize a model (requires FP16 source weights)
```bash
# download from HuggingFace
pip install huggingface-hub
huggingface-cli download <org/model> --local-dir ./model-fp16

# convert to GGUF
python ~/llama.cpp/convert_hf_to_gguf.py ./model-fp16 \
  --outfile model-f16.gguf --outtype f16

# quantize
llama-quantize model-f16.gguf model-Q3_K_M.gguf Q3_K_M
```
