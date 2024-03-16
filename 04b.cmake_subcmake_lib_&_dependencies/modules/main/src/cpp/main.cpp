#include <iostream>
#include <regex>
#include <string>
#include <vector>

#include "base64.h"


using namespace std;


int main()
{
	int rawByteLen = 6;
	char bytes[] = {1, 2, 3, 4, 5, 0};

	printf("rawByteLen = %d\n", rawByteLen);

	printf("raw bytes: ");
	for (int i = 0; i < rawByteLen; i++)
	{
		printf("%d ", bytes[i]);
	}

	printf("\n");

	int encode_len = Base64encode_len(rawByteLen);
	char *base64 = new char[encode_len];

	Base64encode(base64, bytes, rawByteLen);

	printf("encode_len = %d\n", encode_len);
	printf("%s\n", base64);

	int decode_char_array_len = Base64decode_len(base64);
	int decode_data_len = decode_char_array_len - 1;
	char* decodeBytes = new char(decode_char_array_len);

	Base64decode(decodeBytes, base64);

	printf("decode_char_array_len = %d\n", decode_char_array_len);
	printf("==> decoded bytes length is %d\n", decode_data_len);

	printf("decoded data: ");
	for (int i = 0; i < decode_data_len; i++)
	{
		printf("%d ", decodeBytes[i]);
	}

	printf("\n");
    return 0;
}

