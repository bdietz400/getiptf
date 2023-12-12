cmd prompt('Get PTFs from IBM Fix Central')                            
/* CRTCMD CMD(YOURLIB/getfrmfix) PGM(YOURLIB/getfrmfixc) */
/*  SRCSTMF('/ptfs/getfrmfix.cmd') OPTION(*EVENTF)    */
/*  text('Get PTFs from IBM Fix Central (GETFRMFIX)') */                                                             

PARM       KWD(USER) TYPE(*CHAR) LEN(12) MIN(1) +       
             CASE(*MIXED) CHOICE('(mixed case)') +      
             PROMPT('User ID') 

PARM       KWD(PASSWORD) TYPE(*CHAR) LEN(25) MIN(1) +   
             CASE(*MIXED) DSPINPUT(*YES) +              
             CHOICE('(mixed case)') INLPMTLEN(17) +     
             PROMPT('Password')                         

PARM       KWD(SERVER) TYPE(*CHAR) LEN(50) +            
             DFT('delivery01-bld.dhe.ibm.com') +        
             CASE(*MIXED) INLPMTLEN(17) +
             PROMPT('Remote Server') 

PARM       KWD(RMT_DIR) TYPE(*CHAR) LEN(50) +           
             CASE(*MIXED) CHOICE('(mixed case)') +      
             INLPMTLEN(12) PROMPT('Remote Directory')   

PARM       KWD(LCL_DIR) TYPE(*CHAR) LEN(128) +   
             CASE(*MIXED) CHOICE('(mixed case)') +      
             INLPMTLEN(25) PROMPT('Local Directory')    

PARM       KWD(SH_LOC) TYPE(*CHAR) LEN(128) DFT('/ptfs') + 
             CASE(*MIXED) CHOICE('(mixed case)') +        
             INLPMTLEN(12) PROMPT('Shell Script Location')

PARM       KWD(SH_NAME) TYPE(*CHAR) LEN(50) +
             DFT('get_from_FIX_Central.sh') + 
             CASE(*MIXED) CHOICE('(mixed case)') +        
             INLPMTLEN(12) PROMPT('Shell Script Name')             
