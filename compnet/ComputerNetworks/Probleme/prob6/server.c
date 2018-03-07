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
		int nrAparitii=0, i=0;
		char sirC[50]={}, chr[2]={};
		recv(c, &sirC, sizeof(sirC), MSG_WAITALL);
		recv(c, &chr, sizeof(chr), MSG_WAITALL);
		// printf("sirul este %s\n", sirC);
		// printf("char este %s\n", chr);
		while(i<strlen(sirC)){
			// printf("sunt la char: %c\n",sirC[i] );
			if ( sirC[i] == chr[0] ){
				nrAparitii++;
				// printf("Am gasit egal char: %c \n",sirC[i]);
			}
			i++;
		}
		// printf("apare de %d\n",nrAparitii );
		// deservirea clientului
		send(c, &nrAparitii, sizeof(nrAparitii), 0);

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