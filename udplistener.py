import socket
import os


UDP_IP = "0.0.0.0"
UDP_PORT = int(os.environ['UDPPORT'])

print "Listening on UDP port {}".format(UDP_PORT)

sock = socket.socket(socket.AF_INET,  # Internet  # Is this necessary?
                     socket.SOCK_DGRAM)  # UDP

sock.bind((UDP_IP, UDP_PORT))

while True:
    data, addr = sock.recvfrom(1024)  # buffer size is 1024 bytes
    print data
