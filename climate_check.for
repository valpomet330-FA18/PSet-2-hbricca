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
      
      INTEGER Y, m(11), month, day, year, monthsum, jd
 
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

*     Now choose what the day, month and year is.
      

      PRINT *, "Give day"    
      
      read (15,*) day    
      
      PRINT *, "Give month"    
      
      read (15,*) month    
      
      PRINT *, "Give year"    
      
      read (15,*) year 

*     This is how many days are in each month.

      m(1) = 31 
      m(2) = 28 
      m(3) = 31
      m(4) = 30
      m(5) = 31
      m(6) = 30
      m(7) = 31
      m(8) = 31
      m(9) = 30
      m(10) = 31
      m(11) = 30 
   

*      monthsum = 0

*     This is the else if statement to determine a Julian day.

       if (MOD(year,100) .NE. 0 .AND. MOD(year,4) .EQ. 0) THEN     
         
         do i = 1, (month-1)    
            monthsum = monthsum + m(1)  
            jd = monthsum + day + 1
        end do    

        else    
         do i = 1, (month-1)    
            monthsum = monthsum + m(1) + day    
         end do    
      end if  

      PRINT *, 'The number of Julian day is', jd   
      

       
      END
