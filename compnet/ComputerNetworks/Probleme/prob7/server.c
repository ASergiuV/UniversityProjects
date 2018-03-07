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
		int i=0,l=0,n=0,j=0;
    	char sir[50],subsir[20]={};

		recv(c, &sir, sizeof(sir), MSG_WAITALL);
		recv(c, &i, sizeof(i), MSG_WAITALL);
		recv(c, &l, sizeof(l), MSG_WAITALL);

	    // printf("sirul este %s \n",sir );
	    // printf("nr i este: %d \n",i );
	    // printf("nr l este: %d \n",l );

	    while( n < strlen(sir) && l > 0){
	    	if ( n >= i ){
	    		subsir[j]=sir[n];
	    		// printf("in if: %c ... j=%d   l=%d \n", subsir[j], j, l);
	    		j++;
	    		l--;
	    	}
	    	n++;
	    }

	    // printf("subsirul este %s \n",subsir );

		// deservirea clientului
		send(c, &subsir, sizeof(subsir), 0);

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