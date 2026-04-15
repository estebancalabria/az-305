# Analisis de costos

### ✔️ Variables que SÍ influyen en el costo fijo
1. **Tipo de cuenta**  
   - Standard (HDD) → GPv2  
   - Premium (SSD) → BlockBlobStorage / FileStorage  
2. **Tier de acceso**  
   - Hot  
   - Cool  
   - Cold  
   - Archive  
3. **Redundancia**  
   - LRS  
   - ZRS  
   - GRS  
   - GZRS  


# 📊 TABLA COMPARATIVA — COSTO FIJO NORMALIZADO  
### (Hot LRS = 1 USD)

| Tipo de cuenta | Tier | Redundancia | Precio real (USD/GB/mes) | Costo relativo (Hot LRS = 1) |
|----------------|------|-------------|---------------------------|-------------------------------|
| Standard | Hot | **LRS** | 0.018 | **1.00** |
| Standard | Hot | ZRS | 0.023 | **1.28** |
| Standard | Hot | GRS | 0.036 | **2.00** |
| Standard | Hot | GZRS | 0.046 | **2.55** |
| Standard | Cool | LRS | 0.010 | **0.56** |
| Standard | Cool | ZRS | 0.013 | **0.72** |
| Standard | Cool | GRS | 0.020 | **1.11** |
| Standard | Cool | GZRS | 0.026 | **1.44** |
| Standard | Cold | LRS | 0.0045 | **0.25** |
| Standard | Cold | ZRS | 0.006 | **0.33** |
| Standard | Cold | GRS | 0.009 | **0.50** |
| Standard | Cold | GZRS | 0.012 | **0.67** |
| Standard | Archive | LRS | 0.00099 | **0.055** |

---

# 📌 TABLA RESUMIDA (solo multiplicadores)
Si querés ver solo el “factor” respecto a Hot LRS:

| Configuración | Factor relativo |
|---------------|-----------------|
| Hot LRS | **1.00×** |
| Hot ZRS | **1.28×** |
| Hot GRS | **2.00×** |
| Hot GZRS | **2.55×** |
| Cool LRS | **0.56×** |
| Cold LRS | **0.25×** |
| Archive LRS | **0.055×** |

