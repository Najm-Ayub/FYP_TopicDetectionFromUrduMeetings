import requests
import time

url = "https://api.cle.org.pk/asr"
file_name = 'audio.wav'
file = {'file': (file_name, open(file_name, 'rb'), 'audio/wav')}

start_time = time.perf_counter()
response = requests.post(url, files=file)
end_time = time.perf_counter()
print(f"Time taken: {end_time - start_time:.6f} seconds")

with open("audio.txt", "wb") as f:
    f.write(response.content)

