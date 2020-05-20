- [code analysis reports](#code-analysis-reports)

# ITHITOOLS

The ITHITOOLS program include a set of tools designed to compute some of
"Identifier Technology Health Indicators" (ITHI) metrics defined by ICANN.
The identifiers include Names, Numbers, and Protocol Parameters.
A general presentation of the ITHI work is available here: https://www.icann.org/ithi.
The capture part of the tools are focused on a subset of the ITHI problem, 
specifically the computation of the IHTI metrics M3, M4 and M6:

* overhead in root traffic (M3.1, and M3.2 for duplicate requests contained in single PCAP file)
* leakage of RFC6761 names and other undelegated names (M4)
* usage of DNS protocol parameters defined in IANA registries (M6) plus list of unregistered parameters and frequencies.

The metric part of the tools reads data from the ITHI input folders, and produces the
ITHI metrics.

# Usage

The project builds a single executable, "ithitools.exe", which can be used in two modes:

* analysis of a single PCAP file to produce a summary file (CSV format) containing the counts of
  interesting parameter found in the file.

* aggregation of several summary files and extraction of supported metrics.

Calling ithitools with the option "-h" will produce a standard looking "usage"
page. Further documentation is available in DnsProtocolParametersAnalysis.pdf.

On Linux systems, the project also builds a shared library, "ithicap" (libithicap.so). This
library is meant to be used as an extension to "dnscap". A typical usage would be:
~~~
    dnscap <dnscap-parameters> -P libithicap.so -o <ithi-capture-file.csv>
~~~
The "ithicap" capture options can be displayed with the option -h, as in:
~~~
    dnscap <dnscap-parameters> -P libithicap.so -h
~~~ 
More information on configuring dnscap and the ithicap plugin can be found on
the [DBS capture settings wiki page](https://github.com/private-octopus/ithitools/wiki/Capture-of-DNS-statistics-using-dnscap-and-ithicap).

# Building ITHITOOLS

ITHITOOLS was developed in C++, and can be built under Windows or Linux.

## ITHITOOLS on Windows

To build ITHITOOLS on Windows, you need to:

 * Have a version of Visual Studio 2017 installed. The freely available
   "Community" version will work.

 * Clone and compile ITHITOOLS, using the Visual Studio 2017 solution 
   ithitoolsvs.sln included in the sources.

 * You can use the unit tests included in the Visual Studio solution to 
   verify the port.

## ITHITOOLS on Linux

To build ITHITOOLS on Linux, you need to:

 * Clone and compile ITHITOOLS:
~~~
   git clone https://github.com/private-octopus/ithitools/
   cd ithitools
   cmake .
   make
~~~
 * Run the test program "ithitest" to verify the port.

Of course, if you want to just update to the latest release, you don't need to install
again. You will do something like:
~~~
   cd ithitools
   git pull --all
   cmake .
   make
~~~


### Build dependencies on Linux

Building ITHITOOLS on Linux requires installation of CMAKE and of a C++ compiler. 
The installation tools depend on the Linux version. We have tested the installation
on Ubuntu (16 and 17) and on Centos (6.9 and 7).

#### Ubuntu
On Ubuntu, the recommended way to install the GCC/C++ compiler is by installing
the "build essentials":
~~~
   sudo apt-get install build-essential
~~~
GIT and CMAKE can of course be installed as:
~~~
   sudo apt-get install cmake
   sudo apt-get install git
~~~

#### Centos
On Centos, you will need the GCC/C++ compiler, CMAKE and git:
~~~
   sudo yum install gcc
   sudo yum install gcc-c++
   sudo yum install cmake
   sudo yum install git
~~~

#### Compiling with CLANG
By default, CMAKE will create a make file that reference the default C/C++
compilers for your system, typically gcc/g++. If you want to use a different
compiler, for example CLANG, you can either change your system's defaults,
or set explicit arguments to CMAKE, such as:
~~~
   cmake -D CMAKE_C_COMPILER="/usr/bin/clang" -D CMAKE_CXX_COMPILER="/usr/bin/clang++" .
~~~
The exact value of the arguments depend of course of where the compilers
are installed.

# Binary downloads

Binary downloads are supported on selected distributions of Linux.

## Linux CentOS and Fedora

Ithitools can be obtained through the [COPR](https://pagure.io/copr/copr) service on CentOS versions 6 and 7,
and on Fedora versions 26, 27, 28 and Rawhide. The process has three steps:

1) Subscribe to the ithitools project:
```
dnf copr enable chuitema/ithitools
```
2) Install ithitools:
```
dnf install ithitools
```
3) Once the package is installed, Linux will occasionally prompt for updates. This
should be automatic, but just in case the command will be:
```
dnf update ithitools
```
On older systems, the "dnf" command is not supported -- use "yum" instead. These are
system commands, so you may need to use "sudo" as appropriate.

## Ubuntu

Ithitools can be obtained through the [Launchpad](https://launchpad.net/) service for recent Ubuntu builds.
The process has two steps:

1) Subscribe to the ithitools project and get it:
```
sudo add-apt-repository ppa:chuitema/ppa
sudo apt-get update
```
2) Install ithitools:
```
sudo apt-get install ithitools
```
3) Updates should arrive as part of the regular updates for Ubuntu packages.

## Other distributions

Sorry, but for the other distributions you will have to clone the sources from Github and compile.

----------------------

# Code analysis reports

- Clang static code analysis reports:
  - [issues found on 2018-12-13 01:57.40](analysis/2018-12-13-015740-6308-1/index.html)
  - [issues found on 2018-12-13 03:48.15](analysis/2018-12-13-034815-6507-1/index.html)
  - [issues found on 2018-12-13 16:52.58](analysis/2018-12-13-165258-6222-1/index.html)
  - [issues found on 2018-12-13 23:09.12](analysis/2018-12-13-230912-6285-1/index.html)
  - [issues found on 2018-12-15 21:57.21](analysis/2018-12-15-215721-6469-1/index.html)
  - [issues found on 2018-12-15 22:15.19](analysis/2018-12-15-221519-6527-1/index.html)
  - [issues found on 2019-02-28 03:12.45](analysis/2019-02-28-031245-6513-1/index.html)
  - [issues found on 2019-06-09 23:03.18](analysis/2019-06-09-230318-6374-1/index.html)
  - [issues found on 2019-06-09 23:08.04](analysis/2019-06-09-230804-6426-1/index.html)
  - [issues found on 2019-06-09 23:11.38](analysis/2019-06-09-231138-6449-1/index.html)
  - [issues found on 2019-06-09 23:32.46](analysis/2019-06-09-233246-6632-1/index.html)
  - [issues found on 2019-06-09 23:44.53](analysis/2019-06-09-234453-6741-1/index.html)
  - [issues found on 2019-06-15 02:19.25](analysis/2019-06-15-021925-5299-1/index.html)
  - [issues found on 2019-06-15 02:45.38](analysis/2019-06-15-024538-5210-1/index.html)
  - [issues found on 2019-06-26 22:56.49](analysis/2019-06-26-225649-4941-1/index.html)
  - [issues found on 2019-06-26 23:13.16](analysis/2019-06-26-231316-5284-1/index.html)
  - [issues found on 2019-08-07 21:52.10](analysis/2019-08-07-215210-5030-1/index.html)
  - [issues found on 2019-08-07 21:58.01](analysis/2019-08-07-215801-5018-1/index.html)
  - [issues found on 2019-08-07 23:03.48](analysis/2019-08-07-230348-5214-1/index.html)
  - [issues found on 2019-08-28 02:52.55](analysis/2019-08-28-025255-5200-1/index.html)
  - [issues found on 2019-08-28 03:15.24](analysis/2019-08-28-031524-4983-1/index.html)
  - [issues found on 2019-08-28 05:50.28](analysis/2019-08-28-055028-5045-1/index.html)
  - [issues found on 2019-08-28 06:28.31](analysis/2019-08-28-062831-5246-1/index.html)
  - [issues found on 2019-08-28 17:12.57](analysis/2019-08-28-171257-5195-1/index.html)
  - [issues found on 2019-08-28 18:16.33](analysis/2019-08-28-181633-5247-1/index.html)
  - [issues found on 2019-08-29 16:10.36](analysis/2019-08-29-161036-5126-1/index.html)
  - [issues found on 2019-08-29 16:29.02](analysis/2019-08-29-162902-5318-1/index.html)
  - [issues found on 2019-08-29 18:19.25](analysis/2019-08-29-181925-4936-1/index.html)
  - [issues found on 2019-08-29 22:06.00](analysis/2019-08-29-220600-5280-1/index.html)
  - [issues found on 2019-08-29 22:21.15](analysis/2019-08-29-222115-5322-1/index.html)
  - [issues found on 2019-09-07 06:19.07](analysis/2019-09-07-061907-5196-1/index.html)
  - [issues found on 2019-09-08 22:09.25](analysis/2019-09-08-220925-5467-1/index.html)
  - [issues found on 2019-11-28 01:27.01](analysis/2019-11-28-012701-5872-1/index.html)
  - [issues found on 2019-11-28 01:44.09](analysis/2019-11-28-014409-5981-1/index.html)
  - [issues found on 2020-05-02 00:07.45](analysis/2020-05-02-000745-6041-1/index.html)
- Code coverage from `ithitest` program:
  - [from branch tld-2-level](coverage/tld-2-level/index.html)
  - [from branch tally-only-if-not-dnscap](coverage/tally-only-if-not-dnscap/index.html)
  - [from branch date-in-metric-line](coverage/date-in-metric-line/index.html)
  - [from branch ingest-m5-6](coverage/ingest-m5-6/index.html)
  - [from branch partner-check](coverage/partner-check/index.html)
  - [from branch tld-update-2020-05-01](coverage/tld-update-2020-05-01/index.html)
  - [from branch explore-dga](coverage/explore-dga/index.html)
  - [from branch export-partner](coverage/export-partner/index.html)
  - [from branch reduce-merge-memory](coverage/reduce-merge-memory/index.html)
  - [from branch fix-enum-bug](coverage/fix-enum-bug/index.html)
  - [from branch explain-links](coverage/explain-links/index.html)
  - [from branch cbor-parse](coverage/cbor-parse/index.html)
  - [from branch cbor-debug-question](coverage/cbor-debug-question/index.html)
  - [from branch detect-anomaly](coverage/detect-anomaly/index.html)
  - [from branch master](coverage/master/index.html)
  - [from branch first-page-v2](coverage/first-page-v2/index.html)
  - [from branch stats-per-tld](coverage/stats-per-tld/index.html)
  - [from branch DirectCapture](coverage/DirectCapture/index.html)
  - [from branch pygraphs](coverage/pygraphs/index.html)
  - [from branch jumbo-column](coverage/jumbo-column/index.html)
  - [from branch fix-m56-definitions](coverage/fix-m56-definitions/index.html)
  - [from branch Revisit-m46](coverage/Revisit-m46/index.html)
  - [from branch addr-names-compress](coverage/addr-names-compress/index.html)
  - [from branch tld-2ld-stats](coverage/tld-2ld-stats/index.html)
  - [from branch centos-v-1-03](coverage/centos-v-1-03/index.html)
  - [from branch Fix-M1-bug](coverage/Fix-M1-bug/index.html)
  - [from branch compact-first](coverage/compact-first/index.html)
  - [from branch fuzz-test-dev](coverage/fuzz-test-dev/index.html)
  - [from branch odp-cron](coverage/odp-cron/index.html)
  - [from branch isolate-privacy](coverage/isolate-privacy/index.html)
  - [from branch separate-a-e-files](coverage/separate-a-e-files/index.html)
  - [from branch cbor-bugs](coverage/cbor-bugs/index.html)
  - [from branch web-site-bugs-2018-09](coverage/web-site-bugs-2018-09/index.html)
  - [from branch design-fixes](coverage/design-fixes/index.html)
  - [from branch load-m3-bare](coverage/load-m3-bare/index.html)
  - [from branch tld-leak-analyse](coverage/tld-leak-analyse/index.html)
  - [from branch fix-tld-report](coverage/fix-tld-report/index.html)
  - [from branch display-cur-ave-min-max](coverage/display-cur-ave-min-max/index.html)
  - [from branch m2-www-bug](coverage/m2-www-bug/index.html)
  - [from branch nb-gtld-in-m2](coverage/nb-gtld-in-m2/index.html)
- [Doxygen documentation (for master branch)](doxygen/index.html)

