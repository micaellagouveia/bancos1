#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Carro
{
    char modelo[20];
    char marca[20];
    long int renavam;
    char cor[10];
    char anoFabricacao[4];
    int idPessoa;
} Carro;

typedef struct Pessoa
{
    char nome[40];
    long int cpf;
    char dataNascimento[9];
} Pessoa;

Carro CARROS_DB[1000];
int idx_carros = 0;

Pessoa PESSOAS_DB[1000];
int idx_pessoas = 0;

FILE *arquivo_carros = NULL;
FILE *arquivo_pessoas = NULL;

void abrir_arq_carros(FILE **arq)
{
    *arq = fopen("carros.txt", "a");
    if (*arq == NULL)
    {
        printf("Problemas na abertura do arquivo\n");
        return;
    }
}

void abrir_arq_pessoas(FILE **arq)
{
    *arq = fopen("pessoas.txt", "a");
    if (*arq == NULL)
    {
        printf("Problemas na abertura do arquivo\n");
        return;
    }
}

void menu()
{
    printf("***** Menu Sistema Carro-Pessoa *****\n\n");
    printf("Digite o número da ação desejada\n\n");

    printf("1 - Cadastro de Pessoa\n");
    printf("2 - Listar Pessoas Cadastradas\n\n");

    printf("3 - Cadastro de Veículo\n");
    printf("4 - Listar Veículos Cadastrados\n\n");

    printf("5 - Sair\n");
}

void flushstdin()
{
    int c;
    while ((c = getchar()) != '\n' && c != EOF)
        ;
}

int verifica_renavam(long int renavam)
{
    for (int i = 0; i < 1000; i++)
    {
        if (CARROS_DB[i].renavam == renavam)
        {
            printf("Renavam já cadastrado!!\n");
            return 1;
        }
    }
    return 0;
}

int verifica_cpf(long int cpf)
{
    for (int i = 0; i < 1000; i++)
    {
        if (PESSOAS_DB[i].cpf == cpf)
        {
            printf("CPF já cadastrado!!\n");
            return 1;
        }
    }
    return 0;
}

void cadastrar_pessoa()
{
    long int cpf;
    int checkCpf = 0;
    printf("Nome: ");
    scanf(" %[^\n]", PESSOAS_DB[idx_pessoas].nome);
    flushstdin();

    printf("CPF (apenas números): ");
    scanf("%ld", &cpf);
    flushstdin();

    if (idx_pessoas > 0)
    {
        checkCpf = verifica_cpf(cpf);
    }

    if (checkCpf == 1)
    {
        printf("Falha ao cadastrar Pessoa!\n");
    }
    else
    {
        PESSOAS_DB[idx_pessoas].cpf = cpf;

        printf("Data de nascimento (DD/MM/AAAA): ");
        scanf("%s", PESSOAS_DB[idx_pessoas].dataNascimento);
        flushstdin();

        fprintf(arquivo_pessoas, "******************************\n");
        fprintf(arquivo_pessoas, "ID=%d, NOME=%s, CPF=%ld, DT_NASC=%s\n", idx_pessoas, PESSOAS_DB[idx_pessoas].nome, PESSOAS_DB[idx_pessoas].cpf, PESSOAS_DB[idx_pessoas].dataNascimento);

        idx_pessoas++;

        printf("\nPessoa Cadastrada com Sucesso!\n");
    }
}

void listar_pessoas()
{
    printf("Pessoas Cadastradas\n");

    if (idx_pessoas == 0)
        printf("Não há pessoas cadastradas.\n");

    for (int i = 0; i < idx_pessoas; i++)
    {
        printf("ID=%d, NOME=%s, CPF=%ld, DT_NASC=%s\n", i, PESSOAS_DB[i].nome, PESSOAS_DB[i].cpf, PESSOAS_DB[i].dataNascimento);
    }
}

void cadastrar_carro()
{
    char resposta = 0;
    int prop_id;
    int check = 0;
    long int renavam;
    while (resposta == 0)
    {

        int res;
        printf("Digite o identificador do Proprietário: ");
        scanf("%d", &prop_id);

        printf("ID=%d, NOME=%s, CPF=%ld, DT_NASC=%s\n", prop_id, PESSOAS_DB[prop_id].nome, PESSOAS_DB[prop_id].cpf, PESSOAS_DB[prop_id].dataNascimento);
        printf("A pessoa desejada é essa? [1/0]:\n");

        scanf("%d", &res);
        resposta = res;
    }

    printf("Renavam (apenas números): ");
    scanf(" %ld", &renavam);
    if (idx_carros > 0)
    {
        check = verifica_renavam(renavam);
    }

    if (check == 1)
    {
        printf("Falha ao cadastrar carro.\n");
    }
    else
    {
        CARROS_DB[idx_carros].renavam = renavam;

        printf("Modelo: ");
        scanf(" %s", CARROS_DB[idx_carros].modelo);

        printf("Marca: ");
        scanf(" %s", CARROS_DB[idx_carros].marca);

        printf("Cor: ");
        scanf(" %s", CARROS_DB[idx_carros].cor);

        printf("Ano de Fabricação (AAAA): ");
        scanf(" %s: ", CARROS_DB[idx_carros].anoFabricacao);

        fprintf(arquivo_carros, "******************************\n");
        fprintf(arquivo_carros, "ID=%d, RENAVAM=%ld, MODELO=%s, MARCA=%s, COR=%s, ANO_FAB=%s, ID_PESSOA=%d\n", idx_carros, CARROS_DB[idx_carros].renavam, CARROS_DB[idx_carros].modelo, CARROS_DB[idx_carros].marca, CARROS_DB[idx_carros].cor, CARROS_DB[idx_carros].anoFabricacao, CARROS_DB[idx_carros].idPessoa);

        idx_carros++;

        printf("\nCarro Cadastrado com Sucesso!\n");
    }
}

void listar_carros()
{
    printf("Carros Cadastrados\n");

    if (idx_carros == 0)
        printf("Não há carros cadastrados.\n");

    for (int i = 0; i < idx_carros; i++)
    {
        printf("ID=%d, RENAVAM=%ld, MODELO=%s, MARCA=%s, COR=%s, ANO_FAB=%s, ID_PESSOA=%d\n", i, CARROS_DB[i].renavam, CARROS_DB[i].modelo, CARROS_DB[i].marca, CARROS_DB[i].cor, CARROS_DB[i].anoFabricacao, CARROS_DB[i].idPessoa);
    }
}

int main(void)
{
    int num;

    abrir_arq_pessoas(&arquivo_pessoas);
    abrir_arq_carros(&arquivo_carros);

    do
    {
        menu();
        scanf("%d", &num);

        if (num < 0 || num > 5)
            printf("Opção Inválida, tente os números entre 1 e 5.\n");

        for (int i = 0; i < 15; i++)
            printf("*");
        printf("\n");

        if (num == 1)
            cadastrar_pessoa();
        else if (num == 2)
            listar_pessoas();
        else if (num == 3)
            cadastrar_carro();
        else if (num == 4)
            listar_carros();

        for (int i = 0; i < 15; i++)
            printf("*");

        for (int i = 0; i < 3; i++)
            printf("\n");

    } while (num != 5);

    printf("Dados salvos no arquivo com sucesso!\n");
    fclose(arquivo_pessoas);
    fclose(arquivo_carros);
    return 0;
}