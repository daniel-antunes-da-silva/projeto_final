import os
from zipfile import ZipFile


def compactar_arquivos(arquivos: list, nome_zip: str):
    try:
        with ZipFile(f"{nome_zip}.zip", "w") as arquivo_zip:
            for arquivo in arquivos:
                arquivo_zip.write(arquivo, os.path.basename(arquivo))
        return True
    except FileNotFoundError:
        print('Arquivo base não encontrado.')
        return None
    except Exception as e:
        print(f'Erro ao compactar arquivos: {e}')
        return None
