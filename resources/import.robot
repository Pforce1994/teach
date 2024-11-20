*** Settings ***
#Library
Library        SeleniumLibrary
# Library        ExcelLibrary
# Library        DatabaseLibrary
Library        OperatingSystem
Library        Collections
Library        DateTime
Library        String
# Library        JSONLibrary
# Library        DebugLibrary
Library        RequestsLibrary
# Library        REST

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