#include <stdio.h>
#include <stdlib.h>

/*
	Vitor Henrique Gratiere Torres
		NUSP 10284952
			BCC B
*/

int n = 0;


void combine(int line1, int line2, double **matrix, double *v){
	int j = 0;
	v[line1] += v[line2];
	for(j = 0; j < n; ++j){
		matrix[line1][j] += matrix[line2][j];//soma a linha 2 na linha 1 (quaisquer sejam as linhas 1 e 2, nao necessariamente consecutivas)
	}
}


void elimination(int indexEl, int linhaEl, double **matrix, double *v){
	int j = 0;
	double correcaodelinha = matrix[linhaEl][indexEl]/matrix[indexEl][indexEl];//correcao de linha eh um item da coluna indexEl da linhaEl dividido pelo item da mesma coluna e da linha indexEl
	v[linhaEl] -= (v[indexEl] * correcaodelinha);//aplica a mesma eliminacao gaussina nas linhas do vetor V
	for(j = 0; j < n; ++j){
		matrix[linhaEl][j] -= (matrix[indexEl][j] * correcaodelinha);//eliminacao gaussiana, subitrai de cada elemento da linha linhaEl os elementos da linha indexEl multiplicados pelo fator de correcao de linha
	}
}


void allocM(double ***matrix){
	int i = 0;
	*matrix = (double **)malloc(sizeof(double *) * n);
	for(i = 0; i < n; i++){
		*(*matrix + i) = (double *)malloc(sizeof(double) * n);
	}
}


void deallocM(double **matrix){
	int i = 0;
	for(i = 0; i < n; i++){
		free(matrix[i]);
	}
	free(matrix);
}


int main(){

	//declaraçoes

	int i = 0, j = 0, k = 0;
	scanf("%d", &n);
	double **m = NULL, det = 1, sum = 0;

	//declaracao dinamica da matriz m

	allocM(&m);

	//declaracao do vetor V

	double *v;
	v = (double *)malloc(sizeof(double)*n);
	for(i = 0; i < n; i++){
		v[i] = i + 1;
	}

	//declaracao do vetor de solucoes

	double *s;
	s = (double *)malloc(sizeof(double)*n);
	for(i = 0; i < n; i++){
		s[i] = 0;
	}

	//escanear a matriz

	for(i = 0; i < n; ++i){
		for(j = 0; j < n; ++j){
			scanf("%lf", &m[i][j]);
		}
	}

	//escalonar a matriz

	for(i = 0; i < n - 1; ++i){
		for(j = i + 1; j < n; ++j){
			if(m[i][i] == 0){//se o pivot for zero
				for(k = j; k < n; ++k){//procura nas linhas de baixo na mesma coluna por algo nao zero
					if(m[k][i] != 0){//se achar
						combine(i, k, m, v);//combina a linha do pivot zero com a linha achada
						break;
					}
					if((k == n - 1) && (m[k][i] == 0)){//se nao achar nenhum nao zero na coluna
						printf("Sistema Indeterminado\n");
						return 0;//encerra o programa
					}
				}
			}
			elimination( i, j, m, v);//depois da verificacao do pivot zero faz a eliminacao gaussiana, alterando tambem o vetor V = {1,2,3,...,n}
		}
	}

	//imprimir a matriz

	for(i = 0; i < n; ++i){
		for(j = 0; j < n; ++j){
			printf("%16.6lf", m[i][j]);//imprime cada item da matriz com uma mascara de 8 digitos (incluindo o sinal) e duas casas apos a virgula
		}
		printf("\n");
	}
	printf("\n");

	//determinante

	for(i = 0; i < n; ++i){
		det *= m[i][i];//determinante apos a eliminacao gaussiana eh o produto da diagonal principal
	}
	if(det - (int)det == 0){//se o determinante nao tiver casas decimais
		printf("Determinante = %.0lf\n", det);//imprime sem casas decimais
	}
	else{//se tiver
		printf("Determinante = %.16lf\n", det);//imprime o determinante com 16 casas decimais
	}

	//dependencia linerar

	if(det == 0){
		printf("Vetores Linearmente Dependentes\n");
		return 0;//encerra o programa, nao tem solucoes
	}
	else{
		printf("Vetores Linearmente Independentes\n");//continua para as solucoes
	}

	//combinacao linear

	printf("Solução: [");
	for(i = n - 1; i >= 0; i--){//percorre a matriz de baixo pra cima
		sum = 0;
		for(j = n - 1; j > i; j--){//percorre a matriz da esquerda pra direita, percorrendo somente o triangulo superior da matriz
			sum += (m[i][j] * s[j]);//somatoria dos produtos da linha pela matriz de solucoes
		}
		s[i] = (v[i] - sum) / m[i][i];//solucao é igual ao (vetor menos a soma) dividido pelo item da linha que se encontra na diagonal principal
	}
	for(i = 0; i < n; i++){//imprime as solucoes
		if(i < n - 1){
			printf("%.6lf; ", s[i]);
		}
		else{
			printf("%.6lf", s[i]);
		}
	}
	printf("]\n");

	//liberar as alocacoes dinamicas

	free(v);
	free(s);
	deallocM(m);

	//encerrar o programa

	return 0;
}
