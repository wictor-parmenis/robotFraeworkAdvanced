import rpa as r
import pyautogui as auto
from time import sleep
from datetime import datetime


def today_dollar():
    r.init()
    r.url('https://www.melhorcambio.com/dolar-hoje')
    sleep(4)
    dolar = r.read('//*[@id="comercial"]')
    sleep(2)
    print(f'{dolar} | {datetime.today()}')
    r.close()
    return dolar


def dollar_cannadian():
    r.init()
    r.url('https://www.melhorcambio.com/dolar-hoje')
    sleep(4)
    r.click('//*[@id="dock"]/ul/li[2]/a')
    sleep(4)
    dolar_c = r.read('//*[@id="comercial"]')
    sleep(2)
    print(f'{dolar_c} | {datetime.today()}')
    r.close()
    return dolar_c


