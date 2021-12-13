.model small
.stack 100h 
.data 
;***************************Passswoed Property********************************************
enter_ps                db 10,13,"Enter Your Pin :$" 
incorrect_ps            db 10,13,"Incorrect Pin  :$" 
password                db       "root$" 
password_length         dw 4

;***************************Option Property***********************************************
welcome                 db 10,13,"                   Welcome : $"
ac_balance              db 10,13,10,13, "1. View my Balance $" 
withdraw_m              db 10,13,       "2. Withdraw Cash $" 
transcation_m           db 10,13,       "3. Transfer Funds $" 
exit_1                  db 10,13,       "4. Exit $"
back_1                  db 10,13,       "1. Back$" 
ext                     db 10,13,       "2. Exit$"

;***************************Message Property***********************************************
 
thanks_msg              db 10,13,10,13,"                   Thanks for Choosing Us. $"
invalid_data            db 10,13,      "Incorrect Input$"
new_user                db 10,13,      "$"
total_balance           db 10,13,      "Your Total Balance is: 25,000 PKR $" 
availablebal            db 10,13,      "Your Available Balance is: 24,900 PKR $"  

;***************************Options for Direct Money WithDrawing ***************************

fivehun                 db 10,13,"1. 500 PKR$" 
one                     db 10,13,"2. 1,000 PKR$"
three                   db 10,13,"3. 3,000 PKR$"
five                    db 10,13,"4. 5,000 PKR$"
ten                     db 10,13,"5. 10,000 PKR$"
fiften                  db 10,13,"6. 15,000 PKR$"
tweenty                 db 10,13,"7. 20,000 PKR$"

;***************************Account Balance Details*****************************************
total_1                 db 10,13,"Your Total Balance is: 24,500 PKR $" 
available_1             db 10,13,"Your Available Balance is: 24,400 PKR $"

total_2                 db 10,13,"Your Total Balance is: 24,000 PKR $" 
available_2             db 10,13,"Your Available Balance is: 23,900 PKR $"

total_3                 db 10,13,"Your Total Balance is: 22,000 PKR $" 
available_3             db 10,13,"Your Available Balance is: 21,900 PKR $"

total_4                 db 10,13,"Your Total Balance is: 20,000 PKR $" 
available_4             db 10,13,"Your Available Balance is: 19,900 PKR $"

total_5                 db 10,13,"Your Total Balance is: 15,000 PKR $" 
available_5             db 10,13,"Your Available Balance is: 14,900 PKR $"

total_6                 db 10,13,"Your Total Balance is: 10,000 PKR $" 
available_6             db 10,13,"Your Available Balance is: 9,900 PKR $"

total_7                 db 10,13,"Your Total Balance is: 5,000 PKR $" 
available_7             db 10,13,"Your Available Balance is: 4,900 PKR $" 


;***************************Account Funds Details***************************
withdraw_amount         db 10,13,"Enter Your Withdraw Amount$" 
transfer_amount         db 10,13,"Enter Your Transaction Amount$"  
complete                db 10,13,"Your Transaction is Successfull...$" 
acc_number              db 10,13,"Enter Account Number: $"

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    
    ;***************************Password Verification***********************
    mov cx,password_length
    mov bx,offset password
    
    mov ah,9
    lea dx,enter_ps
    int 21h
    
    pw_verification:
    mov ah,8
    int 21h
    
    cmp al,[bx] 
    jne wrong_da
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop pw_verification
    mov ah,0x00
    mov al,0x03
    int 0x10
    jmp main_process
    
    
    ;***************************If Password is Incorrect********************
    wrong_da:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,incorrect_ps
        int 21h
        mov ah,4ch
        int 21h
    
    
    
    ;***************************Options that appeared on Dashboard**********
    main_process:
    mov ah,9
    lea dx,welcome
    int 21h 
    mov ah,9
    lea dx,ac_balance
    int 21h
    mov ah,9
    lea dx,withdraw_m
    int 21h
    mov ah,9
    lea dx,transcation_m
    int 21h 
    mov ah,9
    lea dx,exit_1
    int 21h 
    mov ah,9
    lea dx,new_user
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    
    
    ;***************************Checking Input********************
    check_input:
        cmp bl,49 
        je blance
        cmp bl,50 
        je withdraw
        cmp bl,51 
        je Transfer
        cmp bl,52 
        je exit
        jmp err
    
    
    ;***************************Checking Account Balance***********
    blance:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,total_balance
        int 21h 
        mov ah,9
        lea dx,availablebal
        int 21h
        jmp option
    
     
     
    
     
     
    ;***************************Money Withdraw*********************
    withdraw:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,withdraw_amount
        int 21h  
    
    ;***************************Options for Funds Withdrawing******
    mov ah,9
    lea dx,fivehun
    int 21h
    
    mov ah,9
    lea dx,one
    int 21h 
    
    mov ah,9
    lea dx,three
    int 21h
    
    mov ah,9
    lea dx,five
    int 21h
    
    mov ah,9
    lea dx,ten
    int 21h
    
    mov ah,9
    lea dx,fiften
    int 21h
    
    mov ah,9
    lea dx,tweenty
    int 21h
    
    mov ah,9
    lea dx,new_user
    int 21h
    mov ah,1
    int 21h
    mov bl,al 
    
    ;***************************Checking Input***********
    cmp bl,49 
    je pross_1 
    
    cmp bl,50 
    je pross_2
    
    cmp bl,51 
    je pross_3
    
    cmp bl,52
    je pross_4  
    
    cmp bl,53
    je pross_5
    
    cmp bl,54
    je pross_6
    
    cmp bl,55
    je pross_7
    jmp err
    
    
    ;***************************Option 1*****************
    pross_1:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h
    
        mov ah,9
        lea dx,total_1
        int 21h 
        mov ah,9
        lea dx,available_1
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    ;***************************Option 2*****************
    pross_2:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h 
    
        mov ah,9
        lea dx,total_2
        int 21h 
        mov ah,9
        lea dx,available_2
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    ;***************************Option 3*****************
    pross_3:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h 
    
        mov ah,9
        lea dx,total_3
        int 21h 
        mov ah,9
        lea dx,available_3
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    ;***************************Option 4*****************
    pross_4:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h 
    
        mov ah,9
        lea dx,total_4
        int 21h 
        mov ah,9
        lea dx,available_4
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    ;***************************Option 5*****************
    pross_5:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h 
    
        mov ah,9
        lea dx,total_5
        int 21h 
        mov ah,9
        lea dx,available_5
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    ;***************************Option 6*****************
    pross_6:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h  
    
        mov ah,9
        lea dx,total_6
        int 21h 
        mov ah,9
        lea dx,available_6
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option 
    
    ;***************************Option 7*****************
    pross_7:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,complete
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h
    
        mov ah,9
        lea dx,total_7
        int 21h 
        mov ah,9
        lea dx,available_7
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h
        jmp option
    
    
    ;***************************Funds Transfer*****************
    Transfer:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,acc_number
        int 21h
    
        mov ah,1
        account:  
        int 21h 
        cmp al,13
        jne account   
    
        mov ah,9
        lea dx,new_user
        int 21h 
    
    
    ;***************************Again Password  is Verified*****
    mov ah,9
    lea dx,enter_ps
    int 21h   
    
    mov cx,password_length
    mov bx,offset password
    
    again:
    mov ah,8
    int 21h
    
    cmp al,[bx] 
    jne wrong_da
    mov ah,2
    mov dl,42
    int 21h
    inc bx
    loop again
    mov ah,0x00
    mov al,0x03
    int 0x10 
    jmp transferpross
    
    
    ;***************************Funds Transfer Process*****************
    transferpross:
        mov ah,9
        lea dx,transfer_amount
        int 21h
      
    ;***************************Transcation Completion Message*********
    mov ah,9
    lea dx,fivehun
    int 21h
    
    mov ah,9
    lea dx,one
    int 21h 
    
    mov ah,9
    lea dx,three
    int 21h
    
    mov ah,9
    lea dx,five
    int 21h
    
    mov ah,9
    lea dx,ten
    int 21h
    
    mov ah,9
    lea dx,fiften
    int 21h
    
    mov ah,9
    lea dx,tweenty
    int 21h
    
    mov ah,9
    lea dx,new_user
    int 21h
    mov ah,1
    int 21h
    mov bl,al 
    
    ;***************************Checking Input that is inserted by Customer************
    cmp bl,49 
    je pross_1 
    
    cmp bl,50 
    je pross_2
    
    cmp bl,51 
    je pross_3
    
    cmp bl,52
    je pross_4  
    
    cmp bl,53
    je pross_5
    
    cmp bl,54
    je pross_6
    
    cmp bl,55
    je pross_7
    jmp err
     
    
    ;***************************Options for Exit or Back to Main Menu*****************
    option: 
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,9
        lea dx,back_1
        int 21h
        mov ah,9
        lea dx,ext
        int 21h
        mov ah,9
        lea dx,new_user
        int 21h
        mov ah,1
        int 21h
        cmp al,49
        je back
        cmp al,50
        je exit
        jmp err
    
      
    
    ;***************************Back Option Working*****************
    back:
        mov ah,0x00
        mov al,0x03
        int 0x10
        call main_process
    
    
    ;***************************If input is incorrect show error****
    err:
        mov ah,0x00
        mov al,0x03
        int 0x10 
        mov ah,9
        lea dx,invalid_data
        int 21h 
        mov ah,9
        lea dx,new_user
        int 21h  
        call main_process
  
    
    ;***************************Option for Exiting from DOS*****************
    exit:
        mov ah,0x00
        mov al,0x03
        int 0x10
        mov ah,9
        lea dx,thanks_msg
        int 21h 
        mov ah,4ch
        int 21h
    main endp
end main 

