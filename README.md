# mautic-campaign-reset
A method to allow a contact to re-enter a campaign
-----------------------------------------------

OK folks this is potentally really dangerous to use. I'm using this against 2.8.2 and appears to still be working after a few days. Use at your own risk, and test on version change!


Setup - Mautic
--------------

1. Create a custom field say 'reset_orders', make it a boolean so that the
GUI makes it look nice for the users.

2. Create your campaigns as normal.

3. When you want to reset the campaign for a particular contact create an action to update the custom field above and set to 'Yes'.


Setup - Server Side
-------------------

1. Put the attached script into crontab somewhere.

2. Amend the script and map the custom field to the connected campaign id

3. You can duplicate that function call as many times as you like with multiple custom fields and campaign ids as you wish.


Side Effects
------------

The downside of this script is that you will loose campaign step history on the contact. In some ways though this is not a problem, as they can in fact clutter up the audit trail anyway. :-)

You will still be left with audit entries for emails sent etc so you will see duplicates (because they will have reentered the campaign at some point - obviously).



