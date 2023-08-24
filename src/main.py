import torch
print("a")
import os
print("b")
os.environ["TRANSFORMERS_CACHE"] = "/tmp"
print("c")
from diffusers import StableDiffusionPipeline, DPMSolverMultistepScheduler
print("d")
model_id = "stabilityai/stable-diffusion-2-1"
print("e")
# Use the DPMSolverMultistepScheduler (DPM-Solver++) scheduler here instead
pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
print("f")
pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)
print("g")
pipe = pipe.to("cuda")

prompt = "a photo of an astronaut riding a horse on mars"
image = pipe(prompt).images[0]
    
image.save("/data/astronaut_rides_horse.png")