import socket
import sys
import time
import struct
msg = 'echo message'
sock=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
server_address = ('localhost',1234)


try:
    while True:
        print('sending %s\n' % msg)
        time1=time.time()

        sent = sock.sendto(bytes(msg, "utf-8"), server_address)
        #time.sleep(2)
        print('waiting to recieve\n')
        data, server = sock.recvfrom(4096)
        time2=time.time()
        
        if(data.decode("utf-8")==msg):
            print('recieved %s in ' % data)
            print(time2-time1)
        else:
            print('send and recieved packets do not match')
finally:
    print('closing socket')
    sock.close()