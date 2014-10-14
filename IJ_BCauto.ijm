 /*
 ImageJ Automatic Brightness & Contrast Enhancement in ImageJ macro
  
 "Auto" button in the brightness and contrast interface and the contrast enhancement provided in the menu as "Process > Enhance Contrast" use different algorithms. This macro mimics the algorithm used for the former enhancement. 

See the link below:
http://imagej.1557.x6.nabble.com/Auto-Brightness-Contrast-and-setMinAndMax-td4968628.html

May 16th, 2012 Version 1.0
Author: Kota Miura & Damien Guimond
Contact: miura@embl.de
Lisence: GNU General Public License, version 2
http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
 */
 
 
 AUTO_THRESHOLD = 5000; 
 getRawStatistics(pixcount); 
 limit = pixcount/10; 
 threshold = pixcount/AUTO_THRESHOLD; 
 nBins = 256; 
 getHistogram(values, histA, nBins); 
 i = -1; 
 found = false; 
 do { 
	counts = histA[++i]; 
	if (counts > limit) counts = 0; 
	found = counts > threshold; 
 } while ((!found) && (i < histA.length-1)) 
 hmin = values[i]; 

 i = histA.length; 
 do { 
	counts = histA[--i]; 
	if (counts > limit) counts = 0; 
	found = counts > threshold; 
 } while ((!found) && (i > 0)) 
 hmax = values[i]; 

 setMinAndMax(hmin, hmax); 
 //print(hmin, hmax); 
 run("Apply LUT"); 
