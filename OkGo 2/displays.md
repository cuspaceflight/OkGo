#16x2:

    +----------------+
    |4.2V 6.4V  08/32|
    |ERR ERR ERR ERR |
    +----------------+
    +----------------+
    |4.2V 6.4V  08/32|
    |FIR OK  OK  ERR |
    +----------------+
    +----------------+
    |4.2V ?.?V  00/32|
    |    NO LINK     |
    +----------------+

#16x4:

    +----------------+
    |CBAT IBAT   RSSI|
    |4.2V 6.4V  08/32|
    |            CON |
    |FIR OK  OK  ERR |
    +----------------+
    +----------------+
    |CBAT IBAT   RSSI|
    |4.2V ?.?V  00/32|
    |    NO LINK     |
    |                |
    +----------------+

#20x2:

    +--------------------+
    |C4.2V I3.6V RSI08/32|
    |FIRE OK   OK   CERR |
    +--------------------+
    +--------------------+
    |C4.2V I?.?V RSI00/32|
    |      NO LINK       |
    +--------------------+

#20x4:

    +--------------------+
    |CBAT:4.2V  IBAT:6.4V|
    |    LINK: 08/32     |
    |CONT CONT CONT CONT |
    |ERR  ERR  ERR  ERR  |
    +--------------------+
    +--------------------+
    |CBAT:4.2V  IBAT:6.4V|
    |    LINK: 08/32     |
    |               CONT |
    |FIRE OK   OK   ERR  |
    +--------------------+
    +--------------------+
    |CBAT:4.2V  IBAT:?.?V|
    |    LINK: 00/32     |
    |      NO LINK       |
    |                    |
    +--------------------+

Possible metering display:

    +--------------------+
    |CBAT:4.2V  IBAT:6.4V|
    |    LINK: 08/32     |
    |FIRE OK   OK   ERR  |
    |9.4A 004R 125R 14kR |
    +--------------------+
