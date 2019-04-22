int DotProduct(int x[], int y[], int xsize, int ysize)
{
	int result = 0;
	int j = 0;
	for (int i = 0; i < xsize; i++)
	{
		result = (x[i] * y[j]) + result;
		j++;
	}

	return result;

}