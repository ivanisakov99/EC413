#include <stdio.h>
#include <stdbool.h>
// SOLUTION FILE

main(){
  int var_int;                    // 2

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Ivan Isakov! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type int = %d ", sizeof(var_int));
  char var_char;
  printf("\n size of data type char = %d ", sizeof(var_char));
  long int var_long_int;
  printf("\n size of data type long int = %d ", sizeof(var_long_int));


  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");
  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  
  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);
  //printf("\n uchar2 = %d ", uchar2);
  //printf("\n schar2 = %d ", schar2);
  printf("\nThe difference is that one has to keep track of the sign and the other one does not\n",
  "The signed char is in 2's complement form, so it has to be converted for the output\n");
  

  if(uchar1 > uchar2){
    printf("\nuchar1 = %d\n", uchar1);
  }else{
    printf("\nuchar2 = %d\n", uchar2);
  }

  if(schar1 > schar2){
    printf("\nschar1 = %d\n", schar1);
  }else{
    printf("\nschar2 = %d\n", schar2);
  }

  if(uchar1 > schar1){
    printf("\nuchar1 = %d\n", uchar1);
  }else{
    printf("\nschar1 = %d\n", schar1);
  }

  printf("\nschar1 + schar2 = %d\n", schar1 + schar2);
  printf("As expected");
  printf("\nuchar1 + uchar2 = %d\n", uchar1 + uchar2);
  printf("As expected");
  printf("\nschar1 + uchar1 = %d\n", uchar1 + schar1);
  printf("As expected");


  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;
  bool z;
  printf("\nValue for boolean TRUE = %d\n", x != y);
  printf("\nValue for boolean FALSE = %d\n", x == y);
  //printf("\nValue for size of boolean = %d\n", sizeof(x == y));
  printf("\nValue for size of boolean = %d\n", sizeof(z));
  printf("\nValue for x & y = %d", x & y);
  printf("\nValue for x && y = %d\n", x && y);
  printf("\nValue for ~x = %d", ~x);
  printf("\nValue for !x = %d\n", !x);

  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;
  j = 3;
  k = 8;
  printf("\nshift_char = %d", shift_char);
  printf("\n shift_char << %d = %d", i, shift_char << i);
  printf("\n shift_char >> %d = %d", i, shift_char >> i);
  printf("\n shift_char << by %d = %d", j, shift_char << j);
  printf("\nAs expected. Since 15 is 1111 and 120 is 01111000");
  printf("\n shift_char << by %d = %d", k, shift_char << k);
  printf("\nAs expected");

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[0], *(ip), *(ip+1), *ip++, *ip, *(ip+3), *(ip-1));
  
  printf("\nstart %d %d %d %d %d %d %d \n",
	 a[1], *(ip), *(ip+1), *ip, *(ip+1), *(ip+3), *(ip-1));

  printf("\nSize of int pointer = %d\n", sizeof(ip));
  printf("\nPointer values ip = %x\n", ip);
  printf("\nPointer values ip+1 = %x\n", ip+1);
  printf("The addresses in memory are in hex and each pointer here is an integer pointer which takes 4 bytes\n",
  "And the difference in the addresses is 4");

  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");
  //b[10] = 0; 
  int d[10] = {0,0,0,0,0,0,0,0,0,0};
  int *cp, *ap;
  ip = a;
  ip2 = d;
  j = 9;
  
  for(i = 0; i < 10; i++){
    //printf("\na[%d] = %d", i, *ip);
    
    //*ip2++ = *ip++;
    //*(ip2+i) = *(ip+i);
    *(ip2+i) = *(ip+j);
    j--;
    //printf("\nc[%d] = %d", i, *(ip2-1));
  }
  printf("\na = ");
  for(i = 0; i < 10; i++){
    printf("%d ", *ip++);
  }
  printf("\nc = ");
  for(i = 0; i < 10; i++){
    printf("%d ", *ip2++);
  }
  printf("\n");
  j = 9;
  for(i = 0; i < 10; i++){
    b[i] = a[j];
    j--;
  }
  printf("\n");
  printf("\na = ");
  for(i = 0; i < 10; i++){
    printf("%d ", a[i]);
  }
  printf("\nb = ");
  for(i = 0; i < 10; i++){
    printf("%d ", b[i]);
  }
  
  
  
  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);
  printf("\nH = %d", AString[0]);
  printf("\nA = %d", AString[1]);
  printf("\nL = %d", AString[2]);
  printf("\nValue of the last byte = %d", AString[4]);
  printf("\nThis is the null character");

  printf("\nH + 1 = %c", AString[0] + 1);
  printf("\nA + 1 = %c", AString[1] + 1);
  printf("\nL + 1 = %c", AString[2] + 1);
  printf("\nThe values have changed and the letters have moved by 1 in the alphabet");

  AString[3] = AString[3] + 60;
  printf("\n%s", AString);
  //printf("\n%c", AString[3]);
  printf("\nIt should produce < in the last place, but since it is printed out as a string the last element of the array is ignpred");



  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  ip2 = b;
  for (k = 0; k < 10; k++) {
    printf("\n%d - %x", k, ip2);

    b[k] = a[k];   
    *ip2++;  
  }    // direct reference to array element
  printf("\n");
  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++){
    printf("\n%d - %x", k, ip2);
    *ip2++ = *ip++;
  }      // indirect reference to array element
  printf("\nAs expected");
  // all done
  printf("\n\n ALL DONE\n");
}
