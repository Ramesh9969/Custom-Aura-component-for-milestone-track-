/*
* Purpose: Case Object Trigger    
* Created By: Agile Cloud 03/08/2018
* Last Modified By: 
* Current Version:  v1.0 
* Revision Log:  
*              v1.1 - 
*              v1.0 -           
*/
public class TriggerUtility{
  
    
    Public Static Void triggerForInsertSLAandTTR(List<case> NewTriggerList){
          for(case c :NewTriggerList){
               If(c.Reason == 'sitelock'){
             if(c.domain_count__c == null || c.domain_count__c == 0){
                    c.domain_count__c = 1;  
                }
             Integer dc = Integer.valueOf(c.domain_count__c);
            If((c.status == 'TTR6')||(c.status == 'TTR12')||(c.status == 'TTR24')||(c.status == 'TTR30')){
               c.TTR_Start_Time__c = DateTime.now();
               
                If(c.status == 'TTR6'){
                    c.timer_date__c = DateTime.now().addHours(6*dc); 
                }
                If(c.status == 'TTR12'){
                    c.timer_date__c = DateTime.now().addHours(12*dc); 
                }
                If(c.status == 'TTR24'){
                    c.timer_date__c =  DateTime.now().addHours(24*dc);
                }
                If(c.status == 'TTR30'){
                    c.timer_date__c =  DateTime.now().addHours(30*dc);
                   
                }
            }
                 
                 else If(c.Issue_Type__c == 'Expert Services'){
                    If(c.Issue_Sub_Type__c == 'Malware Scan false positive'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(2*dc);
                        c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    } 
                   If(c.Issue_Sub_Type__c == 'Malware Clean'||c.Issue_Sub_Type__c == 'SMART False Positive'||c.Issue_Sub_Type__c == '1and1'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(3*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                   If(c.Issue_Sub_Type__c == 'Issue After Clean/Fix'|| c.Issue_Sub_Type__c == 'Issue After Clean/Fix'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(6*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                  If(c.Issue_Sub_Type__c == 'Malware Consultation'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(8*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                    
                }
              else  
              {
                  If(c.Issue_Type__c == 'Product Issue'){
                    
                    If(c.Issue_Sub_Type__c == 'Support Consultation'||c.Issue_Sub_Type__c == 'Dashboard Issue'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(2*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                   If(c.Issue_Sub_Type__c == 'Survey'||c.Issue_Sub_Type__c == 'Research'||c.Issue_Sub_Type__c == 'SiteLock VPN'||c.Issue_Sub_Type__c == 'Duplicate'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(2*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                              If(c.Issue_Sub_Type__c == 'Issues After WAF'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(3*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                          If(c.Issue_Sub_Type__c == 'Abuse'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(4*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                    
                    
                }
                If(c.Issue_Type__c == 'Product Setup'){
                    
                    If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(1*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                   If(c.Issue_Sub_Type__c == 'Online Purchase'||c.Issue_Sub_Type__c == 'Truecode'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(2*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                    If(c.Issue_Sub_Type__c == 'SMART'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(3*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                     If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                        c.SLA_time__c = DateTime.now().addHours(4*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                 If(c.Issue_Sub_Type__c == 'SMART DB'||c.Issue_Sub_Type__c == 'TrustSeal'||c.Issue_Sub_Type__c == 'Patchman'||c.Issue_Sub_Type__c == 'Website Backup Setup'){
                         c.SLA_Start_Time__c = DateTime.now();
                        c.SLA_time__c = DateTime.now().addHours(4*dc);
                         c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                    }
                }
              }}
               
        }
    }
    Public Static Void triggerForUpdateSLAandTTR(List<case> NewTriggerList, Map<Id,Case> oldTriggerMap){
      
        
         for(case c :NewTriggerList){
             If(c.Reason == 'sitelock'){
                   If(c.status == 'closed'){
            c.SLA_Ended_Time__c = DateTime.now(); 
        }
                 else{
                 
                Integer dc = Integer.valueOf(c.domain_count__c);
                 If(((oldTriggerMap.get(c.Id).status != 'TTR6')||(oldTriggerMap.get(c.Id).status != 'TTR12')||(oldTriggerMap.get(c.Id).status != 'TTR24')||(oldTriggerMap.get(c.Id).status != 'TTR30'))&&((c.status == 'TTR6')||(c.status == 'TTR12')||(c.status == 'TTR24')||(c.status == 'TTR30'))&&(oldTriggerMap.get(c.Id).status != c.status)){
                      c.Is_TTR_Ended__c = false;
               
                If(c.status == 'TTR6'){
                      c.TTR_Start_Time__c = DateTime.now();
                    c.timer_date__c = DateTime.now().addHours(6*dc); 
                }
                If(c.status == 'TTR12'){
                     c.TTR_Start_Time__c = DateTime.now();
                    c.timer_date__c = DateTime.now().addHours(12*dc); 
                }
                If(c.status == 'TTR24'){
                     c.TTR_Start_Time__c = DateTime.now();
                    c.timer_date__c =  DateTime.now().addHours(24*dc);
                }
                If(c.status == 'TTR30'){
                     c.TTR_Start_Time__c = DateTime.now();
                    c.timer_date__c =  DateTime.now().addHours(30*dc);
                   
                }
                 }
                 
                 If((c.Issue_Sub_Type__c != oldTriggerMap.get(c.Id).Issue_Sub_Type__c && c.Issue_Type__c != oldTriggerMap.get(c.Id).Issue_Type__c)||((oldTriggerMap.get(c.Id).status == 'TTR6')||(oldTriggerMap.get(c.Id).status == 'TTR12')||(oldTriggerMap.get(c.Id).status == 'TTR24')||(oldTriggerMap.get(c.Id).status == 'TTR30'))&&((c.status != 'TTR6')||(c.status != 'TTR12')||(c.status != 'TTR24')||(c.status != 'TTR30'))&&(oldTriggerMap.get(c.Id).status != c.status)){
                    
                      If(((oldTriggerMap.get(c.Id).status == 'TTR6')||(oldTriggerMap.get(c.Id).status == 'TTR12')||(oldTriggerMap.get(c.Id).status == 'TTR24')||(oldTriggerMap.get(c.Id).status == 'TTR30'))&&((c.status != 'TTR6')||(c.status != 'TTR12')||(c.status != 'TTR24')||(c.status != 'TTR30'))&&(oldTriggerMap.get(c.Id).status != c.status)){
                          c.TTR_Ended_Time__c = DateTime.now();
                          c.Is_TTR_Ended__c = true;
                      }
                     
                      If(c.Issue_Type__c == 'Expert Services'){
                    If(c.Issue_Sub_Type__c == 'Malware Scan false positive'){
                         c.SLA_Start_Time__c = DateTime.now();
                        If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(2*dc);  
                        }
                      
                     
                    } 
                   If(c.Issue_Sub_Type__c == 'Malware Clean'||c.Issue_Sub_Type__c == 'SMART False Positive'||c.Issue_Sub_Type__c == '1and1'){
                         c.SLA_Start_Time__c = DateTime.now();
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(3*dc);  
                        }
                     
                      
                    }
                   If(c.Issue_Sub_Type__c == 'Issue After Clean/Fix'|| c.Issue_Sub_Type__c == 'Issue After Clean/Fix'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                           If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(6*dc);  
                        }
                       
                        
                    }
                  If(c.Issue_Sub_Type__c == 'Malware Consultation'){
                         c.SLA_Start_Time__c = DateTime.now();
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(8*dc);  
                        }
                       
                       
                    }
                    
                }
              If(c.Issue_Type__c == 'Product Issue'){
                    
                    If(c.Issue_Sub_Type__c == 'Support Consultation'||c.Issue_Sub_Type__c == 'Dashboard Issue'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(2*dc);  
                        }
                       
                        
                    }
                   If(c.Issue_Sub_Type__c == 'Survey'||c.Issue_Sub_Type__c == 'Research'||c.Issue_Sub_Type__c == 'SiteLock VPN'||c.Issue_Sub_Type__c == 'Duplicate'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                            If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(2*dc);  
                        }
                      
                    
                    }
                              If(c.Issue_Sub_Type__c == 'Issues After WAF'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(3*dc);  
                        }
                      
                       
                    }
                          If(c.Issue_Sub_Type__c == 'Abuse'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                           If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(4*dc);  
                        }
                       
                       
                    }
                    
                    
                }
               If(c.Issue_Type__c == 'Product Setup'){
                    
                    If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_Start_Time__c = DateTime.now();
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(1*dc);  
                        }
                      
                       
                    }
                   If(c.Issue_Sub_Type__c == 'Online Purchase'||c.Issue_Sub_Type__c == 'Truecode'){
                         c.SLA_Start_Time__c = DateTime.now();
                          If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(2*dc);  
                        }
                      
                       
                    }
                    If(c.Issue_Sub_Type__c == 'SMART'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                         If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(3*dc);  
                        }
                       
                        
                    }
                     If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_Start_Time__c = DateTime.now(); 
                           If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(4*dc);  
                        }
                        

                    }
                 If(c.Issue_Sub_Type__c == 'SMART DB'||c.Issue_Sub_Type__c == 'TrustSeal'||c.Issue_Sub_Type__c == 'Patchman'||c.Issue_Sub_Type__c == 'Website Backup Setup'){
                         c.SLA_Start_Time__c = DateTime.now();
                           If(c.SLA_time__c== null){
                           c.SLA_time__c = DateTime.now().addHours(4*dc);  
                        }
                       
                        
                    }
                }
                 }
            If((c.status != oldTriggerMap.get(c.Id).status) &&( (c.status == 'TTR6')||(c.status == 'TTR12')||(c.status == 'TTR24')||(c.status == 'TTR30'))){
                 c.Is_TTR_Ended__c = false;
                             c.TTR_Start_Time__c = DateTime.now();
                If(c.status == 'TTR6'){
                    c.timer_date__c = DateTime.now().addHours(6*dc); 
                }
                If(c.status == 'TTR12'){
                    c.timer_date__c = DateTime.now().addHours(12*dc); 
                }
                If(c.status == 'TTR24'){
                    c.timer_date__c =  DateTime.now().addHours(24*dc);
                }
                If(c.status == 'TTR30'){
                    c.timer_date__c =  DateTime.now().addHours(30*dc);
                }
                
            }
            
            
            If((c.Status == oldTriggerMap.get(c.Id).status)&&(c.domain_count__c != oldTriggerMap.get(c.Id).domain_count__c)&& ( c.Is_TTR_Ended__c== false)){
               
                Integer cc = Integer.valueOf(oldTriggerMap.get(c.Id).domain_count__c);
                Integer df = dc - cc ;
                If(c.timer_date__c == null){
                    c.timer_date__c = dateTime.now();
                }
                If(c.status == 'TTR6'){
                    c.timer_date__c = oldTriggerMap.get(c.Id).timer_date__c.addHours(6*df); 
                }
                If(c.status == 'TTR12'){
                    c.timer_date__c = oldTriggerMap.get(c.Id).timer_date__c.addHours(12*df); 
                }
                If(c.status == 'TTR24'){
                    c.timer_date__c =  oldTriggerMap.get(c.Id).timer_date__c.addHours(24*df);
                }
                If(c.status == 'TTR30'){
                    c.timer_date__c =  oldTriggerMap.get(c.Id).timer_date__c.addHours(30*df);
                }
                
                
                
            }
            
            IF((c.IsSLAtimerPaused__c == false)&&(c.Status != oldTriggerMap.get(c.Id).status)&&((c.status == 'TTR6')||(c.status == 'TTR12')||(c.status == 'TTR24')||(c.status == 'TTR30')||c.status=='With Development'||c.status=='On hold'||c.Status=='With Product Management'||c.Status=='Awaiting Customer Reply')){
               c.IsSLAtimerPaused__c = true;
                If(c.SLA_time__c!=null){
                      c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime();
                }
               
            }
            If((c.IsSLAtimerPaused__c == true)&&(c.status == 'New'||c.status == 'Open'||c.status == 'Assigned'||c.status == 'In progress')){
                c.IsSLAtimerPaused__c = false;
                c.SLA_time__c = datetime.now().addSeconds(Integer.valueOf(c.Remaining_Time_when_pause__c/1000));
                
            }
            If((c.Domain_Count__c != oldTriggerMap.get(c.Id).domain_count__c)&&c.SLA_time__c != null){
                   Integer cc = Integer.valueOf(oldTriggerMap.get(c.Id).domain_count__c);
                Integer df = dc - cc ;
                  If(c.Issue_Type__c == 'Expert Services'){
                    If(c.Issue_Sub_Type__c == 'Malware Scan False Positive'){
                        c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(2*df);   
                    } 
                    If(c.Issue_Sub_Type__c == 'Malware Clean'||c.Issue_Sub_Type__c == 'SMART False Positive'||c.Issue_Sub_Type__c == '1and1'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(3*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Issue After Clean/Fix'|| c.Issue_Sub_Type__c == 'Issue After Clean/Fix'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(6*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Malware Consultation'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(8*df);
                    }
                    
                }
                If(c.Issue_Type__c == 'Product Issue'){
                    
                    If(c.Issue_Sub_Type__c == 'Support Consultation'||c.Issue_Sub_Type__c == 'Dashboard Issue'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(2*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Survey'||c.Issue_Sub_Type__c == 'Research'||c.Issue_Sub_Type__c == 'SiteLock VPN'||c.Issue_Sub_Type__c == 'Duplicate'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(2*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Issues After WAF'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(3*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Abuse'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(4*df);
                    }
                    
                    
                }
                If(c.Issue_Type__c == 'product setup'){
                    If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(1*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Online Purchase'||c.Issue_Sub_Type__c == 'Truecode'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(2*df);
                    }
                    If(c.Issue_Sub_Type__c == 'SMART'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(3*df);
                    }
                    If(c.Issue_Sub_Type__c == 'Disable WAF'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(4*df);
                    }
                    If(c.Issue_Sub_Type__c == 'SMART DB'||c.Issue_Sub_Type__c == 'TrustSeal'||c.Issue_Sub_Type__c == 'Patchman'||c.Issue_Sub_Type__c == 'Website Backup Setup'){
                         c.SLA_time__c = oldTriggerMap.get(c.Id).SLA_time__c.addHours(4*df);
                    }
                }
                       If(c.IsSLAtimerPaused__c == true && c.SLA_time__c != null){
                            c.Remaining_Time_when_pause__c = c.SLA_time__c.getTime() - datetime.now().getTime(); 
                        }
            }
             
                 }}
            
        }
        
         } 
        
    
   
    
}