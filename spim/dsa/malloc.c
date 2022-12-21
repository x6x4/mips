/*  Hi there!!!!!!  */

/*
	That's how malloc looks like:
	void* malloc (size_t size)
	( void* - memory addr type, size_t - uns int type)
*/

#include <stdlib.h>
#include <stdio.h>

typedef struct EMPLOYEE
{
	int age;
	int pay;
	int class;
}
employee;

void print_struct (employee* emp);

int
main ( )
{
	/*  automatic (stack) memory  */
	employee* emp1;
	/*  dynamic (heap) memory  */
	emp1 = malloc (sizeof emp1);

	emp1->age = 34;
	emp1->pay = 24000;
	emp1->class = 12;

	/*  just separate, independent symbol  */
	employee* emp2;
    emp2 = malloc (sizeof emp2);

    emp2->age = emp1->age;
    emp2->pay = emp1->pay;
    emp2->class = emp1->class;

	print_struct (emp1);
	print_struct (emp2);

	return 0;
}

void print_struct (employee* emp)
{
	printf ("age: %d\n", emp->age);
}
