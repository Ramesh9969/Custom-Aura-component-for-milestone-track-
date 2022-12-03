({  
    doInit : function(component, event, helper) {
        
        console.log("diinit get called!!");
        var id = component.get("v.recordId");
        
        var tts = 'ddr';
        var ttp = 'gg';
        var action = component.get("c.SLATimeMethod");
        action.setParams({ "recordId": id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               var ttp = response.getReturnValue();
                 if(ttp != null){
                  var nn = ttp.split(":");
                     if(nn[4]=='minus'){
                        component.set("v.plus","false"); 
                     }
                     if(nn[4]=='plus'){
                         component.set("v.plus","true");   
                     }
                 }
                
                    tts = nn[0]+":"+nn[1]+":"+nn[2];
            
                component.set("v.ltngTimmer",tts);
                     
              
                     var ss = tts.split(":");
                   
         if(ss[0]>23){
          var  days = ((ss[0]-(ss[0]%24))/24);
          component.set("v.days",days);  
            ss[0] = (ss[0]%24);
           
        }
              
                if( nn[3] == 'false'){
                      helper.setStartTimeOnUI(component); 
                }else{
                      component.set("v.ltngHour1",ss[0]);
         component.set("v.ltngMinute1",ss[1]);
          component.set("v.ltngSecond1",ss[2]);
                   helper.setStopTimeOnUI(component);
                 }
                
                
                
                
                
                
            }});
        $A.enqueueAction(action);
        
        
    },
    changeField: function(component, event, helper) { 
        
        console.log("changefiel get called!!");
        var id = component.get("v.recordId");
        
    
        var action = component.get("c.SLATimeMethod");
        action.setParams({ "recordId": id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
              var ttp = response.getReturnValue();
                if(ttp != null){
                  var nn = ttp.split(":");
                 }
                 
              var  tts = nn[0]+":"+nn[1]+":"+nn[2];
                  var ss = tts.split(":");
                component.set("v.ltngTimmer",tts);
              if(nn[4]=='minus'){
                        component.set("v.plus","false"); 
                  console.log(nn[4]);
                     }
                     if(nn[4]=='plus'){
                         component.set("v.plus","true"); 
                         console.log(nn[4]);
                     }
               
                           if(ss[0]>23){
           var days = ((ss[0]-(ss[0]%24))/24);
          component.set("v.days",days);  
            ss[0] = (ss[0]%24);
           
        }
              
                if( nn[3] == 'false'){
                      helper.setStartTimeOnUI(component); 
                }else{
                      component.set("v.ltngHour1",ss[0]);
         component.set("v.ltngMinute1",ss[1]);
          component.set("v.ltngSecond1",ss[2]);
                   helper.setStopTimeOnUI(component);
                 }
                
                
                
                
                
            }});
        $A.enqueueAction(action);
        
        
    }
})