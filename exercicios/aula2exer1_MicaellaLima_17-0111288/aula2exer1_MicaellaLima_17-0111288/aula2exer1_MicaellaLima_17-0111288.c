#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024
#define MAX_NUM_CARROS 1024
#define MAX_NUM_PESSOAS 1024

typedef struct Carro {
    char modelo[20];
    char marca[20];
    char renavam[12];
    char cor[30];
    char anoFabricacao[5];
    char cpfProprietario[12];
} Carro;

typedef struct Pessoa {
    char nome[40];
    char cpf[12];
    char dataNascimento[11];
} Pessoa;

Carro CARROS_DB[MAX_NUM_CARROS];
int idx_carros = 0;

Pessoa PESSOAS_DB[MAX_NUM_PESSOAS];
int idx_pessoas = 0;

FILE *arquivo_carros = NULL;
FILE *arquivo_pessoas = NULL;

int carrega_carros_salvos(void);
int carrega_pessoas_salvas(void);
int criar_registro(void);
int pessoa_ja_cadastrada(char *);
int carro_ja_cadastrado(char *);
void sort_array(void);
void listar_pessoas(void);
void listar_carros(void);
int registrar_veiculos(char *);
int registrar_veiculo(char *);
int cadastrar_carro_pessoa_cadastrada (void);

int main(void) {
    carrega_pessoas_salvas();
    carrega_carros_salvos();

    int num;
    do {

        printf("\n\n\n");
        printf("***** Menu Sistema Carro-Pessoa *****\n\n");
        printf("Digite o número da ação desejada\n\n");

        printf("1 - Cadastro de Registro (Pessoa e seus veículos)\n\n");
        printf("2 - Listar Pessoas Cadastradas\n");

        printf("3 - Cadastrar Veículos de pessoas já cadastradas\n");
        printf("4 - Listar Veículos Cadastrados\n");
        printf("5 - Sair\n\n");

        scanf("%d", &num);

        if (num == 1) criar_registro();
        else if (num == 2) listar_pessoas();
        else if (num == 3) cadastrar_carro_pessoa_cadastrada();
        else if (num == 4) listar_carros();

    } while (num != 5);

    listar_pessoas();
    printf("\n");
    listar_carros();

    return 0;
}

/* Funções para carregar dados dos arquivos*/

int carrega_carros_salvos(void) {
    FILE *fp = fopen("./files/carros.csv", "r");

    char *line_buf = NULL;
    size_t line_buf_size = 0;
    ssize_t line_size;

    // Get the first line of the file.
    line_size = getline(&line_buf, &line_buf_size, fp);

    while ((line_size = getline(&line_buf, &line_buf_size, fp)) != -1) {
        
        char *modelo = strtok(line_buf, ",");
        char *marca = strtok(NULL, ",");
        char *renavam = strtok(NULL, ",");
        char *cor = strtok(NULL, ",");
        char *anoFabricacao = strtok(NULL, ",");
        char *cpfProprietario = strtok(NULL, "\n");

        strcpy(CARROS_DB[idx_carros].modelo, modelo);
        strcpy(CARROS_DB[idx_carros].marca, marca);
        strcpy(CARROS_DB[idx_carros].renavam, renavam);
        strcpy(CARROS_DB[idx_carros].cor, cor);
        strcpy(CARROS_DB[idx_carros].anoFabricacao, anoFabricacao);
        strcpy(CARROS_DB[idx_carros].cpfProprietario, cpfProprietario);

        idx_carros++;
    }

    fclose(fp);
    return EXIT_SUCCESS;
}

int carrega_pessoas_salvas(void) {
    FILE *fp = fopen("./files/pessoas.csv", "r");

    if (!fp) {
        fprintf(stderr, "Error opening file /files/pessoas.csv\n");
        return EXIT_FAILURE;
    }

    char *line_buf = NULL;
    size_t line_buf_size = 0;
    ssize_t line_size;

    // Get the first line of the file.
    line_size = getline(&line_buf, &line_buf_size, fp);

    while ((line_size = getline(&line_buf, &line_buf_size, fp)) != -1)
    {
        char *nome = strtok(line_buf, ",");
        char *cpf = strtok(NULL, ",");
        char *dataNascimento = strtok(NULL, "\n");

        strcpy(PESSOAS_DB[idx_pessoas].nome, nome);
        strcpy(PESSOAS_DB[idx_pessoas].cpf, cpf);
        strcpy(PESSOAS_DB[idx_pessoas].dataNascimento, dataNascimento);
        
        idx_pessoas++;
    }

    fclose(fp);
    return EXIT_SUCCESS;
}

/* Funções para salvar dados no arquivo */

int salvar_veiculos(void) {
    FILE *fp = fopen("./files/carros.csv", "w");

    if (!fp)
    {
        fprintf(stderr, "Error opening file /files/carros.csv\n");
        return EXIT_FAILURE;
    }

    fprintf(fp, "modelo,marca,renavam,cor,anoFabricacao,cpfProprietario\n");
    
    for(int i=0; i<idx_carros; i++)
    {
        fprintf(fp, "%s,%s,%s,%s,%s,%s\n", 
            CARROS_DB[i].modelo, CARROS_DB[i].marca, CARROS_DB[i].renavam, 
            CARROS_DB[i].cor, CARROS_DB[i].anoFabricacao, CARROS_DB[i].cpfProprietario);
    }

    fclose(fp);
}

int salvar_pessoas(void) {
    FILE *fp = fopen("./files/pessoas.csv", "w");

    if (!fp) {
        fprintf(stderr, "Error opening file /files/carros.csv\n");
        return EXIT_FAILURE;
    }

    fprintf(fp, "nome,cpf,dataNascimento\n");
    
    for(int i=0; i<idx_pessoas; i++) {
        fprintf(fp, "%s,%s,%s\n", PESSOAS_DB[i].nome, 
            PESSOAS_DB[i].cpf, PESSOAS_DB[i].dataNascimento);
    }

    fclose(fp);
}

/* Função número 1*/

int criar_registro() {

    // limpando lixo do buffer do stdin
    getchar();

    char cpf[12];
    int checkCpf = 0;

    printf("Nome: ");
    fgets(PESSOAS_DB[idx_pessoas].nome, 40, stdin);

    size_t len = strlen(PESSOAS_DB[idx_pessoas].nome);
    if(PESSOAS_DB[idx_pessoas].nome[len-1] == '\n') PESSOAS_DB[idx_pessoas].nome[len-1] = '\0';

    printf("CPF (apenas números): ");
    fgets(PESSOAS_DB[idx_pessoas].cpf, 12, stdin);

    len = strlen(PESSOAS_DB[idx_pessoas].cpf);

    if(len != 11) {
        printf("CPF inválido!\n");
        return 1;
    }

    if(pessoa_ja_cadastrada(PESSOAS_DB[idx_pessoas].cpf)) {
        printf("Falha ao cadastrar Pessoa!\n");
        return 1;
    }

    // \n que sobrou do cpf
    getchar();

    printf("Data de nascimento (DD/MM/AAAA): ");
    fgets(PESSOAS_DB[idx_pessoas].dataNascimento, 11, stdin);

    if(registrar_veiculos(PESSOAS_DB[idx_pessoas].cpf)) {
        return 1;
    }

    idx_pessoas++;

    sort_array();
    salvar_veiculos();
    salvar_pessoas();

    return 0;
}
/* Funções para listar dados */

void listar_carros() {
     printf("*** Lista de Carros ***\n");
    printf("modelo, marca, renavam, cor, anoFabricacao, cpfProprietario\n");
    for (int i = 0; i < idx_carros; i++) {
        printf("%s, %s, %s, %s, %s, %s\n", CARROS_DB[i].modelo, CARROS_DB[i].marca, CARROS_DB[i].renavam, CARROS_DB[i].cor, CARROS_DB[i].anoFabricacao, CARROS_DB[i].cpfProprietario);
    }
}

void listar_pessoas() {
    printf("*** Lista de Pessoas ***\n");
    printf("nome, cpf, dataNascimento\n");
    for (int i = 0; i < idx_pessoas; i++) {
        printf("%s, %s, %s\n", PESSOAS_DB[i].nome, PESSOAS_DB[i].cpf, PESSOAS_DB[i].dataNascimento);
    }
}

/* Função número 5 */

int cadastrar_carro_pessoa_cadastrada () {
    listar_pessoas();
    char cpf[12];
    printf("Digite o CPF do proprietário: ");

    scanf("%s", cpf);
    getchar();

    for (int i = 0; i < idx_pessoas; i++) {
       if(strcmp(PESSOAS_DB[i].cpf, cpf) == 0) {
            registrar_veiculo(cpf);
            return 0;
        }
    }
    printf("CPF não encontrado!!\n");
    return 1;
}

/* Função que registra o carro de fato */

int registrar_veiculo(char *cpf) {
    printf("Digite a marca do veículo: ");
    fgets(CARROS_DB[idx_carros].marca, 20, stdin);

    size_t len = strlen(CARROS_DB[idx_carros].marca);
    if(CARROS_DB[idx_carros].marca[len-1] == '\n') CARROS_DB[idx_carros].marca[len-1] = '\0';

    printf("Digite o modelo do veículo: ");
    fgets(CARROS_DB[idx_carros].modelo, 20, stdin);

    len = strlen(CARROS_DB[idx_carros].modelo);
    if(CARROS_DB[idx_carros].modelo[len-1] == '\n') CARROS_DB[idx_carros].modelo[len-1] = '\0';

    printf("Digite o número do renavam: ");
    fgets(CARROS_DB[idx_carros].renavam, 12, stdin);
    len = strlen(CARROS_DB[idx_carros].renavam);

    if(len != 11) {
        printf("Renavam inválido!\n");
        return 1;
    }

    if(carro_ja_cadastrado(CARROS_DB[idx_carros].renavam)) {
        printf("Falha ao cadastrar Veículo!\n");
        return 1;
    }
    getchar();
    printf("Digite o ano de fabricação: ");
    fgets(CARROS_DB[idx_carros].anoFabricacao, 5, stdin);
    getchar();

    printf("Digite a cor do veículo: ");
    fgets(CARROS_DB[idx_carros].cor, 30, stdin);
    
    len = strlen(CARROS_DB[idx_carros].cor);
    if(CARROS_DB[idx_carros].cor[len-1] == '\n') CARROS_DB[idx_carros].cor[len-1] = '\0';

    strcpy(CARROS_DB[idx_carros].cpfProprietario, cpf);

    idx_carros++;
    sort_array();
    salvar_veiculos();
    printf("\nRegistro feito com sucesso!\n");
    return 0;
}

/* Função para registrar veículo de novas pessoas cadastradas */

int registrar_veiculos(char *cpf) {
    printf("Digite o número de veículos a ser cadastrado\n");

    int qtd;
    scanf("%d", &qtd);
    getchar();

    while(qtd--) {
        int errors = registrar_veiculo(cpf);
        
        if(errors) {
            return 1;
        }
    }
    return 0;
}

/* Funções de verificação de dados já cadastrados */

int pessoa_ja_cadastrada(char *cpf) {
    for (int i = 0; i < idx_pessoas;  i++) {
        if(strcmp(PESSOAS_DB[i].cpf, cpf) == 0) {
            printf("CPF já cadastrado!!\n");
            return 1;
        }
    }
    return 0;
}

int carro_ja_cadastrado(char *renavam) {
    for (int i = 0; i < idx_carros; i++) {
        if (strcmp(CARROS_DB[i].renavam, renavam) == 0) {
            printf("Renavam já cadastrado!!\n");
            return 1;
        }
    }
    return 0;
}

/* Funções relacionadas à ordenação de CPF e RENAVAM*/

int comparador_pessoas(const void *a, const void *b) {
    return strcmp(((Pessoa*) a)->cpf, ((Pessoa*) b)->cpf);
}

int comparador_carros(const void *a, const void *b) {
    return strcmp(((Carro*) a)->renavam, ((Carro*) b)->renavam);
}

void sort_array(void) {
    qsort(PESSOAS_DB, idx_pessoas, sizeof(Pessoa), comparador_pessoas);
    qsort(CARROS_DB, idx_carros, sizeof(Carro), comparador_carros);

}