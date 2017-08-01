REPORT ZMM_READ_TABLE.

DATA: BEGIN OF ls_line,
  col1 TYPE i,
  col2 TYPE i,
END OF ls_line.
DATA lt_tab LIKE HASHED TABLE OF ls_line WITH UNIQUE KEY col1.

WRITE: / 'DATA in TABLE:'.
WRITE: / 'lt_tab-col1',  20 'lt_tab-col2'.
DO 4 TIMES.
  ls_line-col1 = sy-index.
  ls_line-col2 = sy-index ** 2.
INSERT ls_line INTO TABLE lt_tab.
WRITE: / ls_line-col1, 20 ls_line-col2.
ENDDO.
SKIP.

WRITE: / 'DATA to be FOUND in structure:'.
ls_line-col1 = 2. ls_line-col2 = 3.
WRITE: / 'ls_line-col1',  20 'ls_line-col2'.
WRITE: / ls_line-col1, 20 ls_line-col2.

SKIP.
WRITE: / 'READ TABLE lt_tab FROM ls_line INTO ls_line. ==>'.
READ TABLE lt_tab FROM ls_line INTO ls_line.
WRITE: 'SY-SUBRC =', sy-subrc.
WRITE: / 'row found:', sy-tabix, ls_line-col1, ls_line-col2.

SKIP.
ls_line-col1 = 2. ls_line-col2 = 3.
WRITE: / 'READ TABLE lt_tab FROM ls_line INTO ls_line COMPARING col2. ==>'.
READ TABLE lt_tab FROM ls_line INTO ls_line COMPARING col2.
WRITE: 'SY-SUBRC =', sy-subrc.
WRITE: / 'row found:', sy-tabix, ls_line-col1, ls_line-col2.

SKIP.
ls_line-col1 = 2. ls_line-col2 = 3.
WRITE: / 'READ TABLE lt_tab FROM ls_line INTO ls_line COMPARING col1. ==>'.
READ TABLE lt_tab FROM ls_line INTO ls_line COMPARING col1.
WRITE: 'SY-SUBRC =', sy-subrc.
WRITE: / 'row found:', sy-tabix, ls_line-col1, ls_line-col2.
