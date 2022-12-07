import requests
import json
import sys
from functools import wraps

token=""
headers={"User-Agent":"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36"}
topic="utf8"

def log(func):
    @wraps(func)
    def wrapper(*args,**kwargs):
        try:
            ret=func(*args,**kwargs)
        except Exception as error:
            ret=""
            print("[Error] filename:{} line:{} Error:{}".format(error.__traceback__.tb_frame.f_globals["__file__"],error.__traceback__.tb_lineno,error))
        return ret
    return wrapper

@log
def send(title,content):
    url="http://www.pushplus.plus/send/{}".format(token)
    headers["Content-Type"]="application/json"
    data={"title":title,"content":content,"topic":topic}
    body=json.dumps(data)
    rqt=requests.post(url=url,headers=headers,data=body,timeout=3,verify=False)
    print(rqt.json())

if __name__ == '__main__':
    content=["teamserver","ip","listener","user","computer","process","pid","arch"]
    text="<p>"
    for c in range(1,len(sys.argv)):
        text+="{}:{}<br>".format(content[c-1],sys.argv[c])
    text+="</p>"
    send("CS上线提醒",text)