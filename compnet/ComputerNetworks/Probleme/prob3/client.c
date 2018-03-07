/* client.c */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
 
int main() {
  int c;
  struct sockaddr_in server;
  char send_data[1024], recv_data[1024];

  c = socket(AF_INET, SOCK_STREAM, 0);
  if (c < 0) {
    printf("Eroare la crearea socketului client\n");
    return 1;
  }
  
  memset(&server, 0, sizeof(server));
  server.sin_port = 1234;
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr("127.0.0.1");
  
  if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
    printf("Eroare la conectarea la server\n");
    return 1;
  }
  
  while(1){
    char sir[256], sirNou[256];
  	printf("\nDati sirul: ");
  	gets(sir);
  	send(c ,&sir, sizeof(sir), 0);

  	recv(c, &sirNou, sizeof(sirNou), 0);
  	printf("\nSirul in ordine inversa este = %s\n", sirNou);

  	//verific daca s-a inchis serverul
  	recv(c,recv_data,1024,0);
  	if (strcmp(recv_data , "q") == 0 || strcmp(recv_data , "Q") == 0) {
  		close(c);
  		break;
  	}else {
		//intreb client daca vrea sa inchida sesiunea
		printf("\nApasa q sau Q pt Iesire: ");
		scanf("%s",send_data);
		if (strcmp(send_data , "q") == 0 || strcmp(send_data , "Q") == 0) {
			close(c);
			break;
		}
	}

  }
  return 0;
}