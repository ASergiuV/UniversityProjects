import socket
import sys

sock=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
sock.settimeout(5.0)
server_address = ('localhost',1234)
print('starting up on %s port %s' % server_address)
sock.bind(server_address)
try:
    while True:
        print('\nwaiting to recieve')
        data, address = sock.recvfrom(4096)
        print('recieved %s bytes from %s' % (len(data), address))
        print(data)

        if data:
            sent = sock.sendto(data, address)
            print('sent %s bytes back to %s' % (sent, address))
except socket.timeout:
#except Exception:
    print('Socket has timed out !!\nExiting!\n')
    exit(0)