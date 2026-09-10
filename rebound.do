texdoc init rebound, replace logdir(log) gropts(optagrs(width=0.8\textwidth))
set linesize 100


/***
\documentclass[11pt]{article}
\usepackage{fullpage}
\usepackage{siunitx}
\usepackage{hyperref,graphicx,booktabs,dcolumn}
\usepackage{natbib}
\usepackage{chngcntr}
\usepackage{pgfplotstable}
\usepackage{pdflscape}
\usepackage{multirow}
\usepackage{booktabs}
\usepackage{stata}
\usepackage{amsmath}
\usepackage{float}
\pgfplotsset{compat=1.18}
\pdfminorversion=6
\usepackage{tikz}
\usetikzlibrary{positioning, arrows.meta}

%% Transition colours by complication type
\definecolor{cMI}{RGB}{200,40,40}
\definecolor{cHF}{RGB}{230,120,0}
\definecolor{cST}{RGB}{30,100,200}
\definecolor{cPD}{RGB}{40,160,80}
\definecolor{cKD}{RGB}{130,60,200}
\definecolor{cDeath}{RGB}{80,80,80}
\definecolor{nodecolor}{RGB}{200,215,230}

\tikzset{
  sn/.style={rectangle, draw=gray!70, thick, text centered, align=center,
    fill=nodecolor, minimum width=1.3cm, minimum height=0.85cm,
    font=\fontsize{5}{6}\selectfont\bfseries, inner sep=2pt},
  ld/.style={rectangle, draw=gray!50, thick, text centered, align=center,
    fill=cDeath!70, text=white, minimum width=1.4cm, minimum height=0.9cm,
    font=\small\bfseries, inner sep=3pt},
  arMI/.style={-{Stealth[length=4pt]}, cMI,    line width=1.2pt},
  arHF/.style={-{Stealth[length=4pt]}, cHF,    line width=1.2pt},
  arST/.style={-{Stealth[length=4pt]}, cST,    line width=1.2pt},
  arPD/.style={-{Stealth[length=4pt]}, cPD,    line width=1.2pt},
  arKD/.style={-{Stealth[length=4pt]}, cKD,    line width=1.2pt},
  arDeath/.style={-{Stealth[length=3pt]}, cDeath, line width=0.35pt, opacity=0.3},
}
\newcommand{\thedate}{\today}
\counterwithin{figure}{section}
\bibliographystyle{unsrt}
\hypersetup{%
    pdfborder = {0 0 0}
}


\begin{document}

\begin{titlepage}
	\begin{flushright}
		\Huge
		\textbf{REBOUND: Readmission Prediction via Hospital Assessment of Risk with Medications}
\color{violet}
\rule{16cm}{2mm} \\ 
\Large
\color{black}
Protocol \\ 
\thedate \\
\color{black}
		\vfill
	\end{flushright}
		\Large
\noindent
Dr Adam Livori \\
Pharmacist and clinician-researcher \\
\color{blue} \href{mailto:adam.livori@gh.org.au}{adam.livori@gh.org.au} \color{black} \\
Grampians Health Pharmacy Department \\
Baker Heart and Diabetes Institute \\~\\

\noindent
Dr Jedidah I. Morton \\
Research Fellow \\
Baker Heart and Diabetes Institute \\~\\

\noindent
Ms Elizabeth Gong \\
Intern pharmacist \\
Grampians Health Pharmacy Department \\~\\

\end{titlepage}

\pagebreak
\tableofcontents
\pagebreak
\listoftables
\listoffigures
\pagebreak

\section{Preface}
Grampians Health is one of 19 participating health services in the Safer Care Victoria (SCV) Safer Medicines at Transitions of Care (SMTC) Collaborative, which aims to reduce 30 and 90-day unplanned readmissions from participating wards/units by improving the management of medicines to empower consumers to safely transition from hospital to home. Part of our work within the project team is to optimise medication management at transitions of care, including but not exclusive to: 
\begin{itemize}
	\item Comprehensive medicines reconciliation 
	\item Advancing handover to next care provider 
	\item Risk screening for readmissions
	\item Empowering and educating patients and their carers 
\end{itemize}

\noindent The rationale behind the SMTC project is reflected in the recent Medication Management at Transitions of Care Stewardship Framework published in 2025.1 A transition of care (TOC) is when all, or part, of an individual's health care is transferred between care providers. This may involve transfer of responsibility for some aspects of a person's health care, or for all their health care. It may be temporary or long term.

Grampians Health have engaged the SMTC with our general medicine units at Ballarat (medical units A, B, C, and D) and Horsham (medical units 1, 2, and 3) from April 2025 through to June 2026. Part of our project involves the implementation of initiatives such as upskilling pharmacy technicians to conduct medication history taking interviews and documentation, and increased provision of medication lists on discharge.
 
In an environment of competing resource and priorities, several health services have begun using prediction tools in order to stratify patients into low, medium, and high risk for readmission, and using follow up telehealth services to ensure medication changes and primary care plans have been actioned. These tools could play a role in providing our medical units with methods to select patients for future follow up services, as well as providing linkage with existing services such as Hospital Admission Risk Programs (HARP), Rapid Access Discharge (RAD) clinics and Grampians Health at Home (GH at Home).

\clearpage
\subsection{The PHarmacie-R risk prediction tool} 
The PHarmacie-R risk prediction tool was specifically designed for use at the bedside in inpatient settings for the prediction of unplanned readmission to hospital \cite{criddle2022}. This tool has a particular focus on polypharmacy (the concurrent use of multiple medications) and high risk medications. The tool was developed in Western Australia at Sir Charles Gardiner public hospital on a training set of 1,201 inpatients. It achieved an internal C-statistic of 0.72 (95\% CI 0.68–0.75) and an independent C-statistic of 0.64 [0.56–0.72] \cite{criddle2022}.

The risk prediction tool uses the following risk factors: 
\begin{itemize}
	\item Number of medications (range 0-20)  
	\item Number of high risk medications (range 0-20) 
	\item Age at assessment (range 18-105) 
	\item Sex at birth (male or female) 
	\item Metropolitan or rural (binary variable) 
	\item Presence of mental health condition or cognitive impairment 
	\item Whether living alone or with others 
	\item Comorbdities (range 0-20) 
	\item Indigenous status or requiring interpreter 
	\item Hospital length of stay greater than 4 days 
	\item ED presentation in the previous 6 months 
\end{itemize}

\noindent These risk factors are incorporated into a risk prediction equation that produces a probability of unplanned readmission at 90 days between 0 and 1. The creators of the PHarmacie-R tool recommend a cut-off of 0.4 as a way of stratifying those at high risk of readmission. This tool was created and validated within a Western Australian metropolitan tertiary health service from 2016. Its potential for use as a stratification tool in other health services, namely regional 
health services, is unknown. 

\clearpage
\subsection{The Northern Health risk prediction tool} 
Northern Health (NH), a large metropolitan health service in Victoria, has also developed a simplified version of the PHarmacieR tool, using the presence of 2 or more risk factors as criteria for referral to outpatient telehealth pharmacy services and a marker for 90-day readmission: 
\begin{itemize}
	\item LOS greater than 5 days
	\item Presence of more than 6 medications at discharge 
	\item More than 1 APINCHI meds (Antimicrobials, intravenous potassium, insulin, narcotics, 
chemotherapy, heparins, immunosuppressants) 
	\item Admission within the last 180 days 
\end{itemize}


\noindent The Northern Health model has not been published in peer reviewed literature, but the method has been shared as part of the SMTC collaborative. 

Validation of prediction models in external datasets is a crucial component to establish predictive accuracy and inform its use in the wider health setting. We seek to describe our population of patients discharged from general medicine and validate the PHarmacieR and NH risk prediction tools for potential use in clinical practice.

\clearpage
\section{Data preparation}
\subsection{Data import and cleaning}
We took discharge data across all general medicine units that was collected as part of an ethics approved study within Grampians Health Ballarat. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

STOP

set rmsg on

cd "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/output/"

clear
import excel "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/Process audit source data.xlsx", sheet(Sheet1) firstrow
br


de

*Reformat date of discharge

gen dod = date(DOD, "MDY")
replace dod = date(DOD, "DMY") if dod == .
count if dod == . //one made in erorr - drop it
drop if dod == .
format dod %td

count if dod  < td(1/4/2025) // 1 error, drop
drop if dod  < td(1/4/2025)
count if dod  > td(8/4/2026) //nice

hist dod, color(black) freq // relatively uniform
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/hist_discharge.pdf", as(pdf) name("Graph") replace


*Get date of birth
gen dob = date(DOB, "MDY")
format dob %td
replace dob = date(DOB, "DMY") if dob == .
count if dob == . // 1 issue, manual check
replace dob = td(28/2/1941) if dob ==.
br

*Reformat date of admission

gen doa = date(Arrival, "MDY")
replace doa = date(Arrival, "DMY") if doa == .
count if doa == . //two made in erorr - drop it
drop if doa == .
format doa %td
br

count if doa  < td(1/4/2025) 
br dod Arrival doa if doa  < td(1/4/2025) //one weird outlier - drop
drop if doa == td(16/5/2015)
count if doa  > td(8/4/2026) // two made in erorr - drop it
drop if doa  > td(8/4/2026)

hist doa, color(black) freq // A bit patchy, but no weird outliers
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/hist_admission.pdf", as(pdf) name("Graph") replace

*Check length of stay

gen los = dod - doa
su los, de 

br URN doa dod los if los < 0 // 53 mismatches, these were reviewed within the health information system directly and not displayed for privacy reasons
sort los


br URN Arrival doa dod los if los > 55 // 57 mismatches, these were reviewed within the health information system directly and not displayed for privacy reasons
gsort -los

*Following re-load and check of datasets
su los, de // Much better, nil issues

*Remove length of stay 1 day or less

drop los
gen los = dod - doa

drop if los <= 1 // leaves 2876 observations

*Check for duplicates

bysort URN dod : gen nghost = _n
ta nghost // 43 duplicates
keep if nghost == 1


*Get sex data
gen sex = 1
replace sex = 2 if Sex == "F"
ta sex Sex // looks good
label define sex 1 "Male" 2 "Female"
label values sex sex 

*Only keep data where 90-day follow up will be avaiable (9/1/26)
keep if dod < td(9/1/2026)

*Keep variables we need
keep URN VisitNumber doa dod los sex dob


save ads_pre, replace

export excel "dob.xlsx", replace

texdoc stlog close

/***
\color{black}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{hist_discharge.pdf}
	\caption{Histogram of discharge dates}
	\label{hist_discharge}
\end{figure}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{hist_admission.pdf}
	\caption{Histogram of admission dates}
	\label{hist_admission}
\end{figure}


\subsection{Sampling of admissions} \label{samplesize}
Due to all auditing of patient-specific details relevant to quantify the PHarmacie-R score, we need to balance incresed power of validation against time of manual auditing. The minimum sample size required for external validation of PHarmacie-R was estimated using the \texttt{pmvalsampsize} module (version 1.0) in Stata (StataCorp, College Station, TX), implementing the framework described by Riley et al. \cite{riley2020}. This approach defines sample size through three simultaneous criteria: (1) adequate precision in the overall calibration ratio (O:E ratio), (2) adequate precision in the calibration slope, and (3) adequate precision in the C-statistic. The minimum sample size is taken as the maximum value across all three criteria.

Given readmission prediction within PHarmacier-R is binary (you either readmit or you don't), a binary model type for sample size prediction was chosen, using the C-statistic from the PHarmacie-R tool paper.


\color{violet}
***/


texdoc stlog, cmdlog nodo

use ads_pre, clear

pmvalsampsize, ///
    type(b)            ///
    cstatistic(0.72)   ///
    csciwidth(0.3)     ///
    prevalence(0.425)  ///
    lpnorm(-0.302 0.82)




texdoc stlog close

/***
\color{black}

\begin{table}[H]
\centering
\caption{Minimum sample size for external validation of the PHarmacie-R model, by precision criterion (\texttt{pmvalsampsize} output \cite{riley2020})}
\label{tab:pmvalsampsize}
\begin{tabular}{lrrrr}
\textbf{Criterion} & \textbf{Sample size} & \textbf{Performance} & \textbf{SE} & \textbf{CI width} \\
\hline
Criterion 1 --- O/E ratio\textsuperscript{(a)} & 521 & 1 & .051 & .2 \\
Criterion 2 --- Calibration slope\textsuperscript{(b)} & 1,535 & 1 & .077 & .3 \\
Criterion 3 --- C statistic\textsuperscript{(c)} & 406 & .72 & .025 & .1 \\
\hline
\textbf{Final sample size} & \textbf{1,535} & \textbf{1} & \textbf{.077} & \textbf{.3} \\
\hline
\multicolumn{5}{l}{\footnotesize Minimum sample size = 1,535, with 653 events (assuming an outcome prevalence = .425).} \\
\multicolumn{5}{l}{\footnotesize \textsuperscript{(a)} Precise estimation of O/E performance in the validation sample.} \\
\multicolumn{5}{l}{\footnotesize \textsuperscript{(b)} Precise estimation of the calibration slope in the validation sample.} \\
\multicolumn{5}{l}{\footnotesize \textsuperscript{(c)} Precise estimation of the C statistic in the validation sample.} \\
\end{tabular}
\end{table}

\color{white} line break \color{black}

\noindent The above calculation suggests that 1535 observations are required in order to appropriately externally validate the predcition model. The UR numbers present are assigned to patients somewhat randomly, and as the histograms in Figures \ref{hist_discharge} and \ref{hist_admission} show, we do have somewhat uniform distribution. Prior to manual auditing, we will take a fraction of total URs randomly across each day to ensure balance of admissions sampled over the follow up period. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pre, clear

* 1. Set seed for reproducibility
set seed 301002

* 2. Generate a random number
gen u = runiform()

* 3. Sort within discharge date by random number
sort dod u

* 4. Count total observations and desired sample size
local N = _N
local n = 1535

* 5. Calculate sampling fraction
local frac = `n' / `N'

* 6. Within each dod, keep proportionally
bysort dod (u): gen keep = _n <= round(_N * `frac')

save ads_total, replace

*Keep non-smapled observations for replacements
preserve
keep if keep != 1
save ads_replacement, replace
restore


* 7. Keep sampled observations
keep if keep == 1

su sex
su los, de

drop u keep

save ads, replace

*Divide into six separate datasets for each of the investigators to audit
use ads, clear


gen split = 1
replace split = 2 if _n >= 258
replace split = 3 if _n >= 516
replace split = 4 if _n >= 774
replace split = 5 if _n >= 1032
replace split = 6 if _n >= 1290

ta split

label define split 1 "CC" 2 "KD" 3 "PH" 4 "AB" 5 "MD" 6 "LG"
label values split split

forval i = 1/6 {
preserve
keep if split == `i'
export delimited "ads_split_`i'.csv", replace
restore
}


texdoc stlog close

/***
\color{black}
\subsubsection{Excluded cases and replacement}
Because our original source data only contained information on admission and discharge dates, it was possible that when audited manually, we would discover the patient actually meets exclusion crtieria:
\begin{enumerate}
	\item Died during admission (not discharged home)
	\item Transferred to other hospital or care facility (not discharged home)
\end{enumerate}

We therefore planned to audit the sample, identify missing cases, and then repeat the sampling procedure with the remaining dataset to determine replacement cases for auditing to make up the 1535 observations.
\color{violet}
***/

texdoc stlog, cmdlog nodo

clear

import delimited record_id site urn dcdate comorb_no mhcog alone med_no apnich_no sex postcode cald edpres admit180 readmit_bin readmit_date readmit_reason rebound_redcap_audit_v_0 using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/syntax/REBOUNDREadmissionPr_DATA_NOHDRS_2026-05-24_2234.csv", varnames(nonames)

label data "REBOUNDREadmissionPr_DATA_NOHDRS_2026-05-24_2234.csv"

label define site_ 1 "Ballarat" 2 "Horsham" 
label define mhcog_ 1 "No" 2 "Yes" 
label define alone_ 1 "No" 2 "Yes" 
label define sex_ 1 "Male" 2 "Female" 
label define cald_ 1 "No" 2 "Yes" 
label define edpres_ 1 "No" 2 "Yes" 
label define admit180_ 1 "No" 2 "Yes" 
label define readmit_bin_ 1 "Yes" 0 "No" 
label define readmit_reason_ 5 "Very likely" 4 "Likely" 3 "Neutral" 2 "Unlikely" 1 "Very unlikely" 
label define rebound_redcap_audit_v_0_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values site site_
label values mhcog mhcog_
label values alone alone_
label values sex sex_
label values cald cald_
label values edpres edpres_
label values admit180 admit180_
label values readmit_bin readmit_bin_
label values readmit_reason readmit_reason_
label values rebound_redcap_audit_v_0 rebound_redcap_audit_v_0_



tostring dcdate, replace
gen _date_ = date(dcdate,"YMD")
drop dcdate
rename _date_ dcdate
format dcdate %dM_d,_CY

tostring readmit_date, replace
gen _date_ = date(readmit_date,"YMD")
drop readmit_date
rename _date_ readmit_date
format readmit_date %dM_d,_CY

label variable record_id "Record ID"
label variable site "Site"
label variable urn "URN"
label variable dcdate "Discharge date"
label variable comorb_no "Number of comorbidities"
label variable mhcog "Presence of mental health condition or cognitive impairment "
label variable alone "Lives alone"
label variable med_no "Number of medications on discharge"
label variable apnich_no "Number of APINCH medications on discharge"
label variable sex "Sex at birth"
label variable postcode "Postcode"
label variable cald "Indigenous status or requiring interpreter"
label variable edpres "ED presentation in the previous 6 months"
label variable admit180 "Admission within the last 6 months"
label variable readmit_bin "Readmitted within 90 days of discharge"
label variable readmit_date "Unplanned readmission date"
label variable readmit_reason "Likelihood readmission related to medication management"
label variable rebound_redcap_audit_v_0 "Complete?"

order record_id site urn dcdate comorb_no mhcog alone med_no apnich_no sex postcode cald edpres admit180 readmit_bin readmit_date readmit_reason rebound_redcap_audit_v_0 

*Check for duplicates
bysort urn dcdate : gen nghost = _n
ta nghost //1034 total 




texdoc stlog close


/***
\color{black}
From the 1,542 episodes were audited, only 1,034 episodes were eligible. In order to ensure we met the required 1,535 episodes, we needed 501 more eligibile episodes. We assumed that the same 'eligibility rate' of 67\% would be present in the remaining dataset, and so therefore to acheive 504, we would need 747 further episodes audit. However, there were only 641 episodes left in the final dataset, and we knew it was unlikely we would meet the full sample size required to meet our initial power calculation. This was a limitation, but we still audited these to get as close as possible to our sample size. 

In the end, it made the sampling code we adopted a redundant step, but it was a good exercise in learning how to transparently sample and ensure the remaining datasets were accessible in the event of replacement case finding.
\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_replacement, clear
drop keep
export delimited "remainder.csv"




texdoc stlog close


/***
\color{black}
\clearpage
\section{Audited data import and cleaning}
\subsection{Data import from source data}
We first imported the excel sheet used as the reference list for auditing. This dataset contains visit numbers and date of birth, and was used to ensure all eligible admissions from the Excel sheet were accounted for. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

clear 
import delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/syntax/sourcelist.csv"

*Check URNs
count if urn == . // All good

*check dob and convert to date
count if dob == "" // All good
rename dob dobs
gen dob = date(dobs, "MDY") //creates 4 bad dob
format dob %td
replace dob = td(29/10/1954) if dobs == "29/10/1954"
replace dob = td(14/02/1933) if dobs == "14/02/1933"
replace dob = td(27/06/1956) if dobs == "27/06/1956"
replace dob = td(28/12/1944) if dobs == "28/12/1944"
count if dob == . // all good
hist dob //nothing werid

*check dod and convert to date
count if dods == "" // All good
drop dod
gen dod = date(dods, "DMY", 2099) //creates 12 bad dod
format dod %td
br dod dods if dod == .
replace dod = td(16/1/2026) if dods == "1/16/2026"
replace dod = td(18/12/2025) if dods == "12/18/2025"
replace dod = td(17/9/2025) if dods == "9/17/2025"
replace dod = td(17/12/2025) if dods == "12/17/2025"
replace dod = td(27/11/2025) if dods == "11/27/2025"
replace dod = td(20/8/2025) if dods == "8/20/2025"
replace dod = td(16/9/2025) if dods == "9/16/2025"
replace dod = td(25/11/2025) if dods == "11/25/2025"
replace dod = td(29/7/2025) if dods == "7/29/2025"
replace dod = td(27/8/2025) if dods == "8/27/2025"
replace dod = td(13/8/2025) if dods == "8/13/2025"
count if dod == .
hist dod // couple of odd DC dates
br if dod > td(1/4/2026)
replace dod = td(10/2/2026) if dods == "02/10/26"
replace dod = td(17/6/2025) if dods == "17/06/26"
hist dod // fixed
br

*check doa and convert to date
count if doa == "" // All good
rename doa doas
gen doa = date(doas, "DMY", 2099) //creates 12 bad dod
format doa %td
count if doa == . // all good
hist doa //all good

*Make a UR and DOD string for matching with REDCap
tostring(dod), gen(dc)
tostring(urn), gen(ur)
gen dcur = dc + ur

*Create dataset
keep urn dod doa dob visitnumber dcur

*double check unique
bysort dcur : gen nghost = _n
ta nghost // multiple dupes
bysort dcur: gen nmax = _N   // total occurrences per dcur value
br if nmax > 1

*check to see if any mismatches
foreach var of varlist dob dod doa {
bysort dcur: gen diff_`var' = (`var' != `var'[1])
count if diff_`var' > 0 //11 mismatching admission dates
}
count if diff_doa == 1 & doa > dod //good no nonsense admissions
keep if nghost == 1
keep urn dod doa dob visitnumber dcur

save source, replace



texdoc stlog close


/***
\color{black}
\subsection{Data import and cleaning}
Using REDCap's import function, we can easily import and label the dataset so it is ready for cleaning. The only step taken prior to the upload was the merging of date of birth across the dataset. 
\color{violet}
***/

texdoc stlog, cmdlog nodo


clear

import delimited record_id redcap_survey_identifier rebound_redcap_audit_v_0 site urn dcdate comorb_no mhcog alone med_no apnich_no sex postcode cald edpres admit180 readmit_bin readmit_date readmit_reason rebound_redcap_audit_v_1 using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/syntax/REBOUNDREadmissionPr_DATA_NOHDRS_2026-06-03_0019.csv", varnames(nonames)

label data "REBOUNDREadmissionPr_DATA_NOHDRS_2026-06-03_0157.csv"

label define site_ 1 "Ballarat" 2 "Horsham" 
label define mhcog_ 1 "No" 2 "Yes" 
label define alone_ 1 "No" 2 "Yes" 
label define sex_ 1 "Male" 2 "Female" 
label define cald_ 1 "No" 2 "Yes" 
label define edpres_ 1 "No" 2 "Yes" 
label define admit180_ 1 "No" 2 "Yes" 
label define readmit_bin_ 1 "Yes" 0 "No" 
label define readmit_reason_ 5 "Very likely" 4 "Likely" 3 "Neutral" 2 "Unlikely" 1 "Very unlikely" 
label define rebound_redcap_audit_v_1_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values site site_
label values mhcog mhcog_
label values alone alone_
label values sex sex_
label values cald cald_
label values edpres edpres_
label values admit180 admit180_
label values readmit_bin readmit_bin_
label values readmit_reason readmit_reason_
label values rebound_redcap_audit_v_1 rebound_redcap_audit_v_1_



tostring dcdate, replace
gen _date_ = date(dcdate,"YMD")
drop dcdate
rename _date_ dcdate
format dcdate %td

tostring readmit_date, replace
gen _date_ = date(readmit_date,"YMD")
drop readmit_date
rename _date_ readmit_date
format readmit_date %td

label variable record_id "Record ID"
label variable redcap_survey_identifier "Survey Identifier"
label variable rebound_redcap_audit_v_0 "Survey Timestamp"
label variable site "Site"
label variable urn "URN"
label variable dcdate "Discharge date"
label variable comorb_no "Number of comorbidities"
label variable mhcog "Presence of mental health condition or cognitive impairment "
label variable alone "Lives alone"
label variable med_no "Number of medications on discharge"
label variable apnich_no "Number of APINCH medications on discharge"
label variable sex "Sex at birth"
label variable postcode "Postcode"
label variable cald "Indigenous status or requiring interpreter"
label variable edpres "ED presentation in the previous 6 months"
label variable admit180 "Admission within the last 6 months"
label variable readmit_bin "Readmitted within 90 days of discharge"
label variable readmit_date "Unplanned readmission date"
label variable readmit_reason "Likelihood readmission related to medication management"
label variable rebound_redcap_audit_v_1 "Complete?"

order record_id redcap_survey_identifier rebound_redcap_audit_v_0 site urn dcdate comorb_no mhcog alone med_no apnich_no sex postcode cald edpres admit180 readmit_bin readmit_date readmit_reason rebound_redcap_audit_v_1 

*Make a UR and DOD string for matching with REDCap
tostring(dcdate), gen(dc)
tostring(urn), gen(ur)
gen dcur = dc + ur
drop dc ur

*double check unique
bysort dcur : gen nghost = _n
ta nghost // multiple dupes
bysort dcur: gen nmax = _N   // total occurrences per dcur value
br if nmax > 1
bysort dcur: gen diff_dcdate = (dcdate != dcdate[1])
count if diff_dcdate == 1 //good these match

*drop dupes after visual inspection
drop if record_id == 625
drop if record_id == 386
drop if record_id == 639
drop if record_id == 372
drop if record_id == 1282
drop if record_id == 475
drop if record_id == 1310
drop if record_id == 1292
drop if record_id == 445
drop if record_id == 528
drop if record_id == 1325
drop if record_id == 564
drop if record_id == 661
drop if record_id == 182
drop if record_id == 391
drop if record_id == 692
drop if record_id == 862
drop if record_id == 509
drop if record_id == 863
drop if record_id == 464
drop if record_id == 687
drop if record_id == 356
drop if record_id == 669
drop if record_id == 749
drop if record_id == 1234
drop if record_id == 150
drop if record_id == 992
drop if record_id == 677
drop if record_id == 72
drop if record_id == 232
drop if record_id == 67
drop if record_id == 1101

drop nghost nmax
bysort dcur : gen nghost = _n
ta nghost // we good, final cample 1426
drop nghost

*Check each variable (summary will come later this is jsut to ensure no nonsense results)

hist dcdate // no issues
hist comorb // no issues
ta mhcog // no issues
ta alone // no issues
hist med_no
su med_no // mean 11.8 (5.7)
hist apnich_no
su apnich_no // mean 1.8 (1.6)
ta sex // no issues
su postcode, de //nothing unusual, a few interstates
ta cald // no issues
ta edpres // no issues
ta admit180 // no issues
ta readmit_bin // no issues
count if readmit_bin == 1 & readmit_date == . // 1 without a date
replace readmit_bin = 0 if readmit_date == .
count if readmit_date < dcdate // 11 issues - will need to check post merge
ta readmit_reason if readmit_date != ., missing // no issues


save redcap, replace


texdoc stlog close


/***
\color{black}
\subsection{Data merge}
We merged the two datasets using the dcur variable created in both sets, this should be a 1:1 merge given we have cleaned the data to ensure unique values representing unique episodes of care.

After merging, we double-checked the readmission dates to ensure the datasets matched, then also calculated age at discharge and length of stay.
\color{violet}
***/

texdoc stlog, cmdlog nodo

use source, clear
rename urn urn_source
merge 1:1 dcur using redcap // 1407 solid matches, 19 unable to be used
keep if _merge == 3
drop _merge


*Check readmissions
br record_id dod doa urn dcdate readmit_date if readmit_date < dcdate // 11 issues
replace readmit_date = td(12/6/2025) if record_id == 1065
replace readmit_date = td(11/9/2025) if record_id == 956
replace readmit_date = td(7/11/2025) if record_id == 1257
replace readmit_date = td(4/12/2025) if record_id == 827
replace readmit_date = td(4/11/2025) if record_id == 846
replace readmit_date = td(29/1/2026) if record_id == 1215
replace readmit_date = td(11/2/2026) if record_id == 1035
replace readmit_date = td(28/1/2026) if record_id == 1150
replace readmit_date = td(9/1/2026) if record_id == 1123
replace readmit_date = td(29/12/2025) if record_id == 201
replace readmit_date = td(21/3/2026) if record_id == 1456

br
count if readmit_date < dcdate // we good

*Check readmissions within 90 days
gen readmit_diff = readmit_date - dcdate if readmit_bin == 1
hist readmit_diff // errors abound
count if readmit_diff > 90 & readmit_bin == 1 // 12 to fix
br record_id dcdate readmit_date urn readmit_diff if readmit_diff > 90 & readmit_bin == 1 
replace readmit_date = td(25/5/2025) if record_id == 594
replace readmit_date = td(5/7/2025) if record_id == 483
replace readmit_date = . if record_id == 120
replace readmit_date = td(5/9/2025) if record_id == 118
replace readmit_date = td(9/12/2025) if record_id == 379
replace readmit_date = td(11/12/2025) if record_id == 717
replace readmit_date = td(24/10/2025) if record_id == 745
replace readmit_date = td(25/11/2025) if record_id == 765
replace readmit_date = td(17/11/2025) if record_id == 969
replace readmit_date = td(4/1/2026) if record_id == 707
replace readmit_date = td(28/1/2026) if record_id == 246
replace readmit_date = . if record_id == 1059

replace readmit_bin = 0 if readmit_date == .

br

*recheck 90 day readmission data
drop readmit_diff
gen readmit_diff = readmit_date - dcdate if readmit_bin == 1
hist readmit_diff // much better
count if readmit_diff > 90 & readmit_bin == 1 // all good

replace readmit_reason = . if readmit_date == .

*get age at discharge
gen age = age(dob,dcdate)
hist age // nothing weird

*gen length of stay
gen los = datediff(doa , dod, "d") 

save ads_rebound_noseifa, replace


texdoc stlog close


/***
\color{black}
\subsection{Merge SEIFA data}
We used ABS data that links postcode with ASGS remoteness measures, and applied it to the dataset. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

*Create postcode and remoteness dataset
clear 
import delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/syntax/CG_POSTCODE_2022_RA_2021.csv"
keep postcode ra_name_2021
drop if postcode == "NA" | postcode == ""
destring(postcode), replace


*double check no dupes
bysort postcode : gen nghost = _n
ta nghost
keep if nghost == 1
drop nghost

save postcode_ra, replace

use ads_rebound_noseifa, clear
merge m:1 postcode using postcode_ra, keep (1 3) //12 not matching, replace as inner regional
replace ra_name_2021 = "Inner Regional Australia" if ra_name_2021 == ""

ta ra_name_2021 // looks good

drop _merge

save ads_rebound, replace

texdoc stlog close


/***
\color{black}
\subsection{Reason for readmission}
The final dataset contains a variable that describes the likelihood that the readmission was due to medication related reasons. This variable is a 5-point ordinal value from very unlikely, unlikely, neutral, likely, and very likely. The REDCAp form triggered this question if a date of readmission was entered, and was filled in by the auditer by reviewing the admission form and best possible medication history of the readmission. This score was then reviewed and vetted by a senior pharmacist. This process was entriely subjective, but done so by clincians experienced in clinical pharmacy and familiar with the health records.  

\clearpage
\section{Result summary tables}
The following syntax rearranges the cleaned data to produce results tables across the cohort by different groupings:
\begin{enumerate}
	\item Total cohort
	\item Cohort that experienced a readmission
	\item Cohort that did not experience a readmission
	\item Readmitted cohort stratified by likelihood of readmission related to medication management
\end{enumerate}

\color{violet}
***/

texdoc stlog, cmdlog nodo


use ads_rebound, clear

**Total cohort**
*Table for categorical variables
gen tahelp = 1
ta tahelp, matcell(a1)
ta sex if sex == 2, matcell(a2)
ta mhcog if mhcog == 2, matcell(a3)
ta alone if alone == 2, matcell(a4)
ta cald if cald == 2, matcell(a5)
ta edpres if edpres == 2, matcell(a6)
ta admit180 if admit180 == 2, matcell(a7)
ta readmit_bin if readmit_bin == 1, matcell(a8)
ta readmit_reason, matcell(a9)
ta ra_name_2021, matcell(a10)

matrix a = (a1\a2\a3\a4\a5\a6\a7\a8\a9\a10)
mat li a
clear 
svmat a

egen total = max(a)
replace total = 525 if _n == 9 | _n == 10 | _n == 11 | _n == 12 | _n == 13
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Female sex" if _n ==2
replace b = "Mental health or cognitive impairment condition" if _n == 3
replace b = "Lives alone" if _n == 4
replace b = "First nations or culturally/linguistically diverse" if _n == 5
replace b = "ED presentation within the last six months" if _n == 6
replace b = "Admission within the last six months" if _n == 7
replace b = "Readmitted within 90 days of discharge" if _n == 8
replace b = "Very unlikely" if _n == 9
replace b = "Unlikely" if _n == 10
replace b = "Neutral" if _n == 11
replace b = "Likely" if _n == 12
replace b = "Very likely" if _n == 13
replace b = "Inner Regional Australia" if _n == 14
replace b = "Major Cities of Australia" if _n == 15
replace b = "Outer Regional Australia" if _n == 16

keep b a
order b a

save tab_cat_all, replace


*Table for continuous variables

use ads_rebound, clear

su comorb, de
return li
mat a = (r(p50),r(p25),r(p75))
su med_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su apnich_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su age, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su readmit_diff, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su los, de
mat a  = (a\(r(p50),r(p25),r(p75)))


mat li a
clear 
svmat a

forval i = 1/3 {
gen  a`i's = string(a`i') 
}
gen a = a1s + " (" + a2s + "-" + a3s + ")"

gen b = ""
replace b = "Median number of comorbidites (IQR)" if _n == 1
replace b = "Median number of medications on discharge (IQR)" if _n == 2
replace b = "Median number of high risk medications on discharge (IQR)" if _n == 3
replace b = "Median age (IQR)" if _n == 4
replace b = "Median time between discharge and readmission (IQR)" if _n == 5
replace b = "Median length of stay (IQR)" if _n == 6


keep b a
order b a

save tab_cont_all, replace

*Bring it all back to you
clear
append using tab_cat_all
append using tab_cont_all
gen id = _n

replace id = 3.5 if id == 14
replace id = 3.6 if id == 15
replace id = 3.7 if id == 16
replace id = 2.1 if id == 20
replace id = 5.1 if id == 3
replace id = 5.2 if id == 22
replace id = 8.1 if id == 23
replace id = 7.1 if id == 17
replace id = 7.2 if id == 18
replace id = 7.3 if id == 19
replace id = 8.1 if id == 21

sort id

gen c = ""

order c b a id

replace c = "Cohort demographics" if _n == 2
replace c = "Medical and medication history" if _n == 11
replace c = "Readmission information" if _n == 16
replace c = "Likelihood readmission related to medication management" if _n == 18


save tab_all, replace

keep c b a

export delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_all.csv", novarnames replace


**For readmitted people only**
use ads_rebound, clear
keep if readmit_bin == 1

**Readmitted cohort**
*Table for categorical variables
gen tahelp = 1
ta tahelp, matcell(a1)
ta sex if sex == 2, matcell(a2)
ta mhcog if mhcog == 2, matcell(a3)
ta alone if alone == 2, matcell(a4)
ta cald if cald == 2, matcell(a5)
ta edpres if edpres == 2, matcell(a6)
ta admit180 if admit180 == 2, matcell(a7)
ta readmit_bin if readmit_bin == 1, matcell(a8)
ta readmit_reason, matcell(a9)
ta ra_name_2021, matcell(a10)

matrix a = (a1\a2\a3\a4\a5\a6\a7\a8\a9\a10)
mat li a
clear 
svmat a

egen total = max(a)
replace total = 525 if _n == 9 | _n == 10 | _n == 11 | _n == 12 | _n == 13
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Female sex" if _n ==2
replace b = "Mental health or cognitive impairment condition" if _n == 3
replace b = "Lives alone" if _n == 4
replace b = "First nations or culturally/linguistically diverse" if _n == 5
replace b = "ED presentation within the last six months" if _n == 6
replace b = "Admission within the last six months" if _n == 7
replace b = "Readmitted within 90 days of discharge" if _n == 8
replace b = "Very unlikely" if _n == 9
replace b = "Unlikely" if _n == 10
replace b = "Neutral" if _n == 11
replace b = "Likely" if _n == 12
replace b = "Very likely" if _n == 13
replace b = "Inner Regional Australia" if _n == 14
replace b = "Major Cities of Australia" if _n == 15
replace b = "Outer Regional Australia" if _n == 16

keep b a
order b a

save tab_cat_readmit, replace


*Table for continuous variables

use ads_rebound, clear
keep if readmit_bin == 1

su comorb, de
return li
mat a = (r(p50),r(p25),r(p75))
su med_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su apnich_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su age, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su readmit_diff, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su los, de
mat a  = (a\(r(p50),r(p25),r(p75)))


mat li a
clear 
svmat a

forval i = 1/3 {
gen  a`i's = string(a`i') 
}
gen a = a1s + " (" + a2s + "-" + a3s + ")"

gen b = ""
replace b = "Median number of comorbidites (IQR)" if _n == 1
replace b = "Median number of medications on discharge (IQR)" if _n == 2
replace b = "Median number of high risk medications on discharge (IQR)" if _n == 3
replace b = "Median age (IQR)" if _n == 4
replace b = "Median time between discharge and readmission (IQR)" if _n == 5
replace b = "Median length of stay (IQR)" if _n == 6


keep b a
order b a

save tab_cont_readmit, replace

*Bring it all back to you
clear
append using tab_cat_readmit
append using tab_cont_readmit
gen id = _n

replace id = 3.5 if id == 14
replace id = 3.6 if id == 15
replace id = 3.7 if id == 16
replace id = 2.1 if id == 20
replace id = 5.1 if id == 3
replace id = 5.2 if id == 22
replace id = 8.1 if id == 23
replace id = 7.1 if id == 17
replace id = 7.2 if id == 18
replace id = 7.3 if id == 19
replace id = 8.1 if id == 21

sort id

gen c = ""


order c b a id

replace c = "Cohort demographics" if _n == 2
replace c = "Medical and medication history" if _n == 11
replace c = "Readmission information" if _n == 16
replace c = "Likelihood readmission related to medication management" if _n == 18

save tab_readmit, replace

keep c b a 
export delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_readmit.csv", novarnames replace


**For non-readmitted people only**
use ads_rebound, clear
keep if readmit_bin == 0


*Table for categorical variables
gen tahelp = 1
ta tahelp, matcell(a1)
ta sex if sex == 2, matcell(a2)
ta mhcog if mhcog == 2, matcell(a3)
ta alone if alone == 2, matcell(a4)
ta cald if cald == 2, matcell(a5)
ta edpres if edpres == 2, matcell(a6)
ta admit180 if admit180 == 2, matcell(a7)
ta readmit_bin if readmit_bin == 1, matcell(a8)
ta readmit_reason, matcell(a9)
ta ra_name_2021, matcell(a10)

matrix a = (a1\a2\a3\a4\a5\a6\a7\a10)
mat li a
clear 
svmat a

egen total = max(a)
replace total = 525 if _n == 9 | _n == 10 | _n == 11 | _n == 12 | _n == 13
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Female sex" if _n ==2
replace b = "Mental health or cognitive impairment condition" if _n == 3
replace b = "Lives alone" if _n == 4
replace b = "First nations or culturally/linguistically diverse" if _n == 5
replace b = "ED presentation within the last six months" if _n == 6
replace b = "Admission within the last six months" if _n == 7
replace b = "Inner Regional Australia" if _n == 8
replace b = "Major Cities of Australia" if _n == 9
replace b = "Outer Regional Australia" if _n == 10

keep b a
order b a

save tab_cat_noreadmit, replace


*Table for continuous variables

use ads_rebound, clear
keep if readmit_bin == 0

su comorb, de
return li
mat a = (r(p50),r(p25),r(p75))
su med_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su apnich_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su age, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su readmit_diff, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su los, de
mat a  = (a\(r(p50),r(p25),r(p75)))


mat li a
clear 
svmat a

forval i = 1/3 {
gen  a`i's = string(a`i') 
}
gen a = a1s + " (" + a2s + "-" + a3s + ")"

gen b = ""
replace b = "Median number of comorbidites (IQR)" if _n == 1
replace b = "Median number of medications on discharge (IQR)" if _n == 2
replace b = "Median number of high risk medications on discharge (IQR)" if _n == 3
replace b = "Median age (IQR)" if _n == 4
replace b = "Median time between discharge and readmission (IQR)" if _n == 5
replace b = "Median length of stay (IQR)" if _n == 6


keep b a
order b a

save tab_cont_noreadmit, replace

*Bring it all back to you
clear
append using tab_cat_noreadmit
append using tab_cont_noreadmit
gen id = _n

replace id = 3.5 if id == 14
replace id = 3.6 if id == 8
replace id = 3.7 if id == 9
replace id = 3.8 if id == 10
replace id = 5.1 if id == 3
replace id = 5.2 if id == 16
drop if _n == 16

sort id

gen c = ""


order c b a id

replace c = "Cohort demographics" if _n == 2
replace c = "Medical and medication history" if _n == 11

save tab_noreadmit, replace

keep c b a 
export delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_noreadmit.csv", novarnames replace


*Merge tables*
use tab_all, clear
rename a a1
merge 1:1 c b using tab_readmit, nogen
rename a a2
merge 1:1 c b using tab_noreadmit

set obs 23
replace id = 0.1 if _n == 23
sort id

replace a1 = "Total cohort" if _n == 1
replace a2 = "Readmitted cohort" if _n == 1
replace a = "Non-readdmited cohort" if _n == 1

keep c b a a1 a2

replace a = "N/A" if a == ""

export delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_merge.csv", novarnames replace

texdoc stlog close


/***
\color{black}

\clearpage
\begin{landscape}
\begin{table}[H]
\footnotesize
\centering
\caption{Baseline characteristics of the study cohort by 90-day readmission status}
\label{tab:baseline_characteristics}
\begin{tabular}{p{0.22\linewidth}p{0.28\linewidth}rrr}
\hline
 & & \textbf{Total cohort} & \textbf{Readmitted cohort} & \textbf{Non-readmitted cohort} \\
\hline
 & Total (n) & 1,407 & 525 & 882 \\
\hline
Cohort demographics & Female sex & 733 (52.1\%) & 284 (54.1\%) & 449 (50.9\%) \\
 & Median age (IQR) & 71 (59--80) & 70 (59--80) & 72 (59--81) \\
 & Inner Regional Australia & 1,353 (96.2\%) & 516 (98.3\%) & 837 (94.9\%) \\
 & Major Cities of Australia & 39 (2.8\%) & 8 (1.5\%) & 31 (5.9\%) \\
 & Outer Regional Australia & 15 (1.1\%) & 1 (0.2\%) & 14 (2.7\%) \\
 & Lives alone & 479 (34.0\%) & 181 (34.5\%) & 298 (33.8\%) \\
 & First nations or culturally/linguistically diverse & 58 (4.1\%) & 25 (4.8\%) & 33 (3.7\%) \\
 & Mental health or cognitive impairment condition & 552 (39.2\%) & 219 (41.7\%) & 333 (37.8\%) \\
 & Median length of stay (IQR) & 4 (2--8) & 4 (2--7) & 4 (2--8) \\
\hline
Medical and medication history & ED presentation within the last six months & 718 (51.0\%) & 364 (69.3\%) & 354 (40.1\%) \\
 & Admission within the last six months & 540 (38.4\%) & 299 (57.0\%) & 241 (27.3\%) \\
 & Median number of comorbidities (IQR) & 6 (4--8) & 6 (4--9) & 5 (3--8) \\
 & Median number of medications on discharge (IQR) & 11 (8--16) & 13 (9--17) & 10 (7--15) \\
 & Median number of high risk medications on discharge (IQR) & 2 (1--3) & 2 (1--3) & 1 (0--2) \\
\hline
Readmission information & Readmitted within 90 days of discharge & 525 (37.3\%) & 525 (100.0\%) & N/A \\
 & Median time between discharge and readmission (IQR) & 20 (8--49) & 20 (8--49) & N/A \\
\hline
Likelihood readmission related to medication management & Very unlikely & 133 (25.3\%) & 133 (25.3\%) & N/A \\
 & Unlikely & 196 (37.3\%) & 196 (37.3\%) & N/A \\
 & Neutral & 83 (15.8\%) & 83 (15.8\%) & N/A \\
 & Likely & 65 (12.4\%) & 65 (12.4\%) & N/A \\
 & Very likely & 48 (9.1\%) & 48 (9.1\%) & N/A \\
\hline
\end{tabular}
\end{table}
\end{landscape}
\clearpage
\normalsize

\color{violet}
***/

texdoc stlog, cmdlog nodo


**Result table stratified by readmissions likelihood being related to medication management**


*Stratified by readmit_reason (values 1-5)

forval ii = 1/5 {

use ads_rebound, clear
keep if readmit_reason == `ii'

**Total cohort**
*Table for categorical variables
gen tahelp = 1
ta tahelp, matcell(a1)
ta sex if sex == 2, matcell(a2)
ta mhcog if mhcog == 2, matcell(a3)
ta alone if alone == 2, matcell(a4)
ta cald if cald == 2, matcell(a5)
ta edpres if edpres == 2, matcell(a6)
ta admit180 if admit180 == 2, matcell(a7)


matrix a = (a1\a2\a3\a4\a5\a6\a7)
mat li a
clear 
svmat a

egen total = max(a)
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Female sex" if _n ==2
replace b = "Mental health or cognitive impairment condition" if _n == 3
replace b = "Lives alone" if _n == 4
replace b = "First nations or culturally/linguistically diverse" if _n == 5
replace b = "ED presentation within the last six months" if _n == 6
replace b = "Admission within the last six months" if _n == 7



keep b a
order b a

save tab_cat_reason_`ii', replace


*Table for continuous variables

use ads_rebound, clear
keep if readmit_reason == `ii'

su comorb, de
return li
mat a = (r(p50),r(p25),r(p75))
su med_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su apnich_no, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su age, de
mat a  = (a\(r(p50),r(p25),r(p75)))
su los, de
mat a  = (a\(r(p50),r(p25),r(p75)))


mat li a
clear 
svmat a

forval i = 1/3 {
gen  a`i's = string(a`i') 
}
gen a = a1s + " (" + a2s + "-" + a3s + ")"

gen b = ""
replace b = "Median number of comorbidites (IQR)" if _n == 1
replace b = "Median number of medications on discharge (IQR)" if _n == 2
replace b = "Median number of high risk medications on discharge (IQR)" if _n == 3
replace b = "Median age (IQR)" if _n == 4
replace b = "Median length of stay (IQR)" if _n == 5


keep b a
order b a

save tab_cont_reason_`ii', replace



*Bring it all back to you

clear
append using tab_cat_reason_`ii'
append using tab_cont_reason_`ii'
gen id = _n

replace id = 2.1 if id == 11
replace id = 2.2 if id == 4
replace id = 2.3 if id == 5
replace id = 2.4 if id == 3
replace id = 2.5 if id == 12 


sort id

gen c = ""

order c b a id

replace c = "Cohort demographics" if _n == 2
replace c = "Medical and medication history" if _n == 8

rename a a`ii'


save tab_all_reason_`ii', replace

}

*N2 together now
use tab_all_reason_1, clear
merge 1:1 c b using tab_all_reason_2, nogen
merge 1:1 c b using tab_all_reason_3, nogen
merge 1:1 c b using tab_all_reason_4, nogen
merge 1:1 c b using tab_all_reason_5, nogen

set obs 13
replace id = 0.1 if _n == 13
replace a1 = "Very unlikely" if _n == 13
replace a2 = "Unlikely" if _n == 13
replace a3 = "Neutral" if _n == 13
replace a4 = "Likely" if _n == 13
replace a5 = "Very likely" if _n == 13

sort id

drop id

export delimited "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_merge_reason.csv", novarnames replace

texdoc stlog close


/***
\color{black}

\clearpage

\begin{landscape}
\begin{table}[H]
\footnotesize
\centering
\caption{Cohort demographics and medical history by likelihood rating\textsuperscript{(a)}}
\label{tab:cohort_likelihood_demographics}
\begin{tabular}{l p{0.28\linewidth} rrrrr}
\hline
& & \textbf{Very unlikely} & \textbf{Unlikely} & \textbf{Neutral} & \textbf{Likely} & \textbf{Very likely} \\
\hline
& \textbf{Total (n)} & 133 & 196 & 83 & 65 & 48 \\
\hline
\multirow{6}{*}{Cohort demographics}
& Female sex & 70 (52.6\%) & 105 (53.6\%) & 48 (57.8\%) & 36 (55.4\%) & 25 (52.1\%) \\
& Median age (IQR) & 72 (56--80) & 70 (61--80.5) & 70 (59--81) & 70 (56--78) & 67 (61.5--84) \\
& Lives alone & 43 (32.3\%) & 69 (35.2\%) & 25 (30.1\%) & 24 (36.9\%) & 20 (41.7\%) \\
& First nations or culturally/linguistically diverse & 3 (2.3\%) & 9 (4.6\%) & 10 (12.0\%) & 2 (3.1\%) & 1 (2.1\%) \\
& Mental health or cognitive impairment condition & 59 (44.4\%) & 80 (40.8\%) & 29 (34.9\%) & 28 (43.1\%) & 23 (47.9\%) \\
& Median length of stay (IQR) & 5 (3--9) & 4 (2--7) & 4 (2--7) & 5 (3--7) & 4 (2--6.5) \\
\hline
\multirow{5}{*}{Medical and medication history}
& ED presentation within the last six months & 85 (63.9\%) & 134 (68.4\%) & 64 (77.1\%) & 41 (63.1\%) & 40 (83.3\%) \\
& Admission within the last six months & 72 (54.1\%) & 113 (57.7\%) & 52 (62.7\%) & 30 (46.2\%) & 32 (66.7\%) \\
& Median number of comorbidities (IQR) & 6 (4--7) & 6 (4--9) & 8 (5--10) & 6 (4--8) & 7.5 (4.5--9) \\
& Median number of medications on discharge (IQR) & 12 (8--17) & 13 (10--17) & 13 (10--18) & 13 (10--17) & 14 (10.5--18) \\
& Median number of high risk medications on discharge (IQR) & 2 (1--3) & 2 (1--3) & 2 (1--3) & 2 (1--3) & 3 (1--4) \\
\hline
\multicolumn{7}{l}{\footnotesize \textsuperscript{(a)} Values are n (\%) unless otherwise indicated.} \\
\end{tabular}
\end{table}
\end{landscape}
\normalsize
\clearpage


\section{Create PharmacieR scores}
The PHarmacie-R equation will be adopted into the dataset to calculate probabilities for each admission:

\[
\text{PHarmacie-R Risk Score} = \frac{e^a}{1 + e^a}
\]

\noindent where $a$ is defined as:

\begin{align*}
a = &-7.065131 \\
    &+ 0.6787006 \times \text{GENDER} \\
    &+ 0.2680293 \times \text{AGE} - 0.004810423 \times \text{AGE}^2 + 0.00002604254 \times \text{AGE}^3 \\
    &+ 0.03076355 \times \text{POLYPHARMACY} \\
    &+ 0.4733076 \times \text{HRM} \\
    &+ 0.5300211 \times \text{LIVESALONE} \\
    &+ 0.2275686 \times \text{RURALREMOTE} \\
    &+ 0.3811697 \times \text{MENTALILLNESS} \\
    &+ 1.030316 \times \text{COMORBIDITIES} \\
    &- 0.2385641 \times \text{INDIGENOUSINTERPRETER} \\
    &+ 0.1958415 \times \text{LENGTHOFSTAY} \\
    &+ 0.8111112 \times \text{READMISSION6MONTHS}
\end{align*}

We created binary tags to match the conditions of the PHarmacie-R equation, and calculating scores for each admission. 

\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_rebound, clear


*create binary tags
gen gender = sex
replace gender = 0 if sex == 2
ta gender sex

gen polypharmacy = 0
replace polypharmacy = 1 if med_no >= 5

gen hrm = 0
replace hrm = 1 if apnich_no >= 1

gen ruralremote = 1
replace ruralremote = 0 if ra_name_2021 == "Major Cities of Australia"

gen livesalone = 0
replace livesalone = 1 if alone == 2
ta livesalone alone

gen mentalillness = 0
replace mentalillness = 1 if mhcog == 2
ta mentalillness mhcog

gen comorbidities = 0
replace comorbidities = 1 if comorb_no >= 3

gen indigenousinterpreter = 0
replace indigenousinterpreter = 1 if cald == 2

gen lengthofstay = 0
replace lengthofstay = 1 if los >= 5

gen readmission6months = 0
replace readmission6months = 1 if edpres == 2 | admit180 == 1


* Generate linear predictor (a)
gen a = -7.065131 ///
    + 0.6787006   * gender ///
    + 0.2680293   * age ///
    - 0.004810423 * age^2 ///
    + 0.00002604254 * age^3 ///
    + 0.03076355  * polypharmacy ///
    + 0.4733076   * hrm ///
    + 0.5300211   * livesalone ///
    + 0.2275686   * ruralremote ///
    + 0.3811697   * mentalillness ///
    + 1.030316    * comorbidities ///
    - 0.2385641   * indigenousinterpreter ///
    + 0.1958415   * lengthofstay ///
    + 0.8111112   * readmission6months

* Generate PHarmacie-R Risk Score
gen pharmacie_r = exp(a) / (1 + exp(a))

label variable pharmacie_r "PHarmacie-R Risk Score"

su pharmacie_r, de

hist pharmacie_r, color(black) freq
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/hist_pharmacie_r.pdf", as(pdf) name("Graph") replace

save ads_pharmacie_r, replace

texdoc stlog close


/***
\color{black}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{hist_pharmacie_r.pdf}
	\caption{Histogram of PHarmacie-R scores calculated across cohort}
	\label{hist_pharmacie_r}
\end{figure}

\noindent The figure shows a left-skewed distribution, with a mean score of 0.54, standard deviation of 0.15, and median of 0.56 with an interquartile range of 0.45 to 0.66. The scores generated were then used to perform validation and recalibration. 

\section{PHarmacie-R equation validation}
\subsection{Data checks}
We opened the dataset and ran some final checks to ensure we had all the data needed in order to perform the validation tests. 

\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pharmacie_r, clear

ta readmit_bin ruralremote //all present


count if readmit_bin == .
count if readmit_bin != 1 & readmit_bin != 0
count if pharmacie_r == .
count if pharmacie_r < 0 & pharmacie_r > 1

tabstat pharmacie_r, by(readmit_bin) stats(n mean sd median min max) col(stats)


texdoc stlog close


/***
\color{black}

\begin{table}[H]
\centering
\caption{Summary statistics of the outcome variable (readmission status)}
\label{tab:readmit_summary}
\begin{tabular}{lrrrrrr}
\hline
\textbf{Readmitted} & \textbf{N} & \textbf{Mean} & \textbf{SD}\textsuperscript{(a)} & \textbf{p50}\textsuperscript{(b)} & \textbf{Min} & \textbf{Max} \\
\hline
No  & 882 & .5333677 & .1535644 & .5496801 & .0869918 & .8630457 \\
Yes & 525 & .5617551 & .1469955 & .5714469 & .1014925 & .8748366 \\
\hline
Total & 1,407 & .54396 & .151717 & .5557131 & .0869918 & .8748366 \\
\hline
\multicolumn{7}{l}{\footnotesize \textsuperscript{(a)} SD = standard deviation} \\
\multicolumn{7}{l}{\footnotesize \textsuperscript{(b)} p50 = median (50th percentile)} \\
\end{tabular}
\end{table}

\noindent In order to undertake the validation, we ran a series of tests:
\begin{enumerate}
	\item Receiver operating curve and Harrell's C-statistic
	\item Youden's index
	\item Calibration plot
\end{enumerate}

\noindent These analyses were performed to comprehensively evaluate the performance
of the PHarmacie-R readmission prediction equation when applied to the Grampians
Health cohort. The following sections detail the rationale for each test and their results. 

\clearpage
\subsection{Receiver operating curve and Harrel's C-statistic}
A Receiver Operating Characteristic (ROC) curve was constructed by plotting sensitivity (true positive rate) against one minus specificity (false positive rate) across all possible probability thresholds. Each point on the curve corresponds to a different threshold at which patients are classified as high or low risk of 90-day readmission. A model with no discriminative ability produces a diagonal line from the lower-left to the upper-right corner (equivalent to random chance), while a perfect model produces a curve that reaches the upper-left corner. The ROC curve provides a visual representation of the trade-off between sensitivity and specificity across the full range of decision thresholds, allowing assessment of model performance independent of any single chosen cutoff.

In addition to the ROC curve, Harrell's C-statistic was also calculated. This measure represents the probably that a randomly selected patient who was readmitted within 90 days received a higher predicted probability than a randomly selected patient who was not readmitted. Values range from 0.5 (no discrimination, equivalent to chance) to 1.0 (perfect discrimination). By convention, a C-statistic of $\geq$0.7 is considered acceptable discrimination, $\geq$0.8 good, and $\geq$0.9 excellent.  The C-statistic is particularly appropriate for external validation as it is insensitive to the prevalence of the outcome and does not depend on selection of a specific probability threshold (which is explored in the next section). A 95\% confidence interval was derived using the binomial method. 

\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pharmacie_r, clear

roctab readmit_bin pharmacie_r, graph summary binomial ///
    title("ROC Curve - PHarmacie-R External Validation")

local area : display %4.2f r(area)
local lb   : display %4.2f r(lb)
local ub   : display %4.2f r(ub)

roctab readmit_bin pharmacie_r, graph summary binomial ///
      note("Harrell's C-statistic `area' [`lb' - `ub']")
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_roc.pdf", as(pdf) name("Graph") replace


texdoc stlog close


/***
\color{black}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{fig_roc.pdf}
	\caption{Receiver Operating Characeteristic Curve with Harrel's C-statistic for PHarmacie-R external validation}
	\label{fig_roc}
\end{figure}

The ROC curve for the PHarmacie-R prediction equation applied to the Grampians Health cohort is presented in Figure \ref{fig_roc}. The curve lies only marginally above the diagonal line of no discrimination across its entire length, indicating limited ability of the model to distinguish between patients who were and were not readmitted within 90 days in this cohort.

Harrell's C-statistic was 0.55 (95\% confidence interval 0.53 to 0.58). This value marginally exceeds the threshold of 0.50 that would be expected by chance alone, but falls substantially below the conventional threshold of 0.70 considered acceptable for clinical prediction models. This represents a clinically meaningful reduction in discriminative performance compared to the C-statistic of 0.72 reported in the original PHarmacie-R development study, suggesting that the predictor variables included in the equation carry less prognostic weight in the Grampians Health population than in the development cohort.

The substantially lower C-statistic observed in the Grampians Health cohort compared to the development study may reflect several factors, including differences in case mix and patient population between the development and validation settings, a narrower distribution of predicted probabilities in the Grampians Health cohort limiting the model's ability to rank patients by risk, and potential differences in how predictor variables or the outcome of 90-day readmission were ascertained across the two settings. 


\subsection{Youden's index and validation metrics}
\subsubsection{Youden's Index}
To identify the optimal probability threshold for binary classification of patients as high or low risk, Youden's index ($J$) was calculated at every observed predicted probability value in the cohort. Youden's index is defined as:

\begin{align*}
    J = \text{Sensitivity} + \text{Specificity} - 1
\end{align*}

\noindent The threshold maximising $J$ represents the point on the ROC curve furthest from the diagonal line of no discrimination, and provides the optimal balance between sensitivity and specificity for the given cohort and outcome
prevalence. In addition to the data-derived Youden's threshold, the cutoff of 0.46 specified by the original PHarmacie-R authors was applied to enable direct comparison with the development study. Performance metrics were calculated at both thresholds.

\subsubsection{Validation metrics}
At each probability threshold (Youden's index and 0.46), patients were classified as high risk (predicted probability $\geq$ threshold) or low risk (predicted probability $<$ threshold) and the following binary classification metrics were calculated from the resulting confusion matrix:

\begin{itemize}
    \item \textbf{Sensitivity} (true positive rate): the proportion of patients who were readmitted within 90 days who were correctly identified as high risk by the model. A higher sensitivity reflects fewer missed readmissions.

    \item \textbf{Specificity} (true negative rate): the proportion of patients who were not readmitted within 90 days who were correctly identified as low risk. A higher specificity reflects fewer unnecessary interventions directed at patients who would not have been readmitted.

    \item \textbf{Positive Predictive Value (PPV)}: the proportion of patients classified as high risk who were actually readmitted within 90 days. PPV is influenced by the prevalence of the outcome in the validation cohort and reflects the clinical yield of acting on a positive screen.

    \item \textbf{Negative Predictive Value (NPV)}: the proportion of patients classified as low risk who were not readmitted within 90 days. NPV reflects the safety of withholding an intervention from patients
          classified as low risk.
\end{itemize}





\color{violet}
***/

texdoc stlog, cmdlog nodo
**#val

use ads_pharmacie_r, clear

roctab readmit_bin pharmacie_r, detail


* The detail option outputs a matrix - we now manually find Youden's cutoff
* using a loop over candidate thresholds

* Loop through thresholds and compute Youden's J 
tempname results
postfile `results' float(cutoff sens spec youden) using youden_results, replace

levelsof pharmacie_r, local(thresholds)

foreach t of local thresholds {
    quietly {
        gen byte pred_t = (pharmacie_r >= `t')

        count if pred_t == 1 & readmit_bin == 1
        local tp = r(N)
        count if pred_t == 0 & readmit_bin == 0
        local tn = r(N)
        count if pred_t == 1 & readmit_bin == 0
        local fp = r(N)
        count if pred_t == 0 & readmit_bin == 1
        local fn = r(N)

        if (`tp' + `fn') > 0 {
            local sens_t = `tp' / (`tp' + `fn')
        }
        else {
            local sens_t = .
        }

        if (`tn' + `fp') > 0 {
            local spec_t = `tn' / (`tn' + `fp')
        }
        else {
            local spec_t = .
        }

        if `sens_t' != . & `spec_t' != . {
            local youden_t = `sens_t' + `spec_t' - 1
        }
        else {
            local youden_t = .
        }

        post `results' (`t') (`sens_t') (`spec_t') (`youden_t')

        drop pred_t
    }
}

postclose `results'

* Load results, find best cutoff, and save full table as CSV
preserve
    use youden_results, clear
    gsort -youden cutoff

    * Store optimal cutoff values in macros for use in later steps
    local youden_cutoff = cutoff[1]
    local youden_j      = youden[1]
    local youden_sens   = sens[1]
    local youden_spec   = spec[1]

    * Save full threshold table as CSV
    export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/youden_threshold_results.csv", replace

restore

use ads_pharmacie_r, clear

local cutoff    = `youden_cutoff'
local label     = "Youden's Index"

gen byte pred_c = (pharmacie_r >= `cutoff')

count if pred_c == 1 & readmit_bin == 1
local tp = r(N)
count if pred_c == 0 & readmit_bin == 0
local tn = r(N)
count if pred_c == 1 & readmit_bin == 0
local fp = r(N)
count if pred_c == 0 & readmit_bin == 1
local fn = r(N)
local n = `tp' + `tn' + `fp' + `fn'

local sens = `tp' / (`tp' + `fn')
local spec = `tn' / (`tn' + `fp')
local ppv  = `tp' / (`tp' + `fp')
local npv  = `tn' / (`tn' + `fn')
local acc  = (`tp' + `tn') / `n'

local z = 1.96
foreach stat in sens spec ppv npv {
    local p     = ``stat''
    local nstat = cond("`stat'"=="sens", `tp'+`fn', ///
                  cond("`stat'"=="spec", `tn'+`fp', ///
                  cond("`stat'"=="ppv",  `tp'+`fp', `tn'+`fn')))
    local denom  = 1 + `z'^2 / `nstat'
    local centre = (`p' + `z'^2 / (2*`nstat')) / `denom'
    local margin = (`z' / `denom') * sqrt(`p'*(1-`p')/`nstat' + `z'^2/(4*`nstat'^2))
    local `stat'_lb = max(0, `centre' - `margin')
    local `stat'_ub = min(1, `centre' + `margin')
}

* Save to matrix
matrix M_youden = J(5, 3, .)
matrix rownames M_youden = Sensitivity Specificity PPV NPV Accuracy
matrix colnames M_youden = Estimate CI_lower CI_upper
matrix M_youden[1,1] = `sens' \ `spec' \ `ppv' \ `npv' \ `acc'
matrix M_youden[1,2] = `sens_lb' \ `spec_lb' \ `ppv_lb' \ `npv_lb' \ .
matrix M_youden[1,3] = `sens_ub' \ `spec_ub' \ `ppv_ub' \ `npv_ub' \ .

* Display and export
matrix list M_youden, format(%6.4f)

drop pred_c


* CUTOFF 2: Original Authors' Cutoff (0.46)


local cutoff    = 0.46
local label     = "Original Authors Cutoff"

gen byte pred_c = (pharmacie_r >= `cutoff')

count if pred_c == 1 & readmit_bin == 1
local tp = r(N)
count if pred_c == 0 & readmit_bin == 0
local tn = r(N)
count if pred_c == 1 & readmit_bin == 0
local fp = r(N)
count if pred_c == 0 & readmit_bin == 1
local fn = r(N)
local n = `tp' + `tn' + `fp' + `fn'

local sens = `tp' / (`tp' + `fn')
local spec = `tn' / (`tn' + `fp')
local ppv  = `tp' / (`tp' + `fp')
local npv  = `tn' / (`tn' + `fn')
local acc  = (`tp' + `tn') / `n'

local z = 1.96
foreach stat in sens spec ppv npv {
    local p     = ``stat''
    local nstat = cond("`stat'"=="sens", `tp'+`fn', ///
                  cond("`stat'"=="spec", `tn'+`fp', ///
                  cond("`stat'"=="ppv",  `tp'+`fp', `tn'+`fn')))
    local denom  = 1 + `z'^2 / `nstat'
    local centre = (`p' + `z'^2 / (2*`nstat')) / `denom'
    local margin = (`z' / `denom') * sqrt(`p'*(1-`p')/`nstat' + `z'^2/(4*`nstat'^2))
    local `stat'_lb = max(0, `centre' - `margin')
    local `stat'_ub = min(1, `centre' + `margin')
}

* Save to matrix
matrix M_046 = J(5, 3, .)
matrix rownames M_046 = Sensitivity Specificity PPV NPV Accuracy
matrix colnames M_046 = Estimate CI_lower CI_upper
matrix M_046[1,1] = `sens' \ `spec' \ `ppv' \ `npv' \ `acc'
matrix M_046[1,2] = `sens_lb' \ `spec_lb' \ `ppv_lb' \ `npv_lb' \ .
matrix M_046[1,3] = `sens_ub' \ `spec_ub' \ `ppv_ub' \ `npv_ub' \ .

* Display and export
matrix list M_046, format(%6.4f)

drop pred_c


*Save data

preserve
    clear

    * Combine both matrices into one, stacked
    matrix M_combined = M_youden \ M_046

    svmat M_combined, names(col)

    gen metric = ""
    replace metric = "Sensitivity" in 1
    replace metric = "Specificity" in 2
    replace metric = "PPV"         in 3
    replace metric = "NPV"         in 4
    replace metric = "Accuracy"    in 5
    replace metric = "Sensitivity" in 6
    replace metric = "Specificity" in 7
    replace metric = "PPV"         in 8
    replace metric = "NPV"         in 9
    replace metric = "Accuracy"    in 10

    gen cutoff_label = ""
    replace cutoff_label = "Youden's Index (`youden_cutoff')"  in 1/5
    replace cutoff_label = "Original Authors' Cutoff (0.46)"   in 6/10

    order cutoff_label metric
    export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/metrics_both_cutoffs.csv", replace
restore



texdoc stlog close


/***
\color{black}
\begin{table}[H]
\centering
\caption{Diagnostic performance of the PHarmacie-R readmission risk tool at the Youden-optimal and original authors' probability thresholds}
\label{tab:pharmacier_cutoff_performance}
\begin{tabular}{lcc}
\hline
\textbf{Metric} & \textbf{Youden-optimal (0.584)} & \textbf{Original authors' (0.46)} \\
\hline
Sensitivity & 0.484 (0.441--0.527) & 0.771 (0.734--0.805) \\
Specificity & 0.603 (0.571--0.635) & 0.283 (0.255--0.314) \\
PPV & 0.421 (0.382--0.460) & 0.391 (0.361--0.421) \\
NPV & 0.663 (0.629--0.694) & 0.676 (0.626--0.721) \\
Accuracy\textsuperscript{(a)} & 0.559 & 0.466 \\
\hline
\multicolumn{3}{l}{\footnotesize \textsuperscript{(a)} 95\% CI not computed for accuracy in the source output.} \\
\multicolumn{3}{l}{\footnotesize Values are point estimate (95\% CI). PPV, positive predictive value; NPV, negative predictive value.} \\
\label{tab_youden}
\end{tabular}
\end{table}

Diagnostic performance metrics at both probability thresholds are presented in Table \ref{tab_youden}. At the Youden-optimal threshold of 0.584, the PHarmacie-R equation demonstrated moderate sensitivity of 0.484 (95\% CI 0.441 to 0.527) and specificity of 0.603 (95\% CI 0.571 to 0.635). This threshold correctly identified approximately half of patients who were subsequently readmitted within 90 days, while correctly classifying approximately three in five patients who were not readmitted as low risk. The PPV of 0.421 (95\% CI 0.382--0.460) indicates that fewer than half of
patients flagged as high risk at this threshold experienced a readmission, reflecting the relatively high background readmission rate in the cohort. The NPV of 0.663 (95\% CI 0.629 to 0.694) indicates that approximately two thirds of patients classified as low risk were not readmitted within 90 days. Overall accuracy at the Youden-optimal threshold was 0.559.

Using the original PHarmacie-R author's threshold of 0.46, a markedly different trade-off between sensitivity and specificity was observed. Sensitivity increased substantially to 0.771 (95\% CI 0.734 to 0.805), meaning that approximately three quarters of patients who were readmitted were correctly identified as high risk. However, this gain in sensitivity came at a considerable cost to specificity, which fell to 0.283 (95\% CI 0.255 to 0.314), indicating that nearly three quarters of patients who were not readmitted were incorrectly classified as high risk. The PPV at this threshold was 0.391 (95\% CI 0.361 to 0.421), and the NPV was 0.676 (95\% CI 0.626 to 0.721). Overall accuracy was 0.466, falling below chance.

The marked difference in performance between the two thresholds reflects the underlying miscalibration of the PHarmacie-R equation in this cohort. The original authors' threshold of 0.46 was derived from a development population with a higher mean predicted probability than the Grampians Health cohort, and consequently classifies the large majority of patients as high risk when applied here, producing high sensitivity but very poor specificity. The Youden-optimal threshold of 0.584 provides a more balanced classification in this cohort, though the modest sensitivity and specificity at this cutoff
are consistent with the overall limited discriminative performance reflected in the C-statistic of 0.55. The reality is that neither threshold achieves a performance profile that would support routine clinical implementation without further recalibration or model refinement. 


\clearpage
\subsection{Calibration plot}
A calibration plot was constructed by plotting the mean observed readmission rate against the mean predicted probability within each decile of predicted risk. A perfectly calibrated model produces points lying on the 45-degree diagonal line of identity. Systematic deviation of points above or below this line indicates consistent underestimation or overestimation of risk respectively, while non-linear patterns suggest that the model discriminates reasonably but the magnitude of predicted probabilities requires adjustment.


\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pharmacie_r, clear

ta ra_name_2021 readmit_reason

* Create decile groups based on predicted probability
xtile decile = pharmacie_r, nq(10)

* Observed and expected counts by decile
preserve
    collapse (sum) observed=readmit_bin ///
             (sum) expected=pharmacie_r ///
             (count) n=readmit_bin, by(decile)

    * Hosmer-Lemeshow chi-square statistic
    gen hl_component = (observed - expected)^2 / (expected * (1 - expected/n))
    
    * Display calibration table
    list decile n expected observed, clean noobs
    
    * Sum to get HL statistic (df = number of groups - 2 = 8)
    quietly summarize hl_component
    local hl_stat = r(sum)
    local hl_df   = 8
    local hl_p    = 1 - chi2(`hl_df', `hl_stat')

    di _n "*** Hosmer-Lemeshow Test (external probability) ***"
    di "  Chi-square: " %6.4f `hl_stat'
    di "  df:         `hl_df'"
    di "  p-value:    " %6.4f `hl_p'

    * Export calibration table
    gen hl_stat_col = `hl_stat'
    gen hl_p_col    = `hl_p'
    export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/calibration_table.csv", replace

restore

* --- Calibration plot ---
preserve
collapse (mean) obs_rate=readmit_bin pred_rate=pharmacie_r (count) n=readmit_bin, by(decile)

twoway (scatter obs_rate pred_rate, msymbol(circle) mcolor(navy)) ///
(line pred_rate pred_rate, sort lcolor(red) lpattern(dash)), ///
xlabel(0(0.1)1) ylabel(0(0.1)1) ///
xtitle("Mean Predicted Probability") ///
ytitle("Observed Event Rate") ///
legend(label(1 "Observed") label(2 "Perfect calibration") position(12) rows(1))
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_cal.pdf", as(pdf) name("Graph") replace
restore

texdoc stlog close



/***
\color{black}

\clearpage

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{fig_cal.pdf}
	\caption{Calibration curve for PHarmacie-R external validation}
	\label{fig_cal}
\end{figure}

The calibration plot reveals systematic and substantial overestimation of readmission risk across all deciles of predicted probability. All ten observed points fall below the line of perfect calibration, indicating that the PHarmacie-R equation consistently predicts higher readmission probabilities than were actually observed in the Grampians Health cohort at every level of predicted risk.

The observed readmission rate appears to plateau across the middle and upper deciles, remaining relatively stable between approximately 0.35 and 0.45 despite the model predicting probabilities ranging from 0.45 to 0.78 across these groups. This suggests that the PHarmacie-R equation overestimates the degree of risk stratification achievable in this cohort, and that high predicted probabilities do not correspond to meaningfully higher observed event rates in the Grampians Health population.

It is evident across multiple tests that the PHarmacie-R is not a viable option for adoption into clinical practice at Grampians Health. We undertook recalibration further on in Section \ref{recalibration}. Prior to this however, we performed another validation on a tool developed by Northern Health to flag patients at high risk for medication related readmission who may benefit from clinical pharmacist outpatient review following discharge. 

\clearpage
\section{Northern Health model validation}
The Northern Health model was not developed to predict a given probability, but instead was based on whether two or more features of medication related risk for readmission were present at discharge. If two more or more criteria were met, the patient was automatically referred for an outpatient follow-up phone call:

\begin{enumerate}
	\item LOS greater than 5 days
	\item Presence of more than 6 medications at discharge
	\item More than 1 APINCHI meds (Antimicrobials, intravenous potassium, insulin, narcotics,
chemotherapy, heparins, immunosuppressants) 
	\item Admission within the last 180 days.
\end{enumerate}

\noindent We loaded the PHarmacie-R dataset used previously and generated Northern Health specific variables to be used in external validation. 

\subsection{Northern Health model result tables}
Similar syntax was used to create results tables similar to the PHarmacie-R tables. 

\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pharmacie_r, clear

gen nhlos = 0 
replace nhlos = 1 if los > 5

gen nhmeds = 0
replace nhmeds = 1 if med_no >= 7

gen nhhrm = 0
replace nhhrm = 1 if apnich_no >= 2

gen nhadm = 0 
replace nhadm = 1 if admit180 == 2

* Check for missing values across all four criteria
count if missing(nhlos) | missing(nhmeds) | missing(nhhrm) | missing(nhadm)

* Check criterion prevalence
tab nhlos
tab nhmeds
tab nhhrm
tab nhadm




**Total cohort**
*Table for categorical variables
gen tahelp = 1
ta tahelp, matcell(a1)
ta nhlos if nhlos == 1, matcell(a2)
ta nhmeds if nhmeds == 1, matcell(a3)
ta nhhrm if nhhrm == 1, matcell(a4)
ta nhadm if nhadm == 1, matcell(a5)

matrix a = (a1\a2\a3\a4\a5)
mat li a
clear 
svmat a

egen total = max(a)
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Length of stay greater that 5 days" if _n ==2
replace b = "At least 7 medications on discharge" if _n == 3
replace b = "At least 2 high risk medications on discharge" if _n == 4
replace b = "Previous admission within the last 180 days" if _n == 5


keep b a
order b a
rename a a1
gen c = _n

save tab_cat_nh_all, replace

**Readmitted cohort**
*Table for categorical variables
use ads_pharmacie_r, clear

gen nhlos = 0 
replace nhlos = 1 if los > 5

gen nhmeds = 0
replace nhmeds = 1 if med_no >= 7

gen nhhrm = 0
replace nhhrm = 1 if apnich_no >= 2

gen nhadm = 0 
replace nhadm = 1 if admit180 == 2


keep if readmit_bin == 1
gen tahelp = 1
ta tahelp, matcell(a1)
ta nhlos if nhlos == 1, matcell(a2)
ta nhmeds if nhmeds == 1, matcell(a3)
ta nhhrm if nhhrm == 1, matcell(a4)
ta nhadm if nhadm == 1, matcell(a5)

matrix a = (a1\a2\a3\a4\a5)
mat li a
clear 
svmat a

egen total = max(a)
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Length of stay greater that 5 days" if _n ==2
replace b = "At least 7 medications on discharge" if _n == 3
replace b = "At least 2 high risk medications on discharge" if _n == 4
replace b = "Previous admission within the last 180 days" if _n == 5


keep b a
order b a
rename a a2

save tab_cat_nh_readmit, replace

**Non-readmitted cohort**
*Table for categorical variables
use ads_pharmacie_r, clear

gen nhlos = 0 
replace nhlos = 1 if los > 5

gen nhmeds = 0
replace nhmeds = 1 if med_no >= 7

gen nhhrm = 0
replace nhhrm = 1 if apnich_no >= 2

gen nhadm = 0 
replace nhadm = 1 if admit180 == 2


keep if readmit_bin == 0
gen tahelp = 1
ta tahelp, matcell(a1)
ta nhlos if nhlos == 1, matcell(a2)
ta nhmeds if nhmeds == 1, matcell(a3)
ta nhhrm if nhhrm == 1, matcell(a4)
ta nhadm if nhadm == 1, matcell(a5)

matrix a = (a1\a2\a3\a4\a5)
mat li a
clear 
svmat a

egen total = max(a)
gen a2 = string((100 * a1 / total), "%3.1f")+"%"
gen a1s = string(a1)
gen a = a1s + " (" + a2 + ")" 
replace a = a1s if _n == 1

gen b = ""
replace b = "Total (n)" if _n == 1
replace b = "Length of stay greater that 5 days" if _n ==2
replace b = "At least 7 medications on discharge" if _n == 3
replace b = "At least 2 high risk medications on discharge" if _n == 4
replace b = "Previous admission within the last 180 days" if _n == 5


keep b a
order b a
rename a a3

save tab_cat_nh_noreadmit, replace


clear
use tab_cat_nh_all, clear
merge 1:1 b using tab_cat_nh_readmit, nogen
merge 1:1 b using tab_cat_nh_noreadmit, nogen
sort c

set obs 6
gen id = _n

replace a1 = "Total cohort" if _n == 6
replace a2 = "Readmitted cohort" if _n == 6
replace a3 = "Non-readmitted cohort" if _n == 6

replace id = 0.1 if _n == 6
sort id

keep b a*

export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/tab_nh.csv", replace


texdoc stlog close



/***
\color{black}

\clearpage
\begin{table}[H]
\centering
\footnotesize
\caption{Baseline characteristics of the total cohort stratified by readmission status}
\label{tab:readmission_characteristics}
\begin{tabular}{lrrr}
\hline
\textbf{Characteristic} & \textbf{Total cohort} & \textbf{Readmitted cohort} & \textbf{Non-readmitted cohort} \\
\hline
Total (n) & 1,407 & 525 & 882 \\
Length of stay $>$5 days & 510 (36.2\%) & 207 (39.4\%) & 303 (34.4\%) \\
$\geq$7 medications on discharge & 1,154 (82.0\%) & 461 (87.8\%) & 693 (78.6\%) \\
$\geq$2 high risk medications on discharge & 732 (52.0\%) & 326 (62.1\%) & 406 (46.0\%) \\
Previous admission within last 180 days & 540 (38.4\%) & 299 (57.0\%) & 241 (27.3\%) \\
\hline
\end{tabular}
\end{table}

\normalsize


\subsection{Northern Health model ROC curve creation}
We used similar syntax for the construction of the ROC curve for PHarmacie-R, however because the output of the Northern Health criteria is binary, rather than a predicted probability, our approach was a little different. There are only three possible threshold values — below 0, at 1, and above 1 — meaning the ROC curve reduces to just three points: the origin (0,0), the single operating point at the threshold of $\geq$2 criteria, and the upper-right corner (1,1). Stata connects these three points, producing a two-segment line rather than a curve. It also worth remembering that the Northern Health tool is not about predicted readmissions, but indirectly stating that meeting the critera warrants pharmacist review to reduce risk of readmission. Given the clinical application of the PHarmacie-R tool is about flagging patients for additional services to reduce readmission, we feel it is fair to have both on the same plot for comparison. 

\color{violet}
***/

texdoc stlog, cmdlog nodo


use ads_pharmacie_r, clear

gen nhlos = 0 
replace nhlos = 1 if los > 5
gen nhmeds = 0
replace nhmeds = 1 if med_no >= 7
gen nhhrm = 0
replace nhhrm = 1 if apnich_no >= 2
gen nhadm = 0 
replace nhadm = 1 if admit180 == 2
gen byte criteria_count = nhlos + nhmeds + nhhrm + nhadm
gen byte criteria_flag  = (criteria_count >= 2) if !missing(criteria_count)

tab criteria_count
tab criteria_flag readmit_bin, row col

* --- C-statistic for PHarmacie-R ---
roctab readmit_bin pharmacie_r, binomial
local area1 : display %4.2f r(area)
local lb1   : display %4.2f r(lb)
local ub1   : display %4.2f r(ub)

* --- C-statistic for NH criteria rule ---
roctab readmit_bin criteria_flag, binomial
local area2 : display %4.2f r(area)
local lb2   : display %4.2f r(lb)
local ub2   : display %4.2f r(ub)

* --- Comparison ROC plot with both C-statistics annotated ---
roccomp readmit_bin pharmacie_r criteria_flag, ///
summary graph ///
legend(order(1 "PHarmacie-R, C = `area1' [`lb1'-`ub1']" ///
2 "NH Criteria Rule, C = `area2' [`lb2'-`ub2']" ///
3 "Reference") ///
rows(1) pos(12) ring(1) region(lstyle(none)) size(small))
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_nhroc.pdf", as(pdf) name("Graph") replace


texdoc stlog close

/***
\color{black}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{fig_nhroc.pdf}
	\caption{ROC curve for PHarmacie-R and Northern Health external validation}
	\label{fig_nhroc}
\end{figure}

The ROC curves for the PHarmacie-R prediction equation and the Northern Health criteria rule, applied to the Grampians Health cohort, are presented in Figure~\ref{fig_nhroc}. As described above, the structural difference between a continuous prediction score and a binary screening rule is reflected in the form of each curve: the PHarmacie-R curve is constructed from sensitivity--specificity pairs across the full range of predicted probability thresholds, producing a continuous curve with many operating points, while the Northern Health criteria rule reduces to a single operating point connected by straight lines to the origin and upper-right corner.

While it appears the Northern Health tool outperformed PHarmacie-R, there is a large degree of overlap of the confidence intervals, and ultimately still falls short of common thresholds of 0.7 as something that should be adopted in practice. Furthermore, as the output of the Northern Health tool is binary, we are unable to perform any kind of recalibration of the model co-efficients or intercepts in the way we can with PHarmacie-R. 

\clearpage
\section{Recalibration} \label{recalibration}
Given the systematic overestimation of 90-day readmission risk identified during external validation, recalibration of the PHarmacie-R equation was performed to improve the agreement between predicted probabilities and observed event rates in the Grampians Health cohort. Recalibration adjusts the predicted probabilities produced by an existing model without altering its underlying predictor variables or requiring development of a new model from scratch \cite{steyerbergvalidation, vancalsterrecal}.

\textbf{Level 1 recalibration}, also known as calibration-in-the-large, adjusts only the intercept of the prediction equation, while constraining the slope to remain at its original value. This is the most conservative form of recalibration and addresses a single source of miscalibration: a systematic offset between the mean predicted probability and the mean observed event rate across the entire cohort. In practice, this is equivalent to asking whether the overall baseline risk implied by the original equation is appropriate for the new population, without questioning whether the relative weighting of individual predictors is correct.

\textbf{Level 2 recalibration} extends Level 1 by additionally re-estimating a single slope coefficient applied to the original linear predictor. Rather than constraining the slope to 1.0, both the intercept $\alpha_2$ and slope $\beta_2$ are estimated from the validation cohort data by fitting a logistic regression model with the original linear predictor $a$ as the sole covariate. This is the most widely recommended approach for external validation studies where the original model's predictor variables and coefficients are known, as it corrects both the overall mean predicted probability and the spread of predictions while preserving the rank ordering of patients and the relative contribution of each predictor variable. 


\textbf{Level 3 recalibration} re-estimates all coefficients of the original prediction equation from the validation cohort data, retaining the same set of predictor variables as the original PHarmacie-R equation but allowing every coefficient, including the intercept, all main effects, and the polynomial terms for age, to take values most consistent with the Grampians Health data. Full recalibration offers the greatest potential for improving calibration in the validation setting, as it allows individual predictor coefficients to reflect the specific prognostic weight each variable carries in the local population. However, it also carries the greatest risk of overfitting, particularly when the validation sample size is insufficient to support stable estimation of all model parameters. The recommended minimum sample size for reliable re-estimation of all coefficients is determined by the number of predictors and the number of outcome events; the Grampians Health cohort of 1,407 patients fell marginally below the recommended sample size of 1,535 estimated earlier in Section \ref{samplesize} for this model

\subsection{Initial recalibration for each level}
\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_pharmacie_r, clear

su age if readmit_bin == 0, de

* LEVEL 1: Intercept-only recalibration (recalibrate-in-the-large)

* Fit logistic model with linear predictor offset (slope fixed at 1)
logit readmit_bin, offset(a)

* New intercept
local intercept_l1 = _b[_cons]

* Generate recalibrated probabilities
gen prob_l1 = invlogit(`intercept_l1' + a)



* LEVEL 2: Intercept + slope recalibration

logit readmit_bin a

local intercept_l2 = _b[_cons]
local slope_l2     = _b[a]

di "Level 2 recalibrated intercept: `intercept_l2'"
di "Level 2 recalibrated slope:     `slope_l2'"

* A slope <1 confirms overfitting/overestimation (predictions too extreme)
* A slope >1 suggests underfitting (predictions too conservative)

* Generate recalibrated probabilities
gen prob_l2 = invlogit(`intercept_l2' + `slope_l2' * a)



* LEVEL 3: Full recalibration (re-estimate all coefficients)

logit readmit_bin gender age c.age#c.age c.age#c.age#c.age ///
    polypharmacy hrm livesalone ruralremote mentalillness ///
    comorbidities indigenousinterpreter lengthofstay readmission6months

* Generate recalibrated probabilities
predict prob_l3, pr



*Plot and compare

foreach level in 1 2 3 {
    preserve
        xtile decile_l`level' = prob_l`level', nq(20)
        collapse (mean) obs_rate=readmit_bin ///
                        pred_rate=prob_l`level' ///
                 (count) n=readmit_bin, by(decile_l`level')
        twoway (scatter obs_rate pred_rate, msymbol(circle) mcolor(navy)) ///
               (line pred_rate pred_rate, lcolor(red) lpattern(dash)), ///
            xlabel(0(0.1)1) ylabel(0(0.1)1) ///
            xtitle("Mean Predicted Probability") ///
            ytitle("Observed Event Rate") ///
            title("Calibration curve - Level `level'") ///
            legend(label(1 "Observed") label(2 "Perfect calibration") position(12) rows(1)) ///
            name(recal`level', replace)

        graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_recal`level'.pdf", as(pdf) name(recal`level') replace
        graph save    "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/output/fig_recal`level'.gph", replace
    restore
}

graph combine ///
fig_recal1.gph ///
fig_recal2.gph ///
fig_recal3.gph, ///
cols(1) rows(3) ///
xsize(5) ysize(11) ///
name(recal_combined, replace)

graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_recal_combined.pdf", as(pdf) name(recal_combined) replace
graph save    "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_recal_combined.gph", replace






foreach prob in pharmacie_r prob_l1 prob_l2 prob_l3 {
    roctab readmit_bin `prob', summary
    di "C-statistic for `prob': " r(area)
}

save ads_recalibrated, replace

texdoc stlog close

/***
\color{black}


\begin{figure} [H]
	\centering
	\includegraphics[width=0.6\textwidth]{fig_recal_combined.pdf}
	\caption{Calibration curve for PHarmacie-R across three levels of recalibration}
	\label{fig_recal}
\end{figure}

Calibration curves for each of the three recalibration levels are presented in Figure \ref{fig_recal}. Each plot was constructed from vigintiles (20 equal groups) of predicted probability, providing finer resolution than the decile-based plot used for the original PHarmacie-R equation. Each point represents the mean predicted probability plotted against the observed 90-day readmission rate within each vigintile group.


Level 1 recalibration produced a partial improvement in calibration relative to the original PHarmacie-R equation. The intercept correction successfully shifted the distribution of predicted probabilities downward, with mean predicted probabilities now ranging from approximately 0.10 to 0.65, compared to the original range of approximately 0.23 to 0.78. However, systematic miscalibration persists across the risk spectrum.

Level 2 recalibration produced a marked and visually striking improvement in calibration. The predicted probabilities are substantially compressed into a narrow range of approximately 0.18 to 0.50, reflecting the shrinkage applied by the re-estimated slope coefficient to bring the spread of predictions into alignment with the observed risk gradient in the Grampians Health cohort. The observed points cluster closely around the line of perfect calibration across the full range of predicted probabilities, with no systematic pattern of overestimation or underestimation apparent in any region of the risk spectrum.

Level 3 recalibration, in which all predictor coefficients were re-estimated from the Grampians Health data, also produced good calibration, with predicted probabilities ranging from approximately 0.17 to 0.52 and observed points lying broadly close to the line of perfect calibration. 


\subsection{Revalidation of Level 2 and 3 recalibration}
\subsubsection{ROC curve and C-statistic}
We used the new calculated probabiltiies for level 2 and 3 recalibration and present their findings below. While we did not reach the recommended power for level 3 recalibration, we continued with revalidation to see the impact this has on ROC. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

**#reval


use ads_recalibrated, clear


*ROC curve and C-statistic
forval i = 2/3 {
roctab readmit_bin pharmacie_r, graph summary binomial ///
    title("ROC Curve - PHarmacie-R External Validation")

local area : display %4.2f r(area)
local lb   : display %4.2f r(lb)
local ub   : display %4.2f r(ub)

roctab readmit_bin prob_l`i', graph summary binomial ///
      note("Harrell's C-statistic `area' [`lb' - `ub']")
graph export "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/fig_rocl`i'.pdf", as(pdf) name("Graph") replace

roccomp readmit_bin pharmacie_r prob_l`i', summary
}

texdoc stlog close


/***
\color{black}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{fig_rocl2.pdf}
	\caption{Receiver Operating Characeteristic Curve with Harrel's C-statistic for recalibrated model 2 validation}
	\label{fig_rocl2}
\end{figure}

\begin{figure} [H]
	\centering
	\includegraphics[width=0.8\textwidth]{fig_rocl3.pdf}
	\caption{Receiver Operating Characeteristic Curve with Harrel's C-statistic for recalibrated model 3 validation}
	\label{fig_rocl2}
\end{figure}


As expected from the theoretical properties of recalibration, the C-statistic of the Level 2 and Level 3 recalibrated models were identical to that of the original PHarmacie-R equation at 0.55 (95\% CI 0.53--0.58), confirmed by formal comparison using \texttt{roccomp} which returned a chi-square statistic of 0.00. Recalibration applies a monotonic transformation to the predicted probabilities, preserving the rank ordering of patients and therefore leaving discrimination unchanged by design.


\subsubsection{Youden's cut-off and validation metrics}
The same process as before for calculation of Youden's cut-off was used and validation metrics calculated at both the optimal and PHarmacie-R reported values. 
\color{violet}
***/

texdoc stlog, cmdlog nodo

use ads_recalibrated, clear


tempname results
postfile `results' float(cutoff sens spec youden) using youden_results, replace

levelsof prob_l2, local(thresholds)

foreach t of local thresholds {
    quietly {
        gen byte pred_t = (prob_l2 >= `t')

        count if pred_t == 1 & readmit_bin == 1
        local tp = r(N)
        count if pred_t == 0 & readmit_bin == 0
        local tn = r(N)
        count if pred_t == 1 & readmit_bin == 0
        local fp = r(N)
        count if pred_t == 0 & readmit_bin == 1
        local fn = r(N)

        if (`tp' + `fn') > 0 {
            local sens_t = `tp' / (`tp' + `fn')
        }
        else {
            local sens_t = .
        }

        if (`tn' + `fp') > 0 {
            local spec_t = `tn' / (`tn' + `fp')
        }
        else {
            local spec_t = .
        }

        if `sens_t' != . & `spec_t' != . {
            local youden_t = `sens_t' + `spec_t' - 1
        }
        else {
            local youden_t = .
        }

        post `results' (`t') (`sens_t') (`spec_t') (`youden_t')

        drop pred_t
    }
}

postclose `results'

* Load results, find best cutoff, and save full table as CSV
preserve
    use youden_results, clear
    gsort -youden cutoff

    * Store optimal cutoff values in macros for use in later steps
    local youden_cutoff = cutoff[1]
    local youden_j      = youden[1]
    local youden_sens   = sens[1]
    local youden_spec   = spec[1]

    * Save full threshold table as CSV
    export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/youden_threshold_resultsl2.csv", replace

restore

use ads_recalibrated, clear

local cutoff    = `youden_cutoff'
local label     = "Youden's Index"

gen byte pred_c = (prob_l2 >= `cutoff')

count if pred_c == 1 & readmit_bin == 1
local tp = r(N)
count if pred_c == 0 & readmit_bin == 0
local tn = r(N)
count if pred_c == 1 & readmit_bin == 0
local fp = r(N)
count if pred_c == 0 & readmit_bin == 1
local fn = r(N)
local n = `tp' + `tn' + `fp' + `fn'

local sens = `tp' / (`tp' + `fn')
local spec = `tn' / (`tn' + `fp')
local ppv  = `tp' / (`tp' + `fp')
local npv  = `tn' / (`tn' + `fn')
local acc  = (`tp' + `tn') / `n'

local z = 1.96
foreach stat in sens spec ppv npv {
    local p     = ``stat''
    local nstat = cond("`stat'"=="sens", `tp'+`fn', ///
                  cond("`stat'"=="spec", `tn'+`fp', ///
                  cond("`stat'"=="ppv",  `tp'+`fp', `tn'+`fn')))
    local denom  = 1 + `z'^2 / `nstat'
    local centre = (`p' + `z'^2 / (2*`nstat')) / `denom'
    local margin = (`z' / `denom') * sqrt(`p'*(1-`p')/`nstat' + `z'^2/(4*`nstat'^2))
    local `stat'_lb = max(0, `centre' - `margin')
    local `stat'_ub = min(1, `centre' + `margin')
}

* Save to matrix
matrix M_youden = J(5, 3, .)
matrix rownames M_youden = Sensitivity Specificity PPV NPV Accuracy
matrix colnames M_youden = Estimate CI_lower CI_upper
matrix M_youden[1,1] = `sens' \ `spec' \ `ppv' \ `npv' \ `acc'
matrix M_youden[1,2] = `sens_lb' \ `spec_lb' \ `ppv_lb' \ `npv_lb' \ .
matrix M_youden[1,3] = `sens_ub' \ `spec_ub' \ `ppv_ub' \ `npv_ub' \ .

* Display and export
matrix list M_youden, format(%6.4f)

drop pred_c


* CUTOFF 2: Original Authors' Cutoff (0.46)


local cutoff    = 0.46
local label     = "Original Authors Cutoff"

gen byte pred_c = (prob_l2 >= `cutoff')

count if pred_c == 1 & readmit_bin == 1
local tp = r(N)
count if pred_c == 0 & readmit_bin == 0
local tn = r(N)
count if pred_c == 1 & readmit_bin == 0
local fp = r(N)
count if pred_c == 0 & readmit_bin == 1
local fn = r(N)
local n = `tp' + `tn' + `fp' + `fn'

local sens = `tp' / (`tp' + `fn')
local spec = `tn' / (`tn' + `fp')
local ppv  = `tp' / (`tp' + `fp')
local npv  = `tn' / (`tn' + `fn')
local acc  = (`tp' + `tn') / `n'

local z = 1.96
foreach stat in sens spec ppv npv {
    local p     = ``stat''
    local nstat = cond("`stat'"=="sens", `tp'+`fn', ///
                  cond("`stat'"=="spec", `tn'+`fp', ///
                  cond("`stat'"=="ppv",  `tp'+`fp', `tn'+`fn')))
    local denom  = 1 + `z'^2 / `nstat'
    local centre = (`p' + `z'^2 / (2*`nstat')) / `denom'
    local margin = (`z' / `denom') * sqrt(`p'*(1-`p')/`nstat' + `z'^2/(4*`nstat'^2))
    local `stat'_lb = max(0, `centre' - `margin')
    local `stat'_ub = min(1, `centre' + `margin')
}

* Save to matrix
matrix M_046 = J(5, 3, .)
matrix rownames M_046 = Sensitivity Specificity PPV NPV Accuracy
matrix colnames M_046 = Estimate CI_lower CI_upper
matrix M_046[1,1] = `sens' \ `spec' \ `ppv' \ `npv' \ `acc'
matrix M_046[1,2] = `sens_lb' \ `spec_lb' \ `ppv_lb' \ `npv_lb' \ .
matrix M_046[1,3] = `sens_ub' \ `spec_ub' \ `ppv_ub' \ `npv_ub' \ .

* Display and export
matrix list M_046, format(%6.4f)

drop pred_c


*Save data

preserve
    clear

    * Combine both matrices into one, stacked
    matrix M_combined = M_youden \ M_046

    svmat M_combined, names(col)

    gen metric = ""
    replace metric = "Sensitivity" in 1
    replace metric = "Specificity" in 2
    replace metric = "PPV"         in 3
    replace metric = "NPV"         in 4
    replace metric = "Accuracy"    in 5
    replace metric = "Sensitivity" in 6
    replace metric = "Specificity" in 7
    replace metric = "PPV"         in 8
    replace metric = "NPV"         in 9
    replace metric = "Accuracy"    in 10

    gen cutoff_label = ""
    replace cutoff_label = "Youden's Index (`youden_cutoff')"  in 1/5
    replace cutoff_label = "Original Authors' Cutoff (0.46)"   in 6/10

    order cutoff_label metric
    export delimited using "/home/teletraan1/Dropbox/~ADAM/Research/GH Projects/rebound/latex/metrics_both_cutoffsl2.csv", replace
restore





texdoc stlog close


/***
\color{black}

\begin{table}[H]
\centering
\caption{Diagnostic performance at Youden's index and original authors' cutoffs}
\label{tab:cutoff_comparison}
\begin{tabular}{lll}
\hline
\textbf{Metric} & \textbf{Youden-optimal (0.38)} & \textbf{Original authors' (0.46)} \\
\hline
Sensitivity & 0.48380953 (0.44133425, 0.52652001) & 0.013333334 (0.0064727307, 0.027263863) \\
Specificity & 0.60204083 (0.56936157, 0.63385502) & 0.98526078 (0.97494626, 0.99136645) \\
PPV & 0.4198347 (0.3811343, 0.45954677) & 0.34999999 (0.18118955, 0.60075784) \\
NPV & 0.66209477 (0.62865496, 0.6939891) & 0.62653208 (0.60075784, 0.65160733) \\
Accuracy & 0.55792469 & 0.62260127 \\
\hline
\end{tabular}
\end{table}

The Youden-optimal threshold for the recalibrated model was 0.382, compared to 0.584 for the original PHarmacie-R equation. This shift reflects the compression of predicted probabilities following slope recalibration. The original authors' probability threshold of 0.46 was assessed for completeness but was found to be clinically inapplicable to the recalibrated model. As the recalibrated predicted probabilities are compressed into a narrow range with a maximum of approximately 0.49, a threshold of 0.46 sits at the extreme upper end of the distribution and classifies almost no patients as high risk. In other words, we made this threshold even more useless. 

With respect to the validation metrics anticipated, these values are numerically identical to those obtained for the original PHarmacie-R equation at its Youden-optimal threshold, reinforcing that recalibration corrects the absolute magnitude of predicted probabilities but cannot alter the model's ability to discriminate between patients who will and will not be readmitted.

\subsubsection{Summary of recalibrated model validation}

Failure of recalibration to improve discrimination reflects a more fundamental limitation of the PHarmacie-R equation when applied to the Grampians Health cohort: the predictor variables included in the original model carry insufficient prognostic information to reliably distinguish patients at high risk of 90-day readmission from those at low risk in this population. A C-statistic of 0.55 indicates only marginal discrimination above chance, and this represents an intrinsic property of the relationship between the PHarmacie-R predictors and the readmission outcome in our setting. This may reflect genuine differences between the Grampians Health population and the development cohort in the prognostic weight carried by individual predictors, a narrower distribution of risk factor burden in the Grampians Health cohort that limits the model's ability to stratify patients, differences in healthcare processes or readmission ascertainment between settings, or the possibility that 90-day readmission in this population is driven by factors not captured by the PHarmacie-R predictor set.

These findings suggest that while the recalibrated PHarmacie-R equation produces predicted probabilities that are meaningful and accurate for the Grampians Health population in absolute terms, its limited discrimination means that it cannot reliably identify which individual patients are at highest risk of readmission.



\pagebreak
\bibliography{/home/teletraan1/Documents/ref.bib}
\end{document}
***/

