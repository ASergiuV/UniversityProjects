/* client.c */

#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
 
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
  server.sin_port = 1234; //htnos(5005)
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = inet_addr("127.0.0.1");
  
  if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
    printf("Eroare la conectarea la server\n");
    return 1;
  }
  
  while(1){
  	int a, n,suma=0;
  	printf("\nDati lungimea sirului:");
  	scanf("%d", &n);
  	send(c ,&n, sizeof(n), 0);
  	while(n>0) {
  		printf("\nDati nr:");
	  	scanf("%d", &a);
	  	send(c ,&a, sizeof(a), 0);
	  	a=0;
	  	n--;
  	}
  	recv(c, &suma, sizeof(suma), 0);
  	printf("\nSuma este = %d\n", suma);

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