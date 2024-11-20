*** Settings ***
Resource    ${CURDIR}/../../resources/import.robot

*** Keywords ***
Input text
    [Arguments]    ${locator}    ${text}    ${timeout}=${30s_timeout}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    SeleniumLibrary.Input Text    ${locator}    ${text}

Go to web notebookspec
    Open chrome browser    ${url}
    SeleniumLibrary.Maximize Browser Window
    SeleniumLibrary.Wait Until Element Is Visible    ${main_locator['btn_search_notebook']}    timeout=${30s_timeout}

Open chrome browser
    [Documentation]         Open chrome browser with so many option to customize.
                    ...     \n ``browser_mode`` can be either desktop or mobile to open in mobile resolution
                    ...     \n ``headless`` to open browser in headful or headless mode
                    ...     \n ``extension_full_path`` if not empty will install chrome extention from given path 
                    ...     \n ``with_download_dir`` create chrome driver with download directory default at ${OUTPUT_DIR}/downloads_${current_time_epoch_format}
                    ...     \n ``with_proxy`` create chrome driver and start local proxy for capturing network 
                    ...     \n ``path_to_browsermob_proxy`` path to browsermob installation file
                    ...     \n ``with_save_pdf`` True if want to automatically save PDF from chorme preview printing screen
    [Arguments]             ${url}    
                    ...     ${browser_mode}=desktop
                    ...     ${headless}=${FALSE}
                    ...     ${extension_full_path}=${EMPTY}
                    ...     ${with_download_dir}=${TRUE}
                    ...     ${with_proxy}=${FALSE}
                    ...     ${path_to_browsermob_proxy}=${EMPTY}
                    ...     ${with_save_pdf}=${FALSE}
    ${chrome_options}=     Evaluate       sys.modules['selenium.webdriver'].ChromeOptions()     sys, selenium.webdriver
    Call Method     ${chrome_options}     add_argument     --disable-infobars
    Call Method     ${chrome_options}     add_argument     --window-size\=1920,1080
    Call Method     ${chrome_options}     add_argument     --disable-dev-shm-usage
    Call Method     ${chrome_options}     add_argument     --disable-gpu
    Call Method     ${chrome_options}     add_argument     --no-sandbox
    Call Method     ${chrome_options}     add_argument     --ignore-certificate-errors
    Call Method     ${chrome_options}     add_argument     --enable-unsafe-swiftshader
    IF  '${extension_full_path}' != '${EMPTY}'
        Call Method     ${chrome_options}      add_extension   ${extension_full_path}
    END
    IF  ${headless}
        Call Method     ${chrome_options}      add_argument    --headless
        Call Method     ${chrome_options}      add_argument    --window-size\=1920,1080
    END
    IF  ${with_download_dir}
        ${current_time}=            DateTime.Get Current Date    result_format=%Y%m%d%H%M%S
        ${download_directory}=      OperatingSystem.Join path    ${OUTPUT_DIR}    downloads_${current_time}
        OperatingSystem.Create directory            ${download_directory}
        Wait until keyword succeeds    5x    2s     OperatingSystem.Directory Should Exist  ${download_directory}
        ${prefs}=    BuiltIn.Create dictionary    download.default_directory=${download_directory}
        Log to console      file will be downloaded to ${download_directory}
        BuiltIn.Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    ELSE
        ${download_directory}=  BuiltIn.Set variable    ${EMPTY}
    END
    IF  ${with_proxy}
        ${random_proxy_port}=   Evaluate    random.sample(range(30000, 45000), 1)    random
        &{proxt_port}=          Create Dictionary   port=${random_proxy_port}[0]
        BrowserMobProxyLibrary.Start Local Server      ${path_to_browsermob_proxy}
        BrowserMobProxyLibrary.Create Proxy    ${proxt_port}
        Call Method    ${chrome_options}    add_argument      --proxy-server\=127.0.0.1:${random_proxy_port}[0]
        Call Method    ${chrome_options}    add_argument      ignore-certificate-errors
    END
    IF  ${with_save_pdf}
        ${current_time}    DateTime.Get Current Date    result_format=%Y%m%d%H%M%S
        ${download_directory}=      OperatingSystem.Join path    ${OUTPUT_DIR}    downloads_${current_time}
        OperatingSystem.Create directory            ${download_directory}
        Wait until keyword succeeds    5x    2s     OperatingSystem.Directory Should Exist  ${download_directory}
        ${json}=        JSONLibrary.Convert String to JSON    { "appState": { "recentDestinations": [{"id": "Save as PDF","origin": "local","account":""}],"selectedDestinationId": "Save as PDF","version": ${2}}}
        ${prefs}=       Create Dictionary    
                        ...     savefile.default_directory=${download_directory}
                        ...     download.default_directory=${download_directory}
                        ...     download.prompt_for_download=${FALSE}
                        ...     directory_upgrade=${TRUE}   
                        ...     plugins.plugins_disabled=Chrome PDF Viewer
                        ...     printing.print_preview_sticky_settings=${json}
                        ...     plugins.always_open_pdf_externally=${TRUE}
                        ...     download.extensions_to_open=applications/pdf
        Call Method     ${chrome_options}     add_argument     --kiosk-printing
        Call Method     ${chrome_options}     add_argument     --disable-print-preview
        Call Method     ${chrome_options}     add_experimental_option    prefs    ${prefs}
    END
    IF  '${browser_mode}' == 'mobile'
        ${mobile_emulation}=    Create Dictionary    deviceName=iPhone X
        Call Method    ${chrome_options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    END
    SeleniumLibrary.Create WebDriver    Chrome      chrome_options=${chrome_options}
    SeleniumLibrary.Go To     ${url}
    IF  '${browser_mode}' == 'desktop'
        SeleniumLibrary.Maximize Browser Window
    END