ott - Optical Tweezers Toolbox
==============================

The optical tweezers toolbox can be used to calculate optical forces
and torques of particles using the T-matrix formalism in a vector
spherical wave basis.
The toolbox includes codes for calculating T-matrices, beams described
by vector spherical wave functions, functions for calculating forces
and torques, and examples.

Installation
------------

To use the toolbox, download or clone the GitHub repository.
You will also need a modern version of MATLAB, we recommend
updating to at least 2018a.
This version of the toolbox is released as a package, `+ott`, which
contains a collection of functions for calculating T-matrices, beam
coefficients, force and torques.
To use the functions in your code, the easiest way is to add the
directory containing the package to your path and importing the package,

```matlab
addpath('<download-path>/ott');
import ott.*
```

if you regularly use the toolbox you might want to add the command to
your [startup.m](https://au.mathworks.com/help/matlab/ref/startup.html?searchHighlight=startup.m) file.
You might also want to add the examples to your path

```matlab
addpath('<download-path>/ott/examples');
```

Getting started
---------------

The toolbox has changed a lot since previous releases.
To get started, it is probably easiest to take a look at the
examples, run and modify them.

The examples calculate the force and torque efficiencies. These are
  the force and torque per photon, in photon units. To convert to
  SI units:
              force_SI = force_Q * n * P/c
             torque_SI = torque_Q * P/w
  where n is the refractive index of the surrounding medium,
        P is the beam power in watts,
        c is the speed of light in free space,
        w is the angular optical frequency, in radians/s.

To understand how the toolbox calculates optical forces and torques,
take a look at the guide to version 1.2 of the toolbox and the
optical tweezers computational toolbox paper (pre-print).
Both are available on our
[website](https://people.smp.uq.edu.au/TimoNieminen/software.html).

T-matrices are represented by `Tmatrix` objects.  For simple shapes,
the `Tmatrix.simple` method can be used to construct T-matrices for
a variety of common objects.
More complex T-matrices can be generated by inheriting the T-matrix
class, for an example, take a look at TmatrixMie and TmatrixPm.

Beams are represented by a `Bsc` objects.  A beam can be multiplied
by T-matrices or other matrix/scalar values to generate new beams.
For Gaussian type beams, including Hermite-Gauss, Ince-Gauss, and
Laguarre-Gaussian beams, the `BscPmGauss` class provides the
equivalent of `bsc_pointmatch_farfield` in the previous release.

The new implementation hides `Nmax`, most routines have a default
choice of `Nmax` based on the beam/particle size.  `Nmax` can still
be accessed and changed manually, but in most cases the automatic
choice of `Nmax` should be fine.
Beams can T-matrices can be multiplied without needing to
worry about the having equal `Nmax`, the beam/T-matrix will be
expanded to match the maximum `Nmax`.
If repeated calculations are being done, it may be faster to first
ensure the `Nmax` of the beam and T-matrix match, this is done in
`forcetorque` when the position or rotation arguments are used.

Upcoming release
----------------

* Version 2 will introduces a focus on simulating particles in
  optical traps rather than just focussing on calculating optical
  forces and torques.  The plan is also to introduce geometric
  optics, Rayleigh particles, and arbitrary T-matrix particles
  calculated using DDA.  The toolbox will be more automated and
  include a graphical user interface.

Licence
-------

The package and its components may be used free-of-charge for research,
teaching, or personal use. If results obtained using the package are
published, the package should be appropriately referenced.
For full details see LICENSE.md.
For use outside the conditions of the license, please contact us.

The package can be refereced by citing the paper describing version
1 of the toolbox

> T. A. Nieminen, V. L. Y. Loke, A. B. Stilgoe, G. Knöner, A. M. Branczyk, N. R. Heckenberg, and H. Rubinsztein-Dunlop,
> "Optical tweezers computational toolbox",
> [Journal of Optics A 9, S196-S203 (2007)](http://iopscience.iop.org/1464-4258/9/8/S12/)

or by directly citing the toolbox

> T. A. Nieminen, V. L. Y. Loke, A. B. Stilgoe, I. C. D. Lenton,
> Y. Hu, G. Knöner, A. M. Branczyk, N. R. Heckenberg, and H. Rubinsztein-Dunlop,
> "Optical tweezers toolbox", https://github.com/ilent2/ott

and the respective Bibtex entry

```latex
@misc{Nieminen2018,
  author = {Nieminen, Timo A. and Loke, Vincent L. Y. and Stilgoe, Alexander B. and Lenton, Isaac C. D. and Kn{\ifmmode\ddot{o}\else\"{o}\fi}ner, Gregor and Bra{\ifmmode\acute{n}\else\'{n}\fi}czyk, Agata M. and Heckenberg, Norman R. and Rubinsztein-Dunlop, Halina},
  title = {Optical Tweezers Toolbox},
  year = {2018},
  publisher = {GitHub},
  journal = {GitHub repository},
  howpublished = {\url{https://github.com/ilent2/ott}},
  commit = {Optional, a specific commit}
}
```

Contact us
----------

The best person to contact for inquiries about the toolbox or lincensing
is [Timo Nieminen](mailto:timo@physics.uq.edu.au)

Further Reading
---------------

Papers describing the toolbox

* T. A. Nieminen, V. L. Y. Loke, A. B. Stilgoe, G. Knoener,
A. M. Branczyk, N. R. Heckenberg, H. Rubinsztein-Dunlop,
"Optical tweezers computational toolbox",
Journal of Optics A 9, S196-S203 (2007)

* T. A. Nieminen, V. L. Y. Loke, G. Knoener, A. M. Branczyk,
"Toolbox for calculation of optical forces and torques",
PIERS Online 3(3), 338-342 (2007)


More about computational modelling of optical tweezers:

* T. A. Nieminen, N. R. Heckenberg, H. Rubinsztein-Dunlop,
"Computational modelling of optical tweezers",
Proc. SPIE 5514, 514-523 (2004)


More about our beam multipole expansion algorithm:

* T. A. Nieminen, H. Rubinsztein-Dunlop, N. R. Heckenberg,
"Multipole expansion of strongly focussed laser beams",
Journal of Quantitative Spectroscopy and Radiative Transfer 79-80,
1005-1017 (2003)

More about our T-matrix algorithm:

* T. A. Nieminen, H. Rubinsztein-Dunlop, N. R. Heckenberg,
"Calculation of the T-matrix: general considerations and
application of the point-matching method",
Journal of Quantitative Spectroscopy and Radiative Transfer 79-80,
1019-1029 (2003)

The multipole rotation matrix algorithm we used:

* C. H. Choi, J. Ivanic, M. S. Gordon, K. Ruedenberg,
"Rapid and stable determination of rotation matrices between
spherical harmonics by direct recursion"
Journal of Chemical Physics 111, 8825-8831 (1999)


The multipole translation algorithm we used:

* G. Videen,
"Light scattering from a sphere near a plane interface",
pp 81-96 in:
F. Moreno and F. Gonzalez (eds),
Light Scattering from Microstructures, LNP 534,
Springer-Verlag, Berlin, 2000


More on optical trapping landscapes:

* A. B. Stilgoe, T. A. Nieminen, G. Knoener, N. R. Heckenberg, H. 
Rubinsztein-Dunlop, "The effect of Mie resonances on trapping in 
optical tweezers", Optics Express, 15039-15051 (2008)

Multi-layer sphere algorithm:

* W. Yang, "Improved recursive algorithm for light scattering by a
 multilayered sphere", Applied Optics 42(9), (2003)

