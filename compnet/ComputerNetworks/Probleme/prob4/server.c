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
		char sir1[256], sir2[256], sirInterclasat[256]={};
  		int i=0, j=0, k=0, l=0;
		recv(c, &sir1, sizeof(sir1), MSG_WAITALL);
		recv(c, &sir2, sizeof(sir2), MSG_WAITALL);
		int n=strlen(sir1)-1, m=strlen(sir2)-1;
		while( i<=n && j<=m )
			// printf("sir1 %c\n",sir1[i] );
			// printf("sir2 %c\n",sir2[j] );
			if (sir1[i]<sir2[j]){
				//printf("sir1 %c\n",sir1[i] );
				sirInterclasat[k]=sir1[i];
				//printf("sirint %c\n",sirInterclasat[k] );
				k++;
				i++;
			}else{
				//printf("sir2 %c\n",sir2[j] );
				sirInterclasat[k]=sir2[j];
				//printf("sirint %c\n",sirInterclasat[k] );
				k++;
				j++;
			}
		// printf("sir1: %s\n",sir1 );
		// printf("sir2: %s\n",sir2 );
		// printf("sirInterclasat: %s\n",sirInterclasat );
		// printf("-----------\n");
		if ( i<=n )
			for(l=i;l<=n;l++){
				sirInterclasat[k]=sir1[l];
				k++;
			}
		if ( j<=m )
			for(l=j;l<=m;l++){
				sirInterclasat[k]=sir2[l];
				k++;
			}

		// deservirea clientului
		send(c, &sirInterclasat, sizeof(sirInterclasat), 0);

		//intreb server daca vrem shut Down...
	  	printf("\nApasa q sau Q pt Iesire: ");
		scanf("%s",send_data);
		if (strcmp(send_data , "q") == 0 || strcmp(send_data , "Q") == 0) {
			send(c, send_data,1024, 0); 
			close(c);
			close(s);
			break;
		}else send(c, send_data,1024, 0);
	}
	return 0;
}