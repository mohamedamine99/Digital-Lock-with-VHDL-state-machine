# Digital-Lock-with-VHDL-state-machine

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>  
    <li><a href="#how-it-works">How it works</a></li> 
    <li><a href="#software-requirements">Software Requirements</a></li>      
    <li><a href="#software-implementation">Software implementation</a></li>
      <ul>
        <li><a href="#behavioral-module">Behavioral module</a></li>
        <li><a href="#testbench">Testbench</a></li>  
      </ul>
    <li><a href="#results">Results</a></li>
    <li><a href="#conclusion">Conclusion</a></li>
    <li><a href="#contact">Contact</a></li>
       
  </ol>
</details>


## About the project

This project is about creating a VHDL module and a test bench for a digital lock with state machine.
The lock's features include :  
* Password verification
* Password modification
* Alarm system

## How it works:
-The Lock Code is a 4-digit number  
-The user enters a combination on the keyboard of the device and presses the "Validate" key  
* If the code entered is true the lock will wait until the user releases the "Validate" button to open.
        * The lock remains open for a few seconds before closing automatically
        * If the code is not the one registered, the lock will not open.
        * If the code is entered 3 times and is wrong then an alarm signal goes off and does not stop until a true code is entered
  * The user has the possibility to change his password:  
    * He presses the “conf” button then must enter the previous code correctly then presses the validate button.
    * If the code entered is correct, the user then enters the new code and presses the validate button to confirm. So the code is changed
 ### the keypad:
 
![image](https://user-images.githubusercontent.com/86969450/136088391-8bf5b69a-6752-4e1e-96b8-43fc8b2b5da5.png)
  

 * Each button is represented by a code of two vectors of 4 bits. the vectors represent the row and column of each button.

## Software Requirements:

Xilinx ISE suite 14.7 (or higher)


## Software implementation:
### Behavioral module: 
* You can find the well commented behavioral module [here](https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/src/main%20.vhd)
### Testbench: 
* You can find the Testbench [here](https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/src/testbench%20.vhd)

## Results:
Now let's check our simulation results:

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-0.PNG">
</p>

let's go to the explanation : 

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-1.PNG">
</p>
The user pushed the configuration button to enter the password configuration mode .  

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-2.PNG">
</p>
Now the user types the previous password , for security check, by pushing consecutively 4 buttons on the keyPad .

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-3.PNG">
</p>
Now the user Presses the validate button to confirm the password .


<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-5.PNG">
</p>

All is set now the user types the new password then he confirms by pushing the validate button.

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20config%20-6.PNG">
</p>

Now we test our new password to check whether it changed successfully or not .


<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%201st%20test.PNG">
</p>

password is correct ! All is in order, The door opens and remains so , for some 13 seconds. 

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%202st%20test.PNG">
</p>
Now let's type a wrong password : nothing happens and the door remains closed.


<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%202st%20test%20-1.PNG">
</p>
Now let's type a wrong password for the 2nd time : nothing happens and the door remains closed.

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%202st%20test%20-2.PNG">
</p>
Now let's type a wrong password for the 3rd time.

<p align="center">
  <img src="https://github.com/mohamedamine99/Digital-Lock-with-VHDL-state-machine/blob/main/vhdl%20digital%20lock%20results/result%202st%20test%20-3.PNG">
</p>
After the 3rd unsuccessfull attempt at typing the correct password , an alarm is triggered and keeps working until the correct password is entered and doors reopens for 13 seconds

  ## Conclusion:
In this project, we successfullty implemented a VHDL solution for digital Lock with proper functionning and multiple features including : password modification and an alarm system, using a  state machine algorithm . This solution can further implemented on a hardware level.
  
  ### Contact:
* Mail : mohamedamine.benabdeljelil@insat.u-carthage.tn -- mohamedaminebenjalil@yahoo.fr
* Linked-in profile: https://www.linkedin.com/in/mohamed-amine-ben-abdeljelil-86a41a1a9/
