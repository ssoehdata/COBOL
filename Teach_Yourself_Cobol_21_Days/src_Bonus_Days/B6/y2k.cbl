      * The Year 2000 problem

      *COBOL programs, as well as other software, including even the 
      *software that displays the date and time on your IBM-compatible
      *PC, use a six-digit date. The date, in YYMMDD or MMDDYY format,
      *and the accompanying code assume 19 for the first part of
      * the year and store, for example, November 12, 1997
      *as 971112 or 111297. January 1, 2000 would become 000101. 
      *This will mess up a lot of sorting logic and other
      *parts of the program.
       
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      *%                   SOLUTIONS                           %
      *%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      *There are two basic methods for solving the year 2000 problem:
      *● Change the data in all files to reflect a new date format 
      *that includes two extra digits for the year portion
      *of the date. Then change all the programs to read or write this 
      *new full date to and from files. Programs
      *that sort or format this new date will also have to be changed.

      *●  Change the data in all files to reflect a new way of storing 
      *dates, but use the same amount of space
      *currently used for dates. Then change all the programs to read,
      * sort, or format this new date. This method
      *breaks down into four main sub-methods:

      *❍  Fixed-window dating uses the two digits of the year and 
      *provides a break or rollover point in the
      *programs. For example, all years stored as 51 to 99 represent 
      *1951 to 1999, and all years stored as  00 to 50 represent 2000 
      *to 2050. Even if your computer processes a maximum of 100 years 
      *worth of data, this method will eventually need revision sometime
      * before 2049.

      *❍  Sliding-window dating is similar to fixed-window dating,
      * but instead of a fixed rollover, the rollover point slides 
      *in time. The rollover point is defined as the current system 
      *date, and limits are set for the bottom and top of the 100-year
      * limit. As an example, an inventory system might have to
      * deal with dates received on goods as much as five years ago 
      *and dates of expected shipment on new goods that are as 
      *much as two years in the future. The sliding window could be 
      *set so that the system could store 40 years into the past and 
      *60 years into the future. During 1997, years 37
      * through 99 represent 1937 through 1999, and years 00 through 
      *36 represent 2000 through 2036.
      * When the system date moves to 1999, years 39 through 99 
      *represent 1939 through 1999, and years 00 through 38 
      * represent 2000 through 2038. This assumes that material is
      * retired from the system so that the sliding window doesn't 
      * slide up over old dates and that the system doesn't process 
      * more than a 100-year range of dates.

      *❍  Encoding dates involves modifying dates in the files to 
      *use a new coding scheme that lets the date be stored as 
      *other than just digits. A wide variety of methods has been 
      *suggested. Alphabetical characters and hexadecimal digits are
      *  two suggestions that show up frequently, but at the moment,
      * no coding scheme stands out as a favorite. This involves 
      *modifying all date-handling logic to convert to and from 
      *this encoded scheme.

      *❍  Use the six digits currently used to store year month and 
      *day to store the ANSI days date (or the Lilian days date on 
      *many IBM systems). Again, all programs must be modified to 
      *convert between YYYYMMDD format and ANSI days format when 
      *reading from and writing to a file. The six digits of days 
      *would allow for about 2,739 years worth of dates, or January 1,
      * 1601 to some date in the year 4339.
      