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

*     Open the climate_data.txt file into the program. 
      OPEN (UNIT=15, FILE = 'climate_data.txt', STATUS = 'UNKNOWN')

*     Now read in the file climate_data.txt with a statement to read in the variables.
 
*      READ (15,*)
      do i=1, 10
        READ (15,*) Year, month, day, tmpf
*    If statement to see if the year is a leap year or not.

*     If the year is divisible by 400 or 4, then it's a leap year.
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

*     Print statements to print out month, day, year, Julian day, and temperature.
         PRINT *, 'Month=', month
         PRINT *, 'Day=', day
         PRINT *, 'Year=', Year
         PRINT *, 'The number of Julian day is', jd   
         PRINT *, 'Temperature (F)=', tmpf
      


*     This starts the part of the script where it indicates Normal temp, Well above average, below average,
*     and record temperature with meteorological season in which it occured.

*     If statement for records for Winter season.
      IF (month .EQ. 1 .OR. month .EQ. 2 .OR. month .EQ. 12 .AND. tmpf .GE. 71) THEN
         PRINT *, 'For winter, climate records show this temperature is a record high.'
       ELSE IF (month .EQ. 1 .OR. month .EQ. 2 .OR. month .EQ. 12 .AND. tmpf .LT. 71 .AND. tmpf .GT. 41) THEN
        PRINT *, 'For winter, climate records show this temperature is well above average.'
       ELSE IF (month .EQ. 1 .OR. month .EQ. 2 .OR. month .EQ. 12 .AND. tmpf .LT. 41 .AND. tmpf .GT. 28) THEN
        PRINT *, 'For winter, climate records show this temperature is average.'
       ELSE IF (month .EQ. 1 .OR. month .EQ. 2 .OR. month .EQ. 12 .AND. tmpf .LE. 28) THEN
        PRINT *, 'For winter, climate records show this temperature is a well below average'
       ELSE IF (month .EQ. 1 .OR. month .EQ. 2 .OR. month .EQ. 12 .AND. tmpf .LT. 28 .AND. tmpf .GT. -10) THEN
        PRINT *, 'For winter, climate records show this temperature is a record low.'
       
      END IF

*     If statement for records for Spring season.
      IF (month .EQ. 3 .OR. month .EQ. 4 .OR. month .EQ. 5 .AND. tmpf .EQ. 96) THEN
         PRINT *, 'For spring, climate records show this temperature is a record high.'
       ELSE IF (month .EQ. 3 .OR. month .EQ. 4 .OR. month .EQ. 5 .AND. tmpf .EQ. 71) THEN
        PRINT *, 'For spring, climate records show this temperature is well above average.'
       ELSE IF (month .EQ. 3 .OR. month .EQ. 4 .OR. month .EQ. 5 .AND. tmpf .EQ. 58.6) THEN
        PRINT *, 'For spring, climate records show this temperature is average.'
       ELSE IF (month .EQ. 3 .OR. month .EQ. 4 .OR. month .EQ. 5 .AND. tmpf .EQ. 47) THEN
        PRINT *, 'For spring, climate records show this temperature is a well below average'
       ELSE IF (month .EQ. 3 .OR. month .EQ. 4 .OR. month .EQ. 5 .AND. tmpf .EQ. 13) THEN
        PRINT *, 'For spring, climate records show this temperature is a record low.' 
      END IF
      
*     If statement for records for Summer season.
      IF (month .EQ. 6 .OR. month .EQ. 7 .OR. month .EQ. 8 .AND. tmpf .EQ. 105) THEN
         PRINT *, 'For summer climate records show this temperature is a record high.'
       ELSE IF (month .EQ. 6 .OR. month .EQ. 7 .OR. month .EQ. 8 .AND. tmpf .EQ. 87) THEN
        PRINT *, 'For summer, climate records show this temperature is well above average.'
       ELSE IF (month .EQ. 6 .OR. month .EQ. 7 .OR. month .EQ. 8 .AND. tmpf .EQ. 81.7) THEN
        PRINT *, 'For summer, climate records show this temperature is average.'
       ELSE IF (month .EQ. 6 .OR. month .EQ. 7 .OR. month .EQ. 8 .AND. tmpf .EQ. 77) THEN
        PRINT *, 'For summer, climate records show this temperature is a well below average'
       ELSE IF (month .EQ. 6 .OR. month .EQ. 7 .OR. month .EQ. 8 .AND. tmpf .EQ. 52) THEN
        PRINT *, 'For summer, climate records show this temperature is a record low.' 
      END IF

*     If statement for records for Fall season.
      IF (month .EQ. 9 .OR. month .EQ. 10 .OR. month .EQ. 11 .AND. tmpf .EQ. 101) THEN
         PRINT *, 'For fall climate records show this temperature is a record high.'
       ELSE IF (month .EQ. 9 .OR. month .EQ. 10 .OR. month .EQ. 11 .AND. tmpf .EQ. 74) THEN
        PRINT *, 'For fall, climate records show this temperature is well above average.'
       ELSE IF (month .EQ. 9 .OR. month .EQ. 10 .OR. month .EQ. 11 .AND. tmpf .EQ. 62.8) THEN
        PRINT *, 'For fall, climate records show this temperature is average.'
       ELSE IF (month .EQ. 9 .OR. month .EQ. 10 .OR. month .EQ. 11 .AND. tmpf .EQ. 52) THEN
        PRINT *, 'For fall, climate records show this temperature is a well below average'
       ELSE IF (month .EQ. 9 .OR. month .EQ. 10 .OR. month .EQ. 11 .AND. tmpf .EQ. 10) THEN
        PRINT *, 'For fall, climate records show this temperature is a record low.' 
      END IF

      END DO
      END
