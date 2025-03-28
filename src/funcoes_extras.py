import os
import shutil


def compactar_arquivos(arquivos: list, pasta_para_arquivos: str, nome_zip: str):
    try:
        os.mkdir(pasta_para_arquivos)
    except FileExistsError:
        pass
    for arquivo in arquivos:
        shutil.move(arquivo, pasta_para_arquivos)
    shutil.make_archive(nome_zip, 'zip', pasta_para_arquivos)
