#include <stdio.h>

#define SIZE 200

// Calculate a / b
int findperiod( int q[], int i, int r );    //find period
void prtfraction( int q[ ], int start, int tail );  //print quotient 
void prtarray( int q[ ] );

int main()
{
    int a = 0, b = 0, i = 0, start = -1;
    int quotient [ SIZE ] = { 0 }, reminder[ SIZE ] = { 0 };
    
    scanf( "%d%d", &a, &b );
    
    while( i < SIZE )
    {	
        quotient [ i ] = a / b;
        reminder[ i ] = a % b;
        a = reminder[ i ];
        a *= 10;
        start = findperiod( reminder, i, reminder[ i ] );
        if( start != -1 )
    	{
            break;
    	}
        i ++;
    }
    prtfraction( quotient, start, i );
    return 0;
}

void prtfraction( int q[ ], int start, int tail )
{
    int i = 0;
    printf( "%d.",q[ 0 ] );
    for( i = 1; i <= start; i ++ )
    {
        printf( "%d", q[ i ] );
    }
    printf( "T" );
    for( i = start + 1; i <= tail; i ++ )
    {
        printf( "%d", q[ i ] );
    }
    printf( "T\n" );
}

void prtarray( int q[ ] )
{
    int i = 0;
    printf( "%d.", q[ 0 ] );
    for( i = 1; i < SIZE; i ++ )
    {
        printf( "%d", q[ i ] );
    }
}

int findperiod( int q[], int i, int r )
{
    int j = 0, idx = -1;
    for( j = 0; j < i; j ++ )
    {
        if( r == q[ j ] )
    	{
            idx = j;
            break;
    	}
    }
    return idx;
}




