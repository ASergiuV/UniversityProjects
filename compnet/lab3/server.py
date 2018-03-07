__author__ = 'dadi'

import socket
import threading
import random
import struct
import sys
import time

random.seed()
start = 1; stop = 2**17-1
my_num = random.randint(start, stop)
print('Server number: ', my_num)
client_guessed = False
client_count = 0

def worker(cs):
    global client_guessed, my_num, winner_client, client_count
    cs.settimeout(5)
    while True:
        try:
            cnumber, address = cs.recvfrom(4)
            cnumber=struct.unpack('!I',cnumber)[0]
            if client_guessed:
                cs.sendto(b'F',address)
            elif cnumber > my_num:
                cs.sendto(b'L',address)
            elif cnumber < my_num:
                cs.sendto(b'H',address)
            elif cnumber== my_num:
                client_guessed=True
                cs.sendto(b'G',address)

        except socket.error as msg:
            print('Error:',msg.strerror)
            break

    
    print('the game has eneded')

if __name__=='__main__':
    try:
        rs=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        rs.bind( ('0.0.0.0',1234) )
    except socket.error as msg:
        print(msg.strerror)
        exit(-1)

    worker(rs)
    