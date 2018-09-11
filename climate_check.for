      PROGRAM climate_check

***************************************************
* Program that determines if a series of 10 daily *
* temps are normal, well above/below average      *
* or record breaking for the season.              *
*                                                 *
* By: Heather Bricca                              *
*     Worked with Jilliann Dufort                 * 
*                                                 *
* September 11,2018                               *
*                                                 *
* Modifications: (none)                           *
*                                                 *
* I have neither given or received, nor have I    *
* tolerated others use of unauthorized aid.       *
*                                                 *
*                                                 *
*                                                 *
***************************************************
      
      INTEGER m(11), month, day, Year, monthsum, jd, tmpf, jdsum
 
      OPEN (UNIT=15, FILE = 'climate_data.txt', STATUS = 'UNKNOWN')

*     Now read in the file climate_data.txt.
 
*      READ (15,*)
      do i=1, 10
        READ (15,*) Year, month, day, tmpf

*     Print statement to choose year to then see if it's a leap year.

*      PRINT *, 'Choose a year to see if it is a leap year.'
*      READ (*,*) Year

*     If the year is divisible by 4, then it's a leap year.
  
      IF(MOD (Year,400) .EQ. 0 .OR. MOD (Year,4) .EQ. 0 ) THEN
        
        PRINT *,Year, 'is a leap year. '
        leap = 1

*     If the year is anything else, it is not a leap year.

      ELSE 

         PRINT *,Year,  'is not a leap year' 
         leap = 0

      END IF 

*     This is the else if statement to calculate a Julian day using days
*     of the month.

       sumjd = 0

       m(1)= 31
       m(2)= 28
       m(3)= 31
       m(4)= 30
       m(5)= 31
       m(6)= 30
       m(7)= 31
       m(8)= 31
       m(9)= 30
       m(10)=31
       m(11)=30
       
       If (MOD (Year,400) .EQ. 0 .AND. MOD (Year,4) .EQ. 0 .AND. month .GT. 2)  THEN
          
         do j=1, (month-1)
           sumjd= sumjd+m(j)
           enddo 
           jd= sumjd+day+1
 
         ELSE
           do j=1, (month-1)
           sumjd= sumjd+ m(j)
           enddo
         jd= sumjd+day
         END IF

         PRINT *, 'Month=', month
         PRINT *, 'Day=', day
         PRINT *, 'Year=', Year
         PRINT *, 'The number of Julian day is', jd   
         PRINT *, 'Temperature (F)=', tmpf
      
      
      ENDDO
      END
