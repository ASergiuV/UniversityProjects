/* server.c */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>
 
int main() {
	int s;
	struct sockaddr_in server, client;
	int c;
	socklen_t l;
	char send_data[5];

	s = socket(AF_INET, SOCK_STREAM, 0);
	if (s < 0) {
		printf("Eroare la crearea socketului server\n");
		return 1;
	}

	memset(&server, 0, sizeof(server));
	server.sin_port = 1234;
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
		int sir1[10]={}, sir2[10]={}, i=0, j=0, sirComun[10]={},n=0,m=0;

		recv(c, &sir1, sizeof(sir1), MSG_WAITALL);
		recv(c, &sir2, sizeof(sir2), MSG_WAITALL);

		printf("sir1: %d\n",strlen(sir1) );
		
		printf("sir2: %d\n",strlen(sir2) );

		printf("sirComun: %d\n",strlen(sirComun) );

		for(i=0;i<strlen(sir1);i++)
			for(j=0;j<strlen(sir2);j++)
				if ( sir1[i] == sir2[j] )
					for (m=0;m<strlen(sirComun);m++)
						if ( sir1[i] != sirComun[m]){
							sirComun[n] = sir1[i];
							n++;
						}

		// deservirea clientului
		send(c, &sirComun, sizeof(sirComun), 0);

		//intreb server daca vrem shut Down...
	  	printf("\nApasa q sau Q pt Iesire: ");
		scanf("%s",send_data);
		if (strcmp(send_data , "q") == 0 || strcmp(send_data , "Q") == 0) {
			close(s);
			break;
		}
	}
	return 0;
}