# UniversalProductCode

The Universal Product Code (UPC) is used to track unique products in stores and is used in
many countries around the word. You have likely seen UPCs represented as barcodes.
There are many features and types of UPCs, but we will focus on the UPC-A code and its check
digit. If you’re interested in learning more: https://en.wikipedia.org/wiki/Universal_Product_Code

In a UPC-A code the first 11 digits are used to calculate the 12th digit. The 12th digit is called the
check digit. The check digit is used to verify that the code is correct.
The expression to verify the check digit is:
( 3d1 + d2 + 3d3 + d4 + 3d5 + d6 + 3d7 +d8 + 3d9 + d10 + 3d11 + d12) mod 10 == 0
where di is the i-th digit from the left, including any leading zeros.
For example, if the UPC-A code is 024543167150, then:
( 3*0 + 2 + 3*4 + 5 + 3*4 + 3 + 3*1 + 6 + 3*7 + 1 + 3*5 + 0 ) mod 10
= 80 mod 10
= 0
Therefore, this UPC-A code is valid.

Use this program to check if your UPC-A code is valid, to create a new UPC-A code.

To run the programming you need to have processing installed in your computer. Run UniversalProductCode.pde in your computer. 