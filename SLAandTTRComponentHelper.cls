public class SLAandTTRComponentHelper {
     @AuraEnabled
    public static string SLATimeMethod(Id recordId){
        case c = [select Id,SLA_time__c,Remaining_Time_when_pause__c,IsSLAtimerPaused__c from case where Id = :recordId];
        system.debug(c);
        string q = '00:00:00:true:zero';
        
        If(c.IsSLAtimerPaused__c==true && c.SLA_time__c != null ){
             Long milliseconds = Integer.valueOf(c.Remaining_Time_when_pause__c);
            Long msnew = milliseconds;
            If(milliseconds <0 ){
                msnew = milliseconds*(-1);
            }
           
        Long seconds = msnew / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;
        system.debug(seconds);
        system.debug(minutes);
        system.debug(hours);
        system.debug(days);
        
        long actSec = seconds-minutes*60;
        long actmn = minutes - hours*60;
        
        system.debug(actsec +' l '+ actmn +' l '+ hours);
        
        
           
            If(milliseconds < 0){
               q = hours +':'+actmn+':'+actSec+ ':true:minus';   
            }
            else{
                q = hours +':'+actmn+':'+actSec+ ':true:plus'; 
            }
               
       
        }
        else If(c.IsSLAtimerPaused__c==false && c.SLA_time__c != null){
              Long dt1Long = c.SLA_time__c.getTime();
        Long dt2Long = DateTime.now().getTime();
        Long milliseconds = dt1Long - dt2Long;
           Long msnew = milliseconds;
            If(milliseconds <0 ){
                msnew = milliseconds*(-1);
            }
          system.debug(msnew);
        Long seconds = msnew / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;
        system.debug(seconds);
        system.debug(minutes);
        system.debug(hours);
        system.debug(days);
        
        long actSec = seconds-minutes*60;
        long actmn = minutes - hours*60;
        
        system.debug(actsec +' l '+ actmn +' l '+ hours);
            If(milliseconds < 0){
                 q = hours +':'+actmn+':'+actSec+ ':false:minus';
            }
            else{
                 q = hours +':'+actmn+':'+actSec+ ':false:plus';
            }
                 
        }
        else if (c.SLA_time__c == null){
            q = '00:00:00:true';
        }
      
        system.debug(q);
        return q;
    }
 @AuraEnabled
    public static string TTRTimeMethod(Id recordId){
        case c = [select Id,timer_date__c,status from case where Id = :recordId];
        
        string q = '00:00:00:plus';
        
        If(c.timer_date__c !=null && ((c.status == 'TTR6')||(c.status == 'TTR12')||(c.status == 'TTR24')||(c.status == 'TTR30') )){
             Long dt1Long = c.timer_date__c.getTime();
           
          
              Long dt2Long = DateTime.now().getTime();
        Long milliseconds = dt1Long - dt2Long;
            Long mlsnw = milliseconds;
            If(milliseconds<0){
                mlsnw = milliseconds*(-1); 
            }
        Long seconds = mlsnw / 1000;
        Long minutes = seconds / 60;
        Long hours = minutes / 60;
        Long days = hours / 24;
        system.debug(seconds);
        system.debug(minutes);
        system.debug(hours);
        system.debug(days);
        
        long actSec = seconds-minutes*60;
        long actmn = minutes - hours*60;
        
        system.debug(actsec +' l '+ actmn +' l '+ hours);
        

            If(milliseconds<0){
              q = hours +':'+actmn+':'+actSec+':minus' ;  
            }
            else{
                 q = hours +':'+actmn+':'+actSec+':plus' ;
            }
        
        system.debug(q);
             system.debug(q);
       
         
         return q; 
                       }
        else{
            return '00:00:00:plus';
        }
         
    }
}