# Brain Tumor Detection using Morphological Image Processing

![MATLAB](https://img.shields.io/badge/MATLAB-Image_Processing-blue.svg)
![Status](https://img.shields.io/badge/Status-Completed-success.svg)

## 📌 Overview
This project presents an automated image processing pipeline implemented in MATLAB to detect and segment brain tumors from MRI scans. The algorithm relies on morphological image processing techniques and a custom implementation of **Otsu's Thresholding method** from scratch. 

By avoiding high-level thresholding functions and building the mathematical variance models manually, this project demonstrates a deep understanding of core computer vision and image processing algorithms.

## ⚙️ How It Works (The Pipeline)
The tumor detection process consists of several consecutive stages:

1. **Preprocessing & Resizing:**
   - The input MRI image (RGB) is converted to grayscale to reduce computational complexity.
   - The image is resized to a standard dimension ($700 \times 700$) to ensure consistency across different MRI inputs.

2. **Contrast Enhancement:**
   - Histogram equalization/adjustment (`imadjust`) is applied to increase the contrast between the tumorous regions and the healthy brain tissues.

3. **Morphological Operations:**
   - **Erosion** is applied using a disk-shaped structuring element (radius = 20). This step shrinks the boundaries of foreground regions, effectively removing weak connections, small noise, and skull boundaries while preserving the dense tumor region.

4. **Custom Otsu's Thresholding (Algorithmic Implementation):**
   - Instead of using built-in thresholding functions, the global threshold is calculated dynamically.
   - The algorithm computes the image histogram, probability distribution, cumulative sums, and cumulative means.
   - It calculates the **Between-Class Variance ($\sigma_B^2$)** iteratively for all possible threshold values.
   - The optimal threshold $T$ is selected where the variance is maximized.

5. **Binarization & Segmentation:**
   - The optimal threshold is used to binarize the image, perfectly isolating the tumor from the background tissue.

## 🛠️ Technologies & Tools
* **Language:** MATLAB
* **Concepts Used:** Image Preprocessing, Contrast Adjustment, Morphological Erosion, Probability Distributions, Image Histograms, Spatial Filtering, Otsu's Binarization.

## 🚀 How to Run
1. Clone this repository to your local machine.
2. Open MATLAB and set the current directory to the project folder.
3. Ensure the target MRI images (e.g., `Capture1.png` or `Capture3.png`) are in the same directory.
4. Run the `Tumor_Detection_In_Brain.m` script.
5. The script will generate multiple figures:
   * **Figure 1:** Step-by-step visual progress (Original -> Grayscale -> Resized -> Contrast Adjusted).
   * **Figure 2:** Result after Morphological Erosion.
   * **Figure 3:** The final segmented tumor mask.

## 📄 Reference
This implementation is inspired by the methodologies discussed in the paper: 
*Vanitha, U., et al. "Tumor Detection In Brain Using Morphological Image Processing." Journal of Applied Science and Engineering Methodologies (2015).*
