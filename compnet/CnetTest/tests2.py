import socket
import struct
import threading

clients = []

def clientTh(client,addr):
    while True:
        #asteapta sa primeasca
        recieved = client.recv(1024)
        for c in clients:
            c.sendall(recieved)
            #trimite ce a primit
        recieved = recieved.decode('utf-8')
        print(recieved)
        #afiseaza ce a primit
        
    client.close()

if __name__ == '__main__':
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('localhost',1234))
    s.listen(5)
    print("server started\n")
    while 1:
        connection, client_address = s.accept()
        print ('new connection from', client_address)
        clients.append(connection)
        t = threading.Thread(target=clientTh, args=(connection,client_address))
        t.start()
