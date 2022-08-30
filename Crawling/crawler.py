from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities
from selenium.webdriver.support.ui import WebDriverWait as wait
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from scrapy.selector import Selector
from tqdm import tqdm
import time
import pickle

if __name__=='__main__':
    chrome_option = Options()
    chrome_option.headless = True
    capability = DesiredCapabilities.CHROME
    capability["pageLoadStrategy"] = "none"

    driver = webdriver.Chrome("chromedriver.exe", options=chrome_option)
    driver.get("http://kpat.kipris.or.kr/kpat/searchLogina.do?next=MainSearch#page1")
    time.sleep(1)
    query = driver.find_element(By.ID, value="queryText")
    IPCS = ["IPC=[A]", "IPC=[B]", "IPC=[C]", "IPC=[D]", "IPC=[E]", "IPC=[F]", "IPC=[G]", "IPC=[H]"]
    dataset = []
    for IPC in IPCS:
        query.clear()
        query.send_keys(IPC)
        print(IPC)
        DoQuery = """//*[@id="SearchPara"]/fieldset/span[1]/a"""
        wait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, DoQuery))).click()
        time.sleep(2)

        ids = []
        titles = []
        abstracts = []
        for i in tqdm(range(1, 801)):
            if i<=10:
                index = i
            else: index = (i-1)%10 + 2
            wait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, """//*[@id="divMainArticle"]/form/section/div[2]/span/a[""" + str(index) + "]"))).click()
            selector = Selector(text=driver.page_source)
            ids.extend(selector.css("#mainsearch_info_list > div.mainlist_topinfo > li:nth-child(3) > span.point01 > a").getall())
            titles.extend(selector.css("div.search_section_title > h1 > a:nth-child(2)").getall())
            abstracts.extend(selector.xpath("""//*[@id="mainsearch_info_list"]/div[2]/text()[2]""").getall())
            time.sleep(1)
        dataset.append((ids, titles, abstracts))
    driver.close()

    with open("raw_datset", 'wb') as f:
        pickle.dump(dataset)

