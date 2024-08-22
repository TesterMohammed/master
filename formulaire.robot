*** Settings ***
Library     SeleniumLibrary
Library     Collections
*** Variables ***
${url}      https://automationexercise.com/contact_us
${browser}   Chrome
${name}      mohamed
${email}     jjjjj@ggg.com
${sujet}     go to 
${message}   il faut faire tous les taches
*** Test Cases ***
Remplir un formulaire
  [Documentation]   verifier si le formulaire a bien envoyé ou non 
  Open Browser    ${url}     ${browser}
  Maximize Browser Window
  Wait Until Element Is Visible    css=[name='name']
  Input Text    css=[name='name']    ${name}
  Input Text    css=[type='email']    ${email}
  Input Text    css=[data-qa='subject']    ${sujet}
  Input Text    css=[name='message']    ${message}
  Click Button    css=[type='submit']
  Sleep    2
  ${Alert_message}=   Handle Alert   
  log   ${Alert_message}
  Page Should Contain    Success! Your details have been submitted successfully.
  [Teardown]  Close Browser