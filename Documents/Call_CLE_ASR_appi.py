import requests
import time

url = "http://202.142.147.3:5005/ClE_ASR"
file_name = 'aa.wav'
file = {'file': (file_name, open(file_name, 'rb'), 'audio/wav')}

start_time = time.perf_counter()
response = requests.post(url, files=file)
end_time = time.perf_counter()
print(f"Time taken: {end_time - start_time:.6f} seconds")

with open("aa.txt", "wb") as f:
    f.write(response.content)

