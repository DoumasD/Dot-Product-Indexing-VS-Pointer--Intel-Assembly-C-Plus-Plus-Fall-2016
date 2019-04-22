#include<iostream>
using namespace std;

int DotProductPointers(const int* x, const int* y, int size);

static int A[5] = { 1, 2, 3, 4, 5 };
static int B[5] = { 1, 2, 3, 4, 5 };
int main()
{
	int e = DotProductPointers(A, B, 5);
	cout << e << endl;

	system("Pause");
	return 0;
}
