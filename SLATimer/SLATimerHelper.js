({
	  waitingTimeId: null,
    setStartTimeOnUI : function(component) {
         window.clearTimeout(this.waitingTimeId);
        component.set("v.ltngIsDisplayed",true);
        var isPositive = component.get("v.plus");
        var currTime =component.get("v.ltngTimmer");
         var days;
    if(typeof currTime !== 'undefined') {
             var ss = currTime.split(":");
        
        var dt = new Date();
       
       
         if(ss[0]>23){
            days = ((ss[0]-(ss[0]%24))/24);
          component.set("v.days",days);  
            ss[0] = (ss[0]%24);
           
        }
        dt.setHours(ss[0]); 
        dt.setMinutes(ss[1]);
        dt.setSeconds(ss[2]);
      
        if(isPositive == "false"){
           
            var dt2 = new Date(dt.valueOf() + 1000); 
        }
        else{
            var dt2 = new Date(dt.valueOf() - 1000); 
            console.log(isPositive +'true')
        }
       
        var temp = dt2.toTimeString().split(" ");
        var ts = temp[0].split(":");
      
        component.set("v.ltngTimmer",ts[0] + ":" + ts[1] + ":" + ts[2]);
        
           
                
        
          
        component.set("v.ltngHour1",ts[0]);
         component.set("v.ltngMinute1",ts[1]);
          component.set("v.ltngSecond1",ts[2]);
        this.waitingTimeId =setTimeout($A.getCallback(() => this.setStartTimeOnUI(component)), 1000);
        if(ts[0]==0 && ts[1]==0 && ts[2]==0 ){
            $A.get('e.force:refreshView').fire();
        }
    }
    },
    setStopTimeOnUI : function(component) {
        component.set("v.ltngIsDisplayed",false);
        window.clearTimeout(this.waitingTimeId);
    },
    setResetTimeOnUI : function(component) {
        component.set("v.ltngIsDisplayed",false);
        component.set("v.ltngHour","10");
        component.set("v.ltngMinute","0");
        component.set("v.ltngSecond","0");
        component.set("v.ltngTimmer","00:00:00");
        window.clearTimeout(this.waitingTimeId);
    }
})