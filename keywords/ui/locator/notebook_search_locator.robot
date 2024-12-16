*** Variables ***
&{notebook_search_locator}
...    logo_web= xpath=//img[@src="/images/logo_height50.png"]
...    menu_level_1=//ul[@class="desktop-menu"]/li
        #element notebook
...    count_notebook=//div[@class="search-item-box search-notebook"]/ul[@class="search-item-list"]/li
...    name_notebook=//ul[@class="search-item-list"]/li[1]/div[@class="item-detail"]/div[@class="item-info"]/a
        #กล่อง search input
...    input_search_notebook=//div[@class="search-input-box"]/input
        #จำนวน notebook ที่หาเจอ
...    result_total=//div[@class="result-total"]
        #จำนวนหน้าของคอม ที่หาได้
...    page_total=//ul[@class="pagination"]/li
        #กล่องเลือกลายละเอียดรุ่นของคอม
...    select_sort_notebook=//button[@id="display-option"]
...    select_note=//div[@class="display-dropdown dropdown-menu dropdown-menu-right show"]/a[1]
...    select_price=//div[@class="display-dropdown dropdown-menu dropdown-menu-right show"]/a[9]
        #กล่องป่าวด้านล่าง
...    target_click_page=//div[@class="pl-3 pr-3 pb-4 pt-4 mb-2 bg-white d-none d-lg-block"]
        #ตำแหน่งชื่อของ note book แต่ละรุ่น
...    get_name_notebook=//ul[@class="search-item-list"]/li
...    tail_name=/div[@class="item-detail"]/div[@class="item-info"]/a
...    tail_data=/div[@class="item-detail"]/div/ul[@class="info-list"]/li
...    get_data_notebook=//ul[@class="search-item-list"]/li[1]/div[@class="item-detail"]/div/ul[@class="info-list"]/li
...    on_data_notebook=//div[@class="item-info"]
...    click_button=//button[@class="ats-overlay-bottom-close-button"]
