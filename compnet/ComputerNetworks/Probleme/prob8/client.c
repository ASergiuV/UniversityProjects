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
  char send_data[5];

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
    int sir1[10]={}, sir2[10]={}, i=0, sem=1, sirComun[10]={};

  	printf("\nDati sir1 de numere(0 pt stop)\n");
    while ( sem != 0 ) {
      scanf("%d",&sir1[i]);
      if ( sir1[i] == 0 )
        sem=0;
      i++;
    }
    sem=1;i=0;
    printf("\nDati sir2 de numere(0 pt stop)\n");
    while ( sem != 0 ) {
      scanf("%d",&sir2[i]);
      if ( sir2[i] == 0 )
        sem=0;
      i++;
    }
    send(c ,&sir1, sizeof(sir1), 0);
    send(c ,&sir2, sizeof(sir2), 0);

  	recv(c, &sirComun, sizeof(sirComun), 0);
    i=0;
    while ( sem != 0 ) {
      printf("%c ", sirComun[i]);
      if ( sirComun[i] == 0)
        sem=0;
      i++;
    }

    //intreb client daca vrea sa inchida sesiunea
    printf("\nApasa q sau Q pt Iesire: ");
    scanf("%s",send_data);
    if (strcmp(send_data , "q") == 0 || strcmp(send_data , "Q") == 0) {
      close(c);
      break;
    }
  }
  return 0;
}