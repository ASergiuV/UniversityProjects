import socket
import time
import sys
import threading



def sendMsg():
    global s,secunde
    print("sender started")
    message=str(s.getsockname()[1])+"dsadsa"
    while 1:
        print ('%s: sending "%s"' % (s.getsockname(), message))
        s.send(bytes(message,'utf-8'))
        
        time.sleep(secunde)

def reciever():
    global s
    print("reciever started")
    while 1:
        data = s.recv(1024)
        data=data.decode('utf-8')
        print ('%s: received "%s"' % (s.getsockname(), data))


if __name__ == '__main__':
    try:
        s = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
        server_address = ('localhost',1234)
        s
        print(s.getsockname())
    except socket.error as msg:
        print("Error: ",msg.strerror)
        exit(-1)
  
    secunde=int(sys.argv[1])
    try:
        s.connect(server_address)
    except:
        print("Unable to connect")
        exit(-2)
    print("successfully connected")
    sendThread=threading.Thread(target=sendMsg,args=())
    
    recvThread=threading.Thread(target=reciever,args=())
    sendThread.start()
    recvThread.start()
    

