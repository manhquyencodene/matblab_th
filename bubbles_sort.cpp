#include <stdio.h> 

void swap(int* a, int* b ) {
	int temp ; 
	temp = *a ; 
	*a = *b ; 
	*b = temp ; 
} 
void bbs(int arr[], int n ){
	int i , j ; 
	for ( i = 0 ; i < n - 1; i++ ){
		for(j = 0 ; j < n - i - 1 ;j ++  ){
			if(arr[j] > arr[j + 1]){
				swap(&arr[j],&arr[j+1]);
			} 
		}
	}
}
int main() {
    int arr[] = {64, 25, 12, 22, 11};
    int n = sizeof(arr) / sizeof(arr[0]);
    bbs(arr, n);
    printf("Sorted array: \n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    return 0;
}
// bubles sort max 


void bubbleSortMax(int arr[], int n) {
    bool swapped;
    for (int i = 0; i < n - 1; i++) {
        swapped = false; 
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
            
                swap(&arr[j], &arr[j + 1]);
                swapped = true; 
            }
        }
        if (!swapped) {
            break;
        }
    }
}


