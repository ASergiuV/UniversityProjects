/* server.c */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
 
int main() {
	int s;
	struct sockaddr_in server, client;
	int c, l;
	char send_data[1024];

	s = socket(AF_INET, SOCK_STREAM, 0);
	if (s < 0) {
		printf("Eroare la crearea socketului server\n");
		return 1;
	}

	memset(&server, 0, sizeof(server));
	server.sin_port = 1234;//hrnos(5005)
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;

	if (bind(s, (struct sockaddr *) &server, sizeof(server)) < 0) {
		printf("Eroare la bind\n");
		return 1;
	}

	listen(s, 5);

	l = sizeof(client);
	memset(&client, 0, sizeof(client));
	c = accept(s, (struct sockaddr *) &client, &l);
	printf("S-a conectat un client.\n");

	while (1) {
		int a, n, suma=0;
		recv(c, &n, sizeof(n), MSG_WAITALL);
		printf("Am primit un sir de lungime: %d\n", n);
		while(n>0) {
			recv(c, &a, sizeof(a), MSG_WAITALL);
			suma = suma + a;
			a=0;
			n--;
		}
		// deservirea clientului
		send(c, &suma, sizeof(suma), 0);

		//intreb server daca vrem shut Down...
	  	printf("\nApasa q sau Q pt Iesire: ");
		scanf("%s",send_data);
		if (strcmp(send_data , "q") == 0 || strcmp(send_data , "Q") == 0) {
			send(c, send_data,1024, 0); 
			close(c);
			break;
		}else send(c, send_data,1024, 0);
	}
	return 0;
}