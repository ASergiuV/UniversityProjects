/* server.c */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <ctype.h>
 
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
		char sir[256];
  		int i, nrCaractereLibere=0;
		recv(c, &sir, sizeof(sir), MSG_WAITALL);

		for(i=0; i<strlen(sir); i++){
			if ( sir[i] == ' ' )
				nrCaractereLibere+= 1; 
		}
		printf("%d\n",nrCaractereLibere );
		// deservirea clientului
		send(c, &nrCaractereLibere, sizeof(nrCaractereLibere), 0);

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