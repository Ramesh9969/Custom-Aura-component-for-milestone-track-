# Custom-Aura-component-for-milestone-track-
Have any customer needed to make a custom Milestone tracker when dealing with service cloud?

Here is the scenario.

One of our customers needed a solution for track time after a case is created. But the thing is we couldn't use standard milestone time tracker because they had a complex scenario. 

There should be two timers.

1.SLA timer

2.TTR timer

Countdown timer start value is based on different field values.Here are the fields and values.

1.Standard Status field=>(TTR6,TTR12,TTR24,TTR30,New,Open,Reply,Onhold,Action)

2.Domain count=> (Number field)

3.Issue Type=>(case issue type picklist field)

4.Issue sub type=>(Picklist field values are based on Issue type values)



1. 

Each timer starts based on status field value.

> If status is TTR6 =>TTR Timer starts from 6Hours(same as TR12,TTR24,TTR30) and SLA Timer paused.

> If status Is any (nonTTR) and not( onhold or reply) TTR Timer stopped and SLA Timer starts countdown.SLA timer countdown start time based on Issue Type and Issue sub Type field values.

>If Status is changed to TTR value, Then SLA time is paused and TTR timer starts countdown from beginning.  

>If status changed to onhold or reply, SLA timer pauses. 

>Then again if status changed to any (nonTTR) and not( onhold or reply)  SLA timer starts countdown from paused point.

>Either timers are paused or not both TTR and SLA timer Values changed on domain count field change.as=>

(New Count down time value = (domain count*Default countdown time+Remaining old countdown time)

>After reach timer for 00:00:00 timer wont stops and running for delay time



So I implemented Two aura components, Trigger on case object and component helper apex class for this scenario.

I am publishing this because this will be helpful one day for someone to make custom milestone tracker in Service Cloud.



