#!/bin/sh

# provide blocking to prevent duplicates

function resetCampaign {
	echo "Testing for campaign reset $1 on $2"
	mysql  << set any mysql creds etc >> <<EOF
/* Generate a list of flagged leads to reset */

create temporary table camp_reset as select id from leads where $1=1;

/* Delete from the campaign audit log */

delete from campaign_lead_event_log

where lead_id in ( select id from camp_reset ) and campaign_id=$2;

/* Reset the lead flag once done */

update leads set $1=0 where id in (select id from camp_reset);

drop table camp_reset;
EOF
}

# process first resetting of campaign actions testing for contact field against campaign ref

resetCampaign  <<custom field name>> << campaign id this maps to>>

# eg
# resetCampaign  "reset_last_order" 25

# eof

