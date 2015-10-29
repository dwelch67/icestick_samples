//-------------------------------------------------------------------------
//-------------------------------------------------------------------------
#include <stdio.h>
#include <stdlib.h>

static void assemble(void);

static unsigned int __pc__, __resized__, __pass__;
static FILE *       __target__;
static char *       __target_filename__ = "out.csv";

static int quit(char *message, int exitcode)
{
    puts(message);
    exit((unsigned)exitcode);
    return 0;
}

int main ( void )
{
    for(;;)
    {
        __pc__ = __resized__ = 0;
        assemble();
        __target__ && fclose(__target__) && quit("Assembly Failed: target file failed to close.", 1);
        __target__ && __resized__ && quit("Assembly Failed: binary changed sized during output pass.", 1);
        __target__ && quit("Assembly Succeeded.", 0);
        __resized__ && printf("Pass %d completed, but another pass is required.\n", ++__pass__);
        if (!__resized__)
        {
            printf("Pass %d completed, starting output pass.\n", ++__pass__);
            __target__ = fopen(__target_filename__, "wb");
        }
    }
}


// Target generation
#define emit(x)      do { if(__target__) fprintf(__target__,"mem[%u].value <= 16h%04X;\n",(unsigned short)__pc__,(unsigned short)x); __pc__++; } while(0)
//#define fillb(size, value) do { int i; for(i=0; i<size; i+=2) emit1(value|(value<<8)); } while(0)
//#define string(x)    do { char string[] = x; int i; for(i=0; i<sizeof string; i++) emit(string[i]); } while(0)

// Directives
#define equ(name, value)  unsigned int name = value
#define declare(name)     static int name
#define label(name)       do { __resized__ |= (name != __pc__); name = __pc__; } while(0)


void do_add ( unsigned int ra, unsigned int rb, unsigned int rc )
{
    if((ra>7)||(rb>7)||(rc>7))
    {
        printf("do_add limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((0<<13)|(ra<<10)|(rb<<7)|(rc));
}
void do_addi ( unsigned int ra, unsigned int rb, unsigned int simm )
{
    if((ra>7)||(rb>7))
    {
        printf("do_addi limit fail pc = %u \n",__pc__);
        exit(1);
    }
    if(simm&0x0040)
    {
        if((simm&0xFFC0)!=0xFFC0)
        {
            printf("do_addi limit fail pc = %u \n",__pc__);
            exit(1);
        }
    }
    else
    {
        if((simm&0xFFC0)!=0x0000)
        {
            printf("do_addi limit fail pc = %u \n",__pc__);
            exit(1);
        }
    }

    emit((1<<13)|(ra<<10)|(rb<<7)|(simm&0x7F));
}
void do_nand ( unsigned int ra, unsigned int rb, unsigned int rc )
{
    if((ra>7)||(rb>7)||(rc>7))
    {
        printf("do_nand limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((2<<13)|(ra<<10)|(rb<<7)|(rc));
}
void do_lui ( unsigned int ra, unsigned int imm )
{
    if((ra>7)||((imm&0xFFC0)!=imm))
    {
        printf("do_lui limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((3<<13)|(ra<<10)|(imm>>6));
}
void do_sw ( unsigned int ra, unsigned int rb, int simm )
{
    if((ra>7)||(rb>7)||(simm>63)||(simm<-64))
    {
        printf("do_sw limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((4<<13)|(ra<<10)|(rb<<7)|(simm&0x7F));
}
void do_lw ( unsigned int ra, unsigned int rb, int simm )
{
    if((ra>7)||(rb>7)||(simm>63)||(simm<-64))
    {
        printf("do_lw limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((5<<13)|(ra<<10)|(rb<<7)|(simm&0x7F));
}
void do_beq ( unsigned int ra, unsigned int rb, int simm )
{
    if((ra>7)||(rb>7)||(simm>63)||(simm<-64))
    {
        printf("do_beq limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((6<<13)|(ra<<10)|(rb<<7)|(simm&0x7F));
}
void do_jalr ( unsigned int ra, unsigned int rb )
{
    if((ra>7)||(rb>7))
    {
        printf("do_jalr limit fail pc = %u \n",__pc__);
        exit(1);
    }
    emit((7<<13)|(ra<<10)|(rb<<7));
}
void do_lea ( unsigned int ra, unsigned int imm )
{
    if((ra>7)||(imm>0xFFFF))
    {
        printf("do_lea limit fail pc = %u \n",__pc__);
        exit(1);
    }
    if((imm&0x3F)==0)
    {
        do_lui(ra,imm);
    }
    else if((imm&0xFFC0)==0x0000)
    {
        do_addi(ra,0,imm&0x7F);
    }
    else if((imm&0xFFC0)==0xFFC0)
    {
        do_addi(ra,0,imm&0x7F);
    }
    else
    {
        do_lui(ra,imm&0xFFC0);
        do_addi(ra,0,imm&0x3F);
    }
}
void do_or ( unsigned int ra, unsigned int rb, unsigned int rc, unsigned int rd, unsigned int re )
{
    //c = a or b:
    //d = b nand b
    //e = c nand c
    //a = d nand e
    do_nand(rd,rb,rb);
    do_nand(re,rc,rc);
    do_nand(ra,rd,re);
}

#define add(ra,rb,rc)       do_add(ra,rb,rc)
#define addi(ra,rb,simm)    do_addi(ra,rb,simm)
#define nand(ra,rb,rc)      do_nand(ra,rb,rc)
#define lui(ra,imm)         do_lui(ra,imm)
#define sw(ra,rb,simm)      do_sw(ra,rb,simm)
#define lw(ra,rb,simm)      do_lw(ra,rb,simm)
#define beq(ra,rb,simm)     do_beq(ra,rb,simm - 1 - __pc__)
#define jalr(ra,rb)         do_jalr(ra,rb)
#define halt()              emit(0xFFFF);


#define lea(ra,imm)         do_lea(ra,imm)
#define or(ra,rb,rc,rd,re)  do_or(ra,rb,rc,rd,re)



unsigned int r0 = 0, r1 = 1, r2 = 2, r3 = 3, r4 = 4, r5 = 5, r6 = 6, r7 = 7;

#define START(filename) void assemble(void) { __target_filename__ = filename;
#define END   for(;__pc__<16;) emit(0xFFFF); }

