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
    int nrAparitii=0;
    char sirC[50],chr[2];
  	printf("\nDati sir de caractere: ");   gets(sirC);
    // printf("sirul este %s \n",sirC );
    printf("\nDati caracter: ");           gets(chr);
    // printf("sirul este %s \n",chr );

    send(c ,&sirC, sizeof(sirC), 0);
    send(c ,&chr, sizeof(chr), 0);

  	recv(c, &nrAparitii, sizeof(nrAparitii), 0);
    printf("Nr de aparitii a caracterului '%s' in '%s' este: %d\n",chr,sirC,nrAparitii);

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