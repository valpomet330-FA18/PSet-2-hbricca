      PROGRAM climate_check

***************************************************
* Program that determines if a series of 10 daily *
* temps are normal, well above/below average      *
* or record breaking for the season.              *
*                                                 *
* By: Heather Bricca                              *
*     Worked with Jilliann Dufort                 * 
*                                                 *
* September 9,2018                                *
*                                                 *
* Modifications: (none)                           *
*                                                 *
* I have neither given or received, nor have I    *
* tolerated others use of unauthorized aid.       *
*                                                 *
*                                                 *
*                                                 *
***************************************************
      
      INTEGER Y
 
      OPEN (UNIT=15, FILE = 'climate_data.txt', STATUS = 'UNKNOWN')

      PRINT *, 'Choose a year to see if it is a leap year.'
      READ (*,*) Y

*     If the year is divisible by 4, then it's a leap year.
  
      IF(MOD (Y,100) .NE. 0 .AND. MOD (Y,4) .EQ. 0) THEN
        
        PRINT *,Y, 'is a leap year. '

*     If the year is divisible by 400, then it's a leap year.
 
      ELSEIF (MOD (Y,400) .EQ. 0) THEN
  
        PRINT *, Y, 'is a leap year.'


*     If the year is anything else, it is not a leap year.

      ELSE 

         PRINT *,Y,  'is not a leap year' 
      
      END IF

*    Now to determine what the Julian Day of the year is.

*      integer day, sum_month, i, month(12), jd, year, mon  

      month = 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31   

      PRINT *, "Give day"    
      read (15,*) day    
      PRINT *, "Give month"    
      read (15,*) mon    
      PRINT *, "Give year"    
      read (15,*) year 
*
*      sum_month = 0  
*
*       if (mod(year,4) .EQ. 0 .and. mod(year,100)/ .EQ. 0) then     
*         do i = month(1), mon-1    
*            sum_month = sum_month + month(1) + day + 1    
*         end do    
*      else    
*         do i = month(1), mon-1    
*            sum_month = sum_month + month(1) + day    
*         end do    
*      end if  

*      PRINT *, sum_month   
      

       
      END
