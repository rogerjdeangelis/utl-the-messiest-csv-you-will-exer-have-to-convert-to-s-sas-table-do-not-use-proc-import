The messiest csv file you will ever have to convert to a sas table do not use proc import                                                                         
                                                                                                                                                                  
GitHub                                                                                                                                                            
https://tinyurl.com/y6zte97t                                                                                                                                      
https://github.com/rogerjdeangelis/utl-the-messiest-csv-you-will-exer-have-to-convert-to-s-sas-table-do-not-use-proc-import                                       
                                                                                                                                                                  
The messy CSV (also available from SAS forum link)                                                                                                                
https://tinyurl.com/y68opb8u                                                                                                                                      
https://raw.githubusercontent.com/rogerjdeangelis/utl-the-messiest-csv-you-will-exer-have-to-convert-to-s-sas-table-do-not-use-proc-import/master/csv_20200810.csv
                                                                                                                                                                  
SAS Forum                                                                                                                                                         
https://communities.sas.com/t5/SAS-Programming/Import-of-csv/m-p/682987                                                                                           
                                                                                                                                                                  
Works best with 1980s classic SAS? Especaillly if SAS fixes FSLIST?                                                                                               
                                                                                                                                                                  
/*                   _                                                                                                                                            
(_)_ __  _ __  _   _| |_                                                                                                                                          
| | `_ \| `_ \| | | | __|                                                                                                                                         
| | | | | |_) | |_| | |_                                                                                                                                          
|_|_| |_| .__/ \__,_|\__|                                                                                                                                         
        |_|                                                                                                                                                       
*/                                                                                                                                                                
                                                                                                                                                                  
Note we have multiple conditions                                                                                                                                  
                                                                                                                                                                  
    1. '0A'x, and mutiple '0A0A'x                                                                                                                                 
    2.  Quoted strings                                                                                                                                            
    3.  Very long strings (over 20k bytes)                                                                                                                        
    4. preprocessing is needed due to fact that ;0A'x is end of record in unix.                                                                                   
                                                                                                                                                                  
We need to change '0A'x to ';' except if the '0A'x is after a '0D'x.                                                                                              
                                                                                                                                                                  
My guess is that '0A'x acts like the ';' where '0A0A'x is 2 ';'s (see below)                                                                                      
                                                                                                                                                                  
Sample of unusual data structures of this csv file                                                                                                                
                                                                                                                                                                  
The output below is from my github 'utlrulr' macro                                                                                                                
                                                                                                                                                                  
Some sample slices of the input csv.                                                                                                                              
                                                                                                                                                                  
Bytes 701-800                                                                                                                                                     
                                                                                                                                                                  
ation;risque;VIDE..FR0010069450;ECUREUIL ACTIONS MONDE (C);FCP;Actions internationales;Actions inter                                                              
                                                                                                                                                                  
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1                                                              
6766637677763544400453333333333344554544244544452444442242344534676667266767667666666734676667266767                                                              
149FEB293155B6945DA620010069450B5352559C01349FE30DFE450839B630B1349FE309E452E149FE1C53B1349FE309E452                                                              
                 ==                                                                                                                                               
               '0D0A'x                                                                                                                                            
               718-719                                                                                                                                            
                                                                                                                                                                  
 Bytes 1101-1200                                                                                                                                                  
                                                                                                                                                                  
0 %.Indirects Maximum 3.00 %";"Directs Maximum 0.00 %.Indirects Fixe 0.00 %";"Directs Maximum 2.20 %                                                              
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1                                                              
3220466676677246766762323322232467667724676676232332204666766772467623233222324676677246766762323322                                                              
005A9E49253430D189D5D03E00052B249253430D189D5D00E0005A9E49253430698500E00052B249253430D189D5D02E2005                                                              
   =                                                 =                                                                                                            
  '0A'x                                            '0A'x                                                                                                          
  1103                                             1154                                                                                                           
                                                                                                                                                                  
 Bytes 49801-49900                                                                                                                                                
                                                                                                                                                                  
tissant essentiellement dans des soci.t.s des march.s .mergents...Approche d'investissement .* Appli                                                              
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1                                                              
7677667267766766666666726667266727666E7E72667266766E72E667666772004777666626266767767766667202247766                                                              
49331E405335E495CC5D5E4041E3045303F39949304530D12389309D5275E43EAA1002F3850479E65349335D5E40AA0100C9                                                              
                                                                ==                          =                                                                     
                                                               '0A0A'x                     '0A'x                                                                  
                                                                                                                                                                  
/*           _               _                                                                                                                                    
  ___  _   _| |_ _ __  _   _| |_                                                                                                                                  
 / _ \| | | | __| `_ \| | | | __|                                                                                                                                 
| (_) | |_| | |_| |_) | |_| | |_                                                                                                                                  
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                                                 
                |_|                                                                                                                                               
*/                                                                                                                                                                
                                                                                                                                                                  
122 records out. I have no way of knowing if this is correct                                                                                                      
                                                                                                                                                                  
Middle Observation(61 ) of want - Total Obs 122                                                                                                                   
                                                                                                                                                                  
                                              Truncated to 16 bytes                                                                                               
 -- CHARACTER --                                                                                                                                                  
CODEISIN                         C12      LU0528547689                                                                                                            
LIBELLE                          C63      RIVERTREE BOND E                                                                                                        
NATURE                           C10      SICAV                                                                                                                   
CATEGAMF                         C30                                                                                                                              
CATEGEPF                         C52      Obligations euro                                                                                                        
ZONEGEO                          C28      Monde entier                                                                                                            
DUREEMINRECO                     C12      48                                                                                                                      
AFFECTATIONRESULTAT              C30      Distribution                                                                                                            
FISCALITETEXT                    C13                                                                                                                              
DEVISECOMPTABLE                  C15      EUR                                                                                                                     
                                                                                                                                                                  
DATECLOTURE                      C11      01/01/3000           ==> dates lineup                                                                                   
DATEOUVERTURE                    C13      30/09/2010                                                                                                              
                                                                                                                                                                  
PROMOTEUR                        C30      QUINTET PRIVATE                                                                                                         
ADRESSEPROMOTEUR                 C70      43 BOULEVARD ROY                                                                                                        
STEGESTION                       C51      KREDIETRUST LUXE                                                                                                        
ADRESSESTEGESTION                C100     11 RUE ALDRINGEN                                                                                                        
STEADMDELEGUE                    C30      KREDIETRUST LUXE                                                                                                        
STEFINADMDELEGUE                 C30                                                                                                                              
DEPOSITAIRE                      C30      QUINTET PRIVATE                                                                                                         
ADRESSEDEPOSITAIRE               C99      43 BOULEVARD ROY                                                                                                        
COMMISSAIRECPTE                  C30      DELOITTE AUDIT S                                                                                                        
SOUSCRIPTION                     C47      Maximum 5.00 %                                                                                                          
RACHAT                           C56      Maximum 2.00 %                                                                                                          
FRAISGESTION                     C56      Maximum 1.00 % T                                                                                                        
DATEPERFORMANCE                  C15      31/07/2020                                                                                                              
PERF12MOIS                       C10      -1.16                                                                                                                   
PERF36MOIS                       C10      -0.58                                                                                                                   
PERF60MOIS                       C10      0.41                                                                                                                    
FRAISGESTIONCOMMENTAIRE          C3075    Non communiqués                                                                                                         
OBJECTIFGESTION                  C9598    KBL EPB Fund - B                                                                                                        
SOUSCRIPTEURS                    C4658    Ce compartiment                                                                                                         
                                                                                                                                                                  
ORIENTATIONPLACEMENT             C20523   Le compartiment      ===> a very long string                                                                            
                                                                                                                                                                  
DATECLOTUREEXERCICE              C217     L'exercice de la                                                                                                        
PERIODEVL                        C1587    La valeur nette                                                                                                         
SITEPUBLICATION                  C520     La valeur de l'a                                                                                                        
CONDITIONSOUSCRIPRACHAT          C9194    Les demandes de                                                                                                         
DATEVALIDATION                   C14      01/01/2019           ==> dates line up so preious mapping is correct?                                                   
MINIMUMRISQUEACTION              C19                                                                                                                              
DATEAGREMENTAMF                  C15      30/04/1999                                                                                                              
TFE                              C19      31/12/2018 : 0.4     ==> another date                                                                                   
                                                                                                                                                                  
                                                                                                                                                                  
PERFAM1                          C7       2.12                 ==> Consistently numeric                                                                           
PERFAM2                          C7       -1.78                                                                                                                   
PERFAM3                          C7       1.43                                                                                                                    
PERFAM4                          C7       2.18                                                                                                                    
PERFAM5                          C7       -0.52                                                                                                                   
PERFAM6                          C7       5.97                                                                                                                    
PERFAM7                          C7       -5.94                                                                                                                   
PERFAM8                          C7       10.84                                                                                                                   
                                                                                                                                                                  
UNITEDUREEMINRECO                C17      Mois                                                                                                                    
PERFYTD                          C7       -1.02                                                                                                                   
VOLAT_12MOIS                     C12      4.56                                                                                                                    
FREQUENCE_TEXT                   C14      Quotidien                                                                                                               
PROSPECTUS_URL                   C35      www.kbl.lu          ===> Looks like a URL                                                                               
JOUR_VALORISATION                C17                                                                                                                              
RISQUE                           C6       2                                                                                                                       
VIDE                             C4       VIDE                                                                                                                    
                                                                                                                                                                  
/*         _       _   _                                                                                                                                          
 ___  ___ | |_   _| |_(_) ___  _ __                                                                                                                               
/ __|/ _ \| | | | | __| |/ _ \| `_ \                                                                                                                              
\__ \ (_) | | |_| | |_| | (_) | | | |                                                                                                                             
|___/\___/|_|\__,_|\__|_|\___/|_| |_|                                                                                                                             
                                                                                                                                                                  
*/                                                                                                                                                                
                                                                                                                                                                  
* We need to change '0A'x to ';' except if the '0A'x is after a '0D'x;                                                                                            
                                                                                                                                                                  
data _null_;                                                                                                                                                      
 infile "d:\csv\csv_20200810.csv" lrecl=1 recfm=n;                                                                                                                
 file "d:\csv\csv_20200810A.csv" lrecl=1 recfm=n;                                                                                                                 
 input chr $char1.;                                                                                                                                               
 * hange '0A'x to ';' except if the '0A'x is after an '0D'x;                                                                                                      
 if chr='0A'x and lag(chr) ne '0D'x then chr=';';                                                                                                                 
 put chr $char1.;                                                                                                                                                 
run;quit;                                                                                                                                                         
                                                                                                                                                                  
                                                                                                                                                                  
data have;                                                                                                                                                        
                                                                                                                                                                  
      infile "d:/csv/csv_20200810a.csv" dlm=';'  DSD lrecl=32867 ;                                                                                                
                                                                                                                                                                  
      informat                                                                                                                                                    
          CodeIsin                                                                                                                                                
          Libelle                                                                                                                                                 
          nature                                                                                                                                                  
          categAMF                                                                                                                                                
          categEPF                                                                                                                                                
          zoneGeo                                                                                                                                                 
          dureeMinReco                                                                                                                                            
          affectationResultat                                                                                                                                     
          fiscaliteText                                                                                                                                           
          deviseComptable                                                                                                                                         
          dateCloture                                                                                                                                             
          dateOuverture                                                                                                                                           
          promoteur                                                                                                                                               
          adressePromoteur                                                                                                                                        
          steGestion                                                                                                                                              
          adresseSteGestion                                                                                                                                       
          steAdmDelegue                                                                                                                                           
          steFinAdmDelegue                                                                                                                                        
          depositaire                                                                                                                                             
          adresseDepositaire                                                                                                                                      
          commissaireCpte                                                                                                                                         
          souscription                                                                                                                                            
          rachat                                                                                                                                                  
          fraisGestion                                                                                                                                            
          datePerformance                                                                                                                                         
          perf12mois                                                                                                                                              
          perf36mois                                                                                                                                              
          perf60mois                                                                                                                                              
          fraisGestionCommentaire                                                                                                                                 
          objectifGestion                                                                                                                                         
          souscripteurs                                                                                                                                           
          orientationPlacement                                                                                                                                    
          dateClotureExercice                                                                                                                                     
          periodeVL                                                                                                                                               
          sitePublication                                                                                                                                         
          conditionSouscripRachat                                                                                                                                 
          dateValidation                                                                                                                                          
          minimumRisqueAction                                                                                                                                     
          dateAgrementAMF                                                                                                                                         
          Tfe                                                                                                                                                     
          perfAm1                                                                                                                                                 
          perfAm2                                                                                                                                                 
          perfAm3                                                                                                                                                 
          perfAm4                                                                                                                                                 
          perfAm5                                                                                                                                                 
          perfAm6                                                                                                                                                 
          perfAm7                                                                                                                                                 
          perfAm8                                                                                                                                                 
          UnitedureeMinReco                                                                                                                                       
          perfYTD                                                                                                                                                 
          volat_12mois                                                                                                                                            
          frequence_text                                                                                                                                          
          prospectus_url                                                                                                                                          
          jour_valorisation                                                                                                                                       
          risque                                                                                                                                                  
          VIDE                                                                                                                                                    
             $32000.;                                                                                                                                             
      input                                                                                                                                                       
            CodeIsin                                                                                                                                              
            Libelle                                                                                                                                               
            nature                                                                                                                                                
            categAMF                                                                                                                                              
            categEPF                                                                                                                                              
            zoneGeo                                                                                                                                               
            dureeMinReco                                                                                                                                          
            affectationResultat                                                                                                                                   
            fiscaliteText                                                                                                                                         
            deviseComptable                                                                                                                                       
            dateCloture                                                                                                                                           
            dateOuverture                                                                                                                                         
            promoteur                                                                                                                                             
            adressePromoteur                                                                                                                                      
            steGestion                                                                                                                                            
            adresseSteGestion                                                                                                                                     
            steAdmDelegue                                                                                                                                         
            steFinAdmDelegue                                                                                                                                      
            depositaire                                                                                                                                           
            adresseDepositaire                                                                                                                                    
            commissaireCpte                                                                                                                                       
            souscription                                                                                                                                          
            rachat                                                                                                                                                
            fraisGestion                                                                                                                                          
            datePerformance                                                                                                                                       
            perf12mois                                                                                                                                            
            perf36mois                                                                                                                                            
            perf60mois                                                                                                                                            
            fraisGestionCommentaire                                                                                                                               
            objectifGestion                                                                                                                                       
            souscripteurs                                                                                                                                         
            orientationPlacement                                                                                                                                  
            dateClotureExercice                                                                                                                                   
            periodeVL                                                                                                                                             
            sitePublication                                                                                                                                       
            conditionSouscripRachat                                                                                                                               
            dateValidation                                                                                                                                        
            minimumRisqueAction                                                                                                                                   
            dateAgrementAMF                                                                                                                                       
            Tfe                                                                                                                                                   
            perfAm1                                                                                                                                               
            perfAm2                                                                                                                                               
            perfAm3                                                                                                                                               
            perfAm4                                                                                                                                               
            perfAm5                                                                                                                                               
            perfAm6                                                                                                                                               
            perfAm7                                                                                                                                               
            perfAm8                                                                                                                                               
            UnitedureeMinReco                                                                                                                                     
            perfYTD                                                                                                                                               
            volat_12mois                                                                                                                                          
            frequence_text                                                                                                                                        
            prospectus_url                                                                                                                                        
            jour_valorisation                                                                                                                                     
            risque                                                                                                                                                
            VIDE ;                                                                                                                                                
run;                                                                                                                                                              
                                                                                                                                                                  
options ls=255;                                                                                                                                                   
                                                                                                                                                                  
* reduce character lingth to longest length in the data;                                                                                                          
* see github for code;                                                                                                                                            
                                                                                                                                                                  
%utl_optlen(inp=have,out=want);                                                                                                                                   
                                                                                                                                                                  
/*                 _           _                                                                                                                                  
  __ _ _ __   __ _| |_   _ ___(_)___                                                                                                                              
 / _` | `_ \ / _` | | | | / __| / __|                                                                                                                             
| (_| | | | | (_| | | |_| \__ \ \__ \                                                                                                                             
 \__,_|_| |_|\__,_|_|\__, |___/_|___/                                                                                                                             
                     |___/                                                                                                                                        
*/                                                                                                                                                                
                                                                                                                                                                  
%utlrulr                                                                                                                                                          
      (                                                                                                                                                           
       uinflt =d:\csv\csv_20200810.csv                                                                                                                            
       ,uprnlen =100                                                                                                                                              
       ,ulrecl  =100                                                                                                                                              
       ,urecfm   =f                                                                                                                                               
       ,uobs = 500                                                                                                                                                
       ,uchrtyp =ascii                                                                                                                                            
       ,uotflt =d:\txt\delete.hex                                                                                                                                 
      );                                                                                                                                                          
                                                                                                                                                                  
                                                                                                                                                                  
* not useful because of SAS bug;                                                                                                                                  
filename fin "d:\csv\csv_20200810.csv" lrecl=100 recfm=f;                                                                                                         
proc fslist file=fin;                                                                                                                                             
run;quit;                                                                                                                                                         
                                                                                                                                                                  
Edited output                                                                                                                                                     
                                                                                                                                                                  
 Bytes 701-800                                                                                                                                                    
                                                                                                                                                                  
                                                                                                                                                                  
* This is the end of header record, need only ';' to get header;                                                                                                  
                                                                                                                                                                  
ation;risque;VIDE..FR0010069450;ECUREUIL ACTIONS MONDE (C);FCP;Actions internationales;Actions inter                                                              
                                                                                                                                                                  
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1                                                              
6766637677763544400453333333333344554544244544452444442242344534676667266767667666666734676667266767                                                              
149FEB293155B6945DA620010069450B5352559C01349FE30DFE450839B630B1349FE309E452E149FE1C53B1349FE309E452                                                              
                 ==                                                                                                                                               
               '0D0A'x                                                                                                                                            
               718-719                                                                                                                                            
                                                                                                                                                                  
 Bytes 1101-1200                                                                                                                                                  
                                                                                                                                                                  
0 %.Indirects Maximum 3.00 %";"Directs Maximum 0.00 %.Indirects Fixe 0.00 %";"Directs Maximum 2.20 %                                                              
1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1                                                              
3220466676677246766762323322232467667724676676232332204666766772467623233222324676677246766762323322                                                              
005A9E49253430D189D5D03E00052B249253430D189D5D00E0005A9E49253430698500E00052B249253430D189D5D02E2005                                                              
   =                                                 =                                                                                                            
  '0A'x                                            '0A'x                                                                                                          
  1103                                             1154                                                                                                           
