*** Settings ***
#Library
Library        SeleniumLibrary
Library        ExcelLibrary
Library        DatabaseLibrary
Library        OperatingSystem
Library        Collections
Library        DateTime
Library        String
Library        JSONLibrary
Library        RequestsLibrary

#common
Resource    ${CURDIR}/../keywords/common/common_web.robot

#setting
Variables    ${CURDIR}/settings/settings.yaml

#test_data
Variables    ${CURDIR}/testdata/test_data.yaml

#translation
Variables    ${CURDIR}/translation/th.yaml

#features
Resource    ${CURDIR}/../keywords/ui/features/main_feature.robot
Resource    ${CURDIR}/../keywords/ui/features/notebook_search_feature.robot

#locator
Resource    ${CURDIR}/../keywords/ui/locator/common_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/main_locator.robot
Resource    ${CURDIR}/../keywords/ui/locator/notebook_search_locator.robot


#pages
Resource    ${CURDIR}/../keywords/ui/pages/main_page.robot
Resource    ${CURDIR}/../keywords/ui/pages/notebook_search_page.robot

#excel
Resource    ${CURDIR}/../keywords/excel/excel_test.robot

#api
# Resource    ${CURDIR}/../keywords/api/get_request.robot
# Resource    ${CURDIR}/../keywords/api/post_request.robot
# Resource    ${CURDIR}/../keywords/api/put_request.robot
# Resource    ${CURDIR}/../keywords/api/delet_request.robot



