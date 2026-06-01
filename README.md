# dirtyIsotopes — Quantitative PET Imaging with ⁸⁶Y

**Bachelor's Thesis (TFG) · Guillermo Gutiérrez Caracuel**  
*Escuela Técnica Superior de Ingenieros Industriales — Universitat Politècnica de València*  
Supervisor: Vicent Giménez Alventosa

---

## Abstract

The main objective of this work is to optimize the quantitative accuracy in Positron Emission Tomography (PET) imaging with the non-conventional isotope **Yttrium-86 (⁸⁶Y)**, which is essential for dosimetry in ⁹⁰Y therapies. ⁸⁶Y is a *dirty* isotope whose decay produces high-energy prompt gamma cascades that generate spurious triple coincidences, severely degrading image contrast and quantitative accuracy on standard commercial scanners.

The procedure is based on the development of a **Monte Carlo simulation environment** using the `penRed` framework and the PENNUC module, accurately modeling the geometry of a preclinical scanner (Bruker) and the complex decay of ⁸⁶Y. Through an incremental methodology, the impact of attenuation, scatter, and random coincidences on contrast degradation is isolated and quantified. A parametric optimization of the energy and time windows is performed during post-processing, evaluating the improvement in the **Contrast Recovery Coefficient (CRC)** and the **Signal-to-Noise Ratio (SNR)**.

Finally, an innovative proof-of-concept for **multiplexed PET (mPET)** imaging is developed and validated: an algorithm that identifies triple coincidences exclusive to ⁸⁶Y and uses them to separate and independently quantify the ⁸⁶Y and ¹⁸F signals in simultaneous dual-isotope acquisitions.

**Keywords:** Medical Physics · PET · Monte Carlo Simulation · Yttrium-86 · Multiplexed Imaging · Prompt Gammas

---

## Repository Structure

```
dirtyIsotopes/
│
├── penRed/                  # PenRed simulation environment
│   ├── config_files/        # Simulation configuration files (.json)
│   └── geometries/          # Scanner geometry files (.geo)
│
├── postProcess/             # C++ post-processing engine (coincidence builder)
│   ├── createCoincidences.cpp   # Main pipeline: singles → coincidences + triple detection
│   ├── perfectCoin2LM.cpp       # Perfect coincidence to list-mode converter
│   ├── common.hh / common.cpp   # Shared utilities and data structures
│   └── compile.sh               # Build script
│
├── Reco/                    # Image reconstruction configuration files (TC29 scanner)
│
├── factor_substract/        # mPET proof-of-concept
│   ├── read.py              # Subtraction algorithm and image analysis script
│   └── *.img                # Reconstructed image data
│
├── memoria/                 # LaTeX source of the thesis document
│
└── referencias.bib          # BibTeX bibliography
```

---

## Dependencies

| Component | Tool / Framework | Notes |
|---|---|---|
| Monte Carlo simulation | [PenRed](https://github.com/PenRed/PenRed) + PENNUC module | Particle transport |
| Coincidence processing | C++17, compiled with `g++` | See `postProcess/compile.sh` |
| Image reconstruction | Bruker RecoServer / Albira | Reconstruction parameters in `Reco/` |
| Image analysis | Python 3 + NumPy / Matplotlib | `factor_substract/read.py` |
| Thesis document | LaTeX (XeLaTeX + biblatex) | Source in `memoria/` |

---

## Usage

### 1. Run the simulation
Configure the geometry and physics parameters in `penRed/config_files/` and run with the `penRed` binary.

### 2. Build the post-processing engine
```bash
cd postProcess/
bash compile.sh
```

### 3. Generate coincidences
```bash
./createCoincidences <config_options>
```

### 4. mPET image subtraction
```bash
cd factor_substract/
python3 read.py
```

---

## Contact

| | |
|---|---|
| **Author** | Guillermo Gutiérrez Caracuel — [ggutcar@etsii.upv.es](mailto:ggutcar@etsii.upv.es) |
| **Supervisor** | Vicent Giménez Alventosa — [vigial@upv.es](mailto:vigial@upv.es) |
