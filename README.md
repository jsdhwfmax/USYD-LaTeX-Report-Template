# USYD Postgraduate Coursework Report Template

A professional, clean, and easy-to-use LaTeX template tailored for postgraduate coursework reports, assignments, and group projects at **The University of Sydney (USYD)**.

Unlike many legacy templates, this project has been fully optimized to run natively on **pdfLaTeX**. It strips away bloated font configurations and deprecated packages, providing a lightning-fast, error-free compilation experience right out of the box.

## ✨ Features

* **Native pdfLaTeX Support:** No need to configure XeLaTeX or external system fonts.
* **Standardized Title Page:** Pre-formatted cover page with fields for Student ID, Course Code, Tutorial, and Group information.
* **Statement of Originality:** Built-in, formally worded academic integrity declaration.
* **Clean Architecture:** All formatting complexities are hidden within `USYDReport.cls`.
* **Automated Formatting:** Pre-configured Table of Contents, referencing, and spacing.

## Quick Start (Overleaf)

The easiest way to use this template is through Overleaf.

1. Download this repository as a `.zip` file.
2. Go to [Overleaf](https://www.overleaf.com/) and click **New Project** -> **Upload Project**.
3. Upload the `.zip` file.
4. Ensure your compiler is set to **pdfLaTeX** (Menu -> Settings -> Compiler).
5. Open `main.tex` and click **Recompile**.

## Configuration

Open `main.tex` to fill in your personal and assignment details. Locate the configuration block at the top of the file and replace the placeholder text:

    \title{Your Report Title Goes Here} 
    \author{Firstname Lastname}         
    \stunum{123456789}                  
    \coursecode{IDEA9106}               
    \tutorial{Tutorial 26}        
    \groupnum{Group X}      
    \tutor{Your Tutor's Name}           

## Advanced: Adding the USYD Logo

By default, the template uses a clean text-based header ("The University of Sydney") on the title page. If you wish to make your report look more official by adding the university logo, follow these steps:

1. **Obtain the Logo:** Find a high-quality, transparent PNG of the USYD logo.
2. **Upload:** Rename the file to `logo.png` and upload it to the root directory of your Overleaf project.
3. **Modify the Class File:** Open `USYDReport.cls` and scroll down to the `\renewcommand{\maketitle}` section (around line 160).
4. **Replace the Code:** Find this line:
   
    {\sanhao \bfseries The University of Sydney}\\
   
   Replace it with the following code snippet:
   
    \vspace*{-20pt} % Adjust top spacing if necessary
    \includegraphics[width=0.6\textwidth]{logo.png}\\
   
5. **Recompile:** Your title page will now feature the official logo. You can adjust the `0.6\textwidth` value to make the logo larger or smaller.

## Repository Structure

* `main.tex`: Your primary working file. Write your content here.
* `USYDReport.cls`: The core class file containing all styling and formatting rules. (Do not edit unless you are customizing the template).
* `Bibs/`: A directory to store your `.bib` reference files.
    * `mybib.bib`: The default bibliography database.

## License

This template is open-source and available under the MIT License. Feel free to fork, modify, and distribute it for your academic needs.