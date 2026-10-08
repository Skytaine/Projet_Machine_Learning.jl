try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md raw"""
# Régression Logistique

On veut expliquer une variable binaire Y=0 ou 1 par $n$ variables explicatives $(X_1,\dots,X_n)$.   
   
Pour ça on note 
$$p=P(Y=1|X)$$
et on introduit le LOGIT de p
$$ LOGIT(p)=ln(\frac{p}{1-p}). $$

Pour une réalistation $x=(x_1,\dots,x_n)$  
On approche le LOGIT par 
$$  ln(\frac{p}{1-p})=a_0+a_1x_1+\dots+a_nx_n$$
et on obtient une formule pour p,
$$ p=\frac{e^{a_0+a_1x_1+\dots+a_nx_n}}{1+e^{a_0+a_1x_1+\dots+a_nx_n}}. $$
On veut estimer le vecteur $a=(a_0,\dots,a_n)$ par le maximum de vraisemblance.


"""

#%% md id=60565f
@md"""
# Plan du programme

Fonction :   
1)LogReg(a) regression logistique avec vecteur a fixée   
2)Fit(DataFrame ou un duo var explicative et var a expliquer,LogReg)->fonction LogReg avec vecteur a optimisé par max vraisemblance    
3)Predict(DataFrame ou vecteur,LogReg) a chaque ligne d'un dataframe donne le résultat de la regression logistique entrainée.  


# LogReg
mutable struct LogReg avec contenant un vecteur réel

# Fit(Data,LogReg)
Le Data contient les variables explicative X et la variable a expliquer Y.  
Calcul du maximum de vraisemblance (descente de gradient)
"""

#%% code id=0408fc

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = 8e760128-3fa4-4eb7-9dee-473d59eaad61
# ╚═╡
