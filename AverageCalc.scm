;;Program 4: Scheme
;;Written by Dallas Ward
;;Class: CSCI431
;;Professor: Dr. Garrison
;;Description: This program accepts numbers as input from the user, through the
;;command line. The average of these numbers is calculated and printed to the
;;console.

;;This function can be called to display the instructions. It is called by
;;entering help in to the command line.
(define help
  (lambda ()
    (display "Instructions: This program will take the average of numbers
      provided by the user. The program will first ask you how many numbers you
      intend to enter. When prompted by the program, please input the
      numbers you wish to take the average of one at a time, pressing enter
      between each one. When you have entered all the numbers (as defined by
      the user), the average will be calculated and output to the screen.")))

;;declare variables
(define input 0)
(define realNum 0)

;;display the instructions initially
(help)
(newline)

;;define variables
(define sizeNum 0) ;;holds the number of expected entries from the ueer
(define size 0) ;;holds the conversion of sizeNum from string to number

;;Loop to prompt user for number of inputs
(let loop ((times 1))
  (if (= times 0)
    (newline)
    (begin (display "How many numbers do you intend to enter? ")
    (set! size (read-line))
    (set! sizeNum (string->number size)) ;;convert from string to number
    (if (equal? sizeNum #f) ;;check that the entered value is a number
      (begin (display "That was not a number, please enter a number")
      (newline)
      (loop 1))
      (if (< sizeNum 1) ;;check that the entered value is greater than 0
        (begin (display "The number entered must be greater than 0.")
        (newline)
        (loop 1))
        (loop 0))))))

;;create the vector to hold input from the user
(define array (make-vector sizeNum))

;;loop to prompt user for values to be averaged
(let loop ((times sizeNum))
  (if (= times 0)
    (display "Calculating average...")
    (begin (display "Please input a number: ")
    (set! input (read-line))
    (set! realNum (string->number input)) ;;convert from string to number
    (vector-set! array (- times 1) realNum)
      (if (equal? realNum #f) ;;check that the value entered is a number
      (begin (display "That was not a number, please enter a number")
      (newline)
      (loop times))
      (loop (- times 1))))))

;;define variables for total and average
(define total 0)
(define average 0)

;;find the sum of the contents of the vector containing the user's inputs
(let loop ((times sizeNum))
  (if (= times 0)
    (display "The average is: ")
    (begin (newline)
    (set! total (+ total (vector-ref array (- times 1))))
      (loop (- times 1)))))

;;calculate the average
(set! average (/ total sizeNum))

;;output average to console
(display average)
