#include<iostream>
#include<windows.h>;
using namespace std;



int DotProduct(int x[], int y[], int xsize, int ysize);

static int A[5] = { 1, 2, 3, 4, 5 };
static int B[5] = { 1, 2, 3, 4, 5 };
int main()
{


	int e = DotProduct(A, B, 5, 5);
	cout << e << endl;

	system("Pause");
	return 0;
}
