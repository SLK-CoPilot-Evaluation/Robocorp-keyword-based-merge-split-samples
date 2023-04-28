*** Settings ***
Documentation       Template robot main suite.

# importing RPA.PDF library
Library             RPA.PDF


*** Variables ***
#    Declaring TESTDATADIR variable that points to the folder location where multiple pdf files resides.
${TESTDATA_DIR} =       D:\\OneDrive - SLK Software Services Pvt Ltd\\Desktop\\PDF files\\


*** Tasks ***
Tasks
# calling the keywords
    Merge pdfs
    Split pdfs


*** Keywords ***
Merge pdfs
    # creating a list variable called files and passing the pdf files that needs to be merged
    ${files}=    Create List
    ...    ${TESTDATA_DIR}${/}inputfile1.pdf:
    ...    ${TESTDATA_DIR}${/}inputfile2.pdf:

    # calling 'Add Files To Pdf' keyword,passing the input/output parameters and storing the merged pdf in 'mergeresult.pdf'.
    Add Files To Pdf    ${files}    ${TESTDATA_DIR}${/}mergeresult.pdf

Split pdfs
    # creating a list variable called files and passing the input pdf file that needs to be splited along with page number/page range.
    ${files}=    Create List
    ...    ${TESTDATA_DIR}${/}inputfile1.pdf:1,2-3

    # calling "Add Files To Pdf" keyword,passing the input/output parameters and storing the result in 'splitresult.pdf'.
    Add Files To Pdf    ${files}    ${TESTDATA_DIR}${/}splitresult.pdf
