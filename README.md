HistThresh toolbox
==================

The HistThresh Toolbox contains selected histogram-based thresholding
algorithms for Matlab. The toolbox was originally developed with
Matlab 6.5 (R13).

GETTING STARTED
---------------

The thresholding algorithms are named with the prefix "th_". For
example, "th_minimum.m" is the function for the algorithm by Prewitt
and Mendelsohn that chooses the threshold to be in the valley of a
bimodal histogram. The threshold for an 8-bit image can be found by
typing "T = th_minimum(I)". Further help can be obtained by typing
"help <m-file>" in Matlab, where "<m-file>" is replaced by the name of
an m-file.

History
-------

This Matlab toolbox was originally authored by Antti Niemistö who
released it under GPLv2+ during his PhD at Tampere University of
Technology, Finland.

It has been ported to ImageJ 1.X by Gabriel Landini, partially picked
up by Wayne Rasband, and based on Gabriel's port, Barry DeZonia
[ported](http://imagej.net/pipermail/imagej-devel/2013-February/001404.html)
it to ImageJ 2 (under the 2-clause BSD license).

There is also an Octave port, as optional argument to `graythresh()`
in the image package, prepared by Carnë Draug.
