#ifndef SPLASH_H
#define SPLASH_H

/* Display an appropriate splash screen depending on state */
void splash(void);

/* Display the normal CUSF OkGo2 splash screen */
void splash_normal(void);

/* Display the WDT reset splash */
void splash_wdt(void);

/* Hang in the turned-on-while-armed splash */
void splash_armed(void);

#endif