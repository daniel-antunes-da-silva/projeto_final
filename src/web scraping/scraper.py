import requests
from src.funcoes_extras import compactar_arquivos


def obter_arquivos(urls: list):
    nomes_arquivos = []

    for url in urls:
        try:
            resposta = requests.get(url)
            # Separando a url através das barras, e pegando a última parte, referente ao nome do arquivo + extensão.
            nome_arquivo = url.split('/')[-1]
            nomes_arquivos.append(nome_arquivo)
            with open(nome_arquivo, 'wb') as file:
                file.write(resposta.content)
        except Exception as e:
            print(f'Erro: {e}')
    return nomes_arquivos


if __name__ == '__main__':
    urls = ['https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de'
            '-procedimentos/Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf',
            'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de'
            '-procedimentos/Anexo_II_DUT_2021_RN_465.2021_RN628.2025_RN629.2025.pdf']

    arquivos = obter_arquivos(urls)
    compactar_arquivos(arquivos, 'PDFs compactados')
