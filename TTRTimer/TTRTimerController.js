({  
    doInit : function(component, event, helper) {
        
        console.log("diinit get called!!");
        var id = component.get("v.recordId");
        var ttp ='ll';
        var tts ='ada';
        
        var action = component.get("c.TTRTimeMethod");
        action.setParams({ "recordId": id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                ttp = response.getReturnValue();
                var nn = ttp.split(":");
                 if(nn[3]=='minus'){
                        component.set("v.plus","false"); 
                     }
                     if(nn[3]=='plus'){
                         component.set("v.plus","true");   
                     }
                 tts = nn[0]+":"+nn[1]+":"+nn[2];
                if( tts !== null && typeof tts !== 'undefined'&& tts!=='00:00:00'){
                     component.set("v.ltngTimmer",tts);
                     var ss = tts.split(":");
                     var days = ((ss[0]-(ss[0]%24))/24);
                    component.set("v.days",days);  
                    if(tts !== null){
                      helper.setStartTimeOnUI(component);   
                    }
                    
                }
                else{
                        console.log('dd');
                         helper.setResetTimeOnUI(component);
                }
                
                
                
                
                
            }});
        $A.enqueueAction(action);
        
        
    },
    changeField: function(component, event, helper) { 
        
        console.log("changefiel get called!!");
        var id = component.get("v.recordId");
            var ttp ='ll';
        var tts ='ada';
       
        
        var action = component.get("c.TTRTimeMethod");
        action.setParams({ "recordId": id });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               ttp = response.getReturnValue();
                var nn = ttp.split(":");
                 if(nn[3]=='minus'){
                        component.set("v.plus","false"); 
                     }
                     if(nn[3]=='plus'){
                         component.set("v.plus","true");   
                     }
                 tts = nn[0]+":"+nn[1]+":"+nn[2];
                if(tts != '00:00:00' && tts !== null && typeof tts !== 'undefined'){
                     component.set("v.ltngTimmer",tts);
                     var ss = tts.split(":");
                     var days = ((ss[0]-(ss[0]%24))/24);
                    component.set("v.days",days);  
                    if(tts !== null){
                      helper.setStartTimeOnUI(component);   
                    }
                    
                }
                else{
                        console.log('dd');
                         helper.setResetTimeOnUI(component);
                }
                
                
                
                
                
            }});
        $A.enqueueAction(action);
        
        
    }
})