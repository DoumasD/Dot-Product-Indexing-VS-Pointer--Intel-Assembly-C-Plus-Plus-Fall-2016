int DotProductPointers(const int *a, const int *b, int size) {

	const int *p, *q;
	int result = 0;
	for (p = a, q = b; p < a + size; p++, q++) {
		result += *p * *q;
	}
	return result;
}