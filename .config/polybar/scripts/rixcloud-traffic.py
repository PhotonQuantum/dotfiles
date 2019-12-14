#!/bin/python
import requests
try:
    traffic_raw = requests.get("https://api.rixcloud.io/v2/profile/service/10701/traffic",
                               auth=("cy.n01@outlook.com", "6aaa7f3e-06bb-4c78-9d86-fe72d055b1c2")).json()
    used = round(traffic_raw["data"]["download"]/1024 **
                 3 + traffic_raw["data"]["upload"]/1024**3, 1)
    total = round(traffic_raw["data"]["total"]/1024**3, 1)
    print(f"{used}G/{total}G")
except requests.exceptions.ConnectionError:
    print("N/A")
