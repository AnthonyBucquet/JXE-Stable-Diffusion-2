import torch
import os
from diffusers import StableDiffusionPipeline, DPMSolverMultistepScheduler

f = open("demofile2.txt", "a")
f.write("Now the file has more content!")
f.close()

model_id = "stabilityai/stable-diffusion-2-1"
# Use the DPMSolverMultistepScheduler (DPM-Solver++) scheduler here instead
pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)
pipe = pipe.to("cuda")

prompt = "a photo of an astronaut riding a horse on mars"
image = pipe(prompt).images[0]
    
image.save("/data/astronaut_rides_horse.png")