import pdfplumber
import pandas as pd
from src.funcoes_extras import compactar_arquivos

def extrair_dados(caminho_pdf: str, pagina_inicial: int):
    dados_tabela = []
    with pdfplumber.open(caminho_pdf) as arquivo_pdf:
        for indice, pagina in enumerate(arquivo_pdf.pages[pagina_inicial - 1:]):
            print(f'Extraindo dados da página: {pagina_inicial + indice}')
            tabela = pagina.extract_table()
            if indice == 0:
                # Pega os títulos da  PRIMEIRA tabela de Rol de procedimentos
                titulos = tabela[0]
                # Modificando os títulos de OD e AMB de acordo com a legenda, transformando
                # em maiúsculo para manter a consistência.
                titulos[3] = 'Seg. Odontológica'.upper()
                titulos[4] = 'Seg. Ambulatorial'.upper()

            # Extrai dados das páginas subsequentes e ignora os cabeçalhos repetidos.
            if tabela:
                for linha in tabela[1:]:
                    # Modifica os dados (quando houver) de acordo com a legenda do arquivo.
                    if linha[3] == 'OD':
                        linha[3] = 'Seg. Odontológica'
                    if linha[4] == 'AMB':
                        linha[4] = 'Seg. Ambulatorial'
                    dados_tabela.append(linha)
                print(tabela)

    return dados_tabela, titulos


def converter_para_csv(dados: list, titulos: list, nome_saida: str):
    df = pd.DataFrame(dados, columns=titulos)
    df.to_csv(nome_saida, index=False, encoding='utf-8')
    print(f'Arquivo "{nome_saida}" salvo.')
    return nome_saida


if __name__ == '__main__':
    pdf = r'..\web scraping\Arquivos PDF\Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf'
    dados, titulos = extrair_dados(pdf, pagina_inicial=3)
    arquivo_csv = converter_para_csv(dados, titulos, 'Anexo_I.csv')
    # Transformando em uma lista para o correto uso da função de compactar arquivo.
    arquivo_csv = [arquivo_csv]
    print(arquivo_csv)
    compactar_arquivos(arquivo_csv, 'Arquivo CSV', 'CSV compactado')


