INGV_Telegram_update
====================
Bash script to get notifications from earthquake activity data published on the INGV website http://cnt.rm.ingv.it
#packages that are needed
[telegram-cli](https://github.com/vysheng/tg)
links2
##terremoti.sh
navigates to the INGV website and extracts today and yesterday earthquake data. Which is stored and sent with telegram-cli as a message to a contact. This last event is performed through tg.sh.
##tg.sh
Writes a message to a contact on telegram. The first argument is the contact name while the second one is the message body.
