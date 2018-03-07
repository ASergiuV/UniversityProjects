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
    int i,l;
    char sir[50],subsir[20];
  	printf("\nDati sir de caractere: ");gets(sir);
    printf("\nDati i(poz de unde incepe subsirul): ");scanf("%d",&i);
    printf("\nDati l(lung subsir): ");scanf("%d",&l);

    // printf("sirul este %s \n",sir );
    // printf("nr i este: %d \n",i );
    // printf("nr l este: %d \n",l );

    send(c ,&sir, sizeof(sir), 0);
    send(c ,&i, sizeof(i), 0);
    send(c ,&l, sizeof(l), 0);

  	recv(c, &subsir, sizeof(subsir), 0);
    printf("sir '%s' subsirul de incepe pe poz '%d' de lung '%d' este: %s\n",
                  sir, i, l, subsir);

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