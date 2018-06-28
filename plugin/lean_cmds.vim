" This is most (but not all) of the lean abbreviations from the emacs mode.
" I still need to figure out which non-alphanum characters need to be escaped to form valid abbreviations, so I left out non-alphanum abbreviations.
autocmd FileType lean   :set iskeyword+=\
autocmd FileType lean   :set iskeyword+=^
autocmd FileType lean   :set iskeyword+=_
autocmd FileType lean   :iabbrev \not ¬
autocmd FileType lean   :iabbrev \eq =
autocmd FileType lean   :iabbrev \eqn ≠
autocmd FileType lean   :iabbrev \equiv ≃
autocmd FileType lean   :iabbrev \iso ≅
autocmd FileType lean   :iabbrev \pr ↣
autocmd FileType lean   :iabbrev \1 ₁
autocmd FileType lean   :iabbrev \2 ₂
autocmd FileType lean   :iabbrev \3 ₃
autocmd FileType lean   :iabbrev \4 ₄
autocmd FileType lean   :iabbrev \5 ₅
autocmd FileType lean   :iabbrev \6 ₆
autocmd FileType lean   :iabbrev \7 ₇
autocmd FileType lean   :iabbrev \8 ₈
autocmd FileType lean   :iabbrev \9 ₉
autocmd FileType lean   :iabbrev \0 ₀
autocmd FileType lean   :iabbrev \leq ≤
autocmd FileType lean   :iabbrev \leqn ≰
autocmd FileType lean   :iabbrev \geq ≥
autocmd FileType lean   :iabbrev \geqn ≱
autocmd FileType lean   :iabbrev \len ≰
autocmd FileType lean   :iabbrev \ssub ⊂
autocmd FileType lean   :iabbrev \ssubn ⊄
autocmd FileType lean   :iabbrev \sub ⊆
autocmd FileType lean   :iabbrev \subn ⊈
autocmd FileType lean   :iabbrev \ssqub ⊏
autocmd FileType lean   :iabbrev \squb ⊑
autocmd FileType lean   :iabbrev \squbn ⋢
autocmd FileType lean   :iabbrev \member ∈
autocmd FileType lean   :iabbrev \mem ∈
autocmd FileType lean   :iabbrev \inn ∉
autocmd FileType lean   :iabbrev \nin ∌
autocmd FileType lean   :iabbrev \T1 Type₁
autocmd FileType lean   :iabbrev \T2 Type₂
autocmd FileType lean   :iabbrev \intersection ∩
autocmd FileType lean   :iabbrev \union ∪
autocmd FileType lean   :iabbrev \and ∧
autocmd FileType lean   :iabbrev \And ⋀
autocmd FileType lean   :iabbrev \i ∩
autocmd FileType lean   :iabbrev \I ⋂
autocmd FileType lean   :iabbrev \glb ⊓
autocmd FileType lean   :iabbrev \Glb ⨅
autocmd FileType lean   :iabbrev \entails ⊢
autocmd FileType lean   :iabbrev \all ∀
autocmd FileType lean   :iabbrev \ex ∃
autocmd FileType lean   :iabbrev \exn ∄
autocmd FileType lean   :iabbrev \0 ∅
autocmd FileType lean   :iabbrev \empty ∅
autocmd FileType lean   :iabbrev \C ∁
autocmd FileType lean   :iabbrev \powerset 𝒫
autocmd FileType lean   :iabbrev \c ⌜
autocmd FileType lean   :iabbrev \cu ⌜
autocmd FileType lean   :iabbrev \cul ⌜
autocmd FileType lean   :iabbrev \cur ⌝
autocmd FileType lean   :iabbrev \cll ⌞
autocmd FileType lean   :iabbrev \clr ⌟
autocmd FileType lean   :iabbrev \tr ⬝
autocmd FileType lean   :iabbrev \trans ▹
autocmd FileType lean   :iabbrev \transport ▹
autocmd FileType lean   :iabbrev \con ⬝
autocmd FileType lean   :iabbrev \cdot ⬝
autocmd FileType lean   :iabbrev \dot ⬝
autocmd FileType lean   :iabbrev \sy ⁻¹
autocmd FileType lean   :iabbrev \inv ⁻¹
autocmd FileType lean   :iabbrev \qed ∎
autocmd FileType lean   :iabbrev \x ×
autocmd FileType lean   :iabbrev \o ∘
autocmd FileType lean   :iabbrev \comp ∘
autocmd FileType lean   :iabbrev \surd3 ∛
autocmd FileType lean   :iabbrev \surd4 ∜
autocmd FileType lean   :iabbrev \increment ∆
autocmd FileType lean   :iabbrev \inf ∞
autocmd FileType lean   :iabbrev \op ᵒᵖ
autocmd FileType lean   :iabbrev \opf ᵒᵖᶠ
autocmd FileType lean   :iabbrev \ox ⊗
autocmd FileType lean   :iabbrev \oo ⊚
autocmd FileType lean   :iabbrev \Ox ⨂
autocmd FileType lean   :iabbrev \bx ⊠
autocmd FileType lean   :iabbrev \integral ∫
autocmd FileType lean   :iabbrev \angle ∟
autocmd FileType lean   :iabbrev \join ⋈
autocmd FileType lean   :iabbrev \iff ↔
autocmd FileType lean   :iabbrev \l ←
autocmd FileType lean   :iabbrev \r →
autocmd FileType lean   :iabbrev \u ↑
autocmd FileType lean   :iabbrev \d ↓
autocmd FileType lean   :iabbrev \ud ↕
autocmd FileType lean   :iabbrev \lr ↔
autocmd FileType lean   :iabbrev \ul ↖
autocmd FileType lean   :iabbrev \ur ↗
autocmd FileType lean   :iabbrev \dr ↘
autocmd FileType lean   :iabbrev \dl ↙
autocmd FileType lean   :iabbrev \dz ↯
autocmd FileType lean   :iabbrev \t ▸
autocmd FileType lean   :iabbrev \Tr ◀
autocmd FileType lean   :iabbrev \tb ◂
autocmd FileType lean   :iabbrev \tw ◃
autocmd FileType lean   :iabbrev \Tb ◀
autocmd FileType lean   :iabbrev \Tw ◁
autocmd FileType lean   :iabbrev \sq ◾
autocmd FileType lean   :iabbrev \sqb ■
autocmd FileType lean   :iabbrev \sqw □
autocmd FileType lean   :iabbrev \sqo ▢
autocmd FileType lean   :iabbrev \re ▬
autocmd FileType lean   :iabbrev \reb ▬
autocmd FileType lean   :iabbrev \rew ▭
autocmd FileType lean   :iabbrev \pa ▰
autocmd FileType lean   :iabbrev \pab ▰
autocmd FileType lean   :iabbrev \paw ▱
autocmd FileType lean   :iabbrev \di ◆
autocmd FileType lean   :iabbrev \dib ◆
autocmd FileType lean   :iabbrev \diw ◇
autocmd FileType lean   :iabbrev \ci ●
autocmd FileType lean   :iabbrev \cib ●
autocmd FileType lean   :iabbrev \ciw ○
autocmd FileType lean   :iabbrev \ciO ◯
autocmd FileType lean   :iabbrev \st ⋆
autocmd FileType lean   :iabbrev \st4 ✦
autocmd FileType lean   :iabbrev \st6 ✶
autocmd FileType lean   :iabbrev \st8 ✴
autocmd FileType lean   :iabbrev \st12 ✹
autocmd FileType lean   :iabbrev \bn ℕ
autocmd FileType lean   :iabbrev \bz ℤ
autocmd FileType lean   :iabbrev \bq ℚ
autocmd FileType lean   :iabbrev \br ℝ
autocmd FileType lean   :iabbrev \bc ℂ
autocmd FileType lean   :iabbrev \bp ℙ
autocmd FileType lean   :iabbrev \bb 𝔹
autocmd FileType lean   :iabbrev \bsum ⅀
autocmd FileType lean   :iabbrev \b0 𝟘
autocmd FileType lean   :iabbrev \b1 𝟙
autocmd FileType lean   :iabbrev \b2 𝟚
autocmd FileType lean   :iabbrev \b3 𝟛
autocmd FileType lean   :iabbrev \b4 𝟜
autocmd FileType lean   :iabbrev \b5 𝟝
autocmd FileType lean   :iabbrev \b6 𝟞
autocmd FileType lean   :iabbrev \b7 𝟟
autocmd FileType lean   :iabbrev \b8 𝟠
autocmd FileType lean   :iabbrev \b9 𝟡
autocmd FileType lean   :iabbrev \lbag ⟅
autocmd FileType lean   :iabbrev \rbag ⟆
autocmd FileType lean   :iabbrev \fun λ
autocmd FileType lean   :iabbrev \lam λ
autocmd FileType lean   :iabbrev \X ⨯
autocmd FileType lean   :iabbrev \frac ¼
autocmd FileType lean   :iabbrev \bu •
autocmd FileType lean   :iabbrev \bub •
autocmd FileType lean   :iabbrev \buw ◦
autocmd FileType lean   :iabbrev \but ‣
autocmd FileType lean   :iabbrev \nat ℕ
autocmd FileType lean   :iabbrev \Nat ℕ
autocmd FileType lean   :iabbrev \N ℕ
autocmd FileType lean   :iabbrev \int ℤ
autocmd FileType lean   :iabbrev \Int ℤ
autocmd FileType lean   :iabbrev \Z ℤ
autocmd FileType lean   :iabbrev \rat ℚ
autocmd FileType lean   :iabbrev \Rat ℚ
autocmd FileType lean   :iabbrev \Q ℚ
autocmd FileType lean   :iabbrev \real ℝ
autocmd FileType lean   :iabbrev \Real ℝ
autocmd FileType lean   :iabbrev \R ℝ
autocmd FileType lean   :iabbrev \Com ℂ
autocmd FileType lean   :iabbrev \com ℂ
autocmd FileType lean   :iabbrev \C ℂ
autocmd FileType lean   :iabbrev \A 𝔸
autocmd FileType lean   :iabbrev \F 𝔽
autocmd FileType lean   :iabbrev \H ℍ
autocmd FileType lean   :iabbrev \K 𝕂
autocmd FileType lean   :iabbrev \a α
autocmd FileType lean   :iabbrev \b β
autocmd FileType lean   :iabbrev \g γ
autocmd FileType lean   :iabbrev \note ♩
autocmd FileType lean   :iabbrev \flat ♭
autocmd FileType lean   :iabbrev \en –
autocmd FileType lean   :iabbrev \em —
autocmd FileType lean   :iabbrev \die ⚀
autocmd FileType lean   :iabbrev \asterisk ⁎
autocmd FileType lean   :iabbrev \tie ⁀
autocmd FileType lean   :iabbrev \undertie ‿
autocmd FileType lean   :iabbrev \Ga α
autocmd FileType lean   :iabbrev \Gb β
autocmd FileType lean   :iabbrev \Gg γ
autocmd FileType lean   :iabbrev \Gd δ
autocmd FileType lean   :iabbrev \Ge ε
autocmd FileType lean   :iabbrev \Gz ζ
autocmd FileType lean   :iabbrev \Gth θ
autocmd FileType lean   :iabbrev \Gi ι
autocmd FileType lean   :iabbrev \Gk κ
autocmd FileType lean   :iabbrev \Gl λ
autocmd FileType lean   :iabbrev \Gm μ
autocmd FileType lean   :iabbrev \Gn ν
autocmd FileType lean   :iabbrev \Gx ξ
autocmd FileType lean   :iabbrev \Gr ρ
autocmd FileType lean   :iabbrev \Gs σ
autocmd FileType lean   :iabbrev \Gt τ
autocmd FileType lean   :iabbrev \Gu υ
autocmd FileType lean   :iabbrev \Gf φ
autocmd FileType lean   :iabbrev \Gc χ
autocmd FileType lean   :iabbrev \Gp ψ
autocmd FileType lean   :iabbrev \Go ω
autocmd FileType lean   :iabbrev \S Σ
autocmd FileType lean   :iabbrev \MiA 𝐴
autocmd FileType lean   :iabbrev \MiB 𝐵
autocmd FileType lean   :iabbrev \MiC 𝐶
autocmd FileType lean   :iabbrev \MiD 𝐷
autocmd FileType lean   :iabbrev \MiE 𝐸
autocmd FileType lean   :iabbrev \MiF 𝐹
autocmd FileType lean   :iabbrev \MiG 𝐺
autocmd FileType lean   :iabbrev \MiH 𝐻
autocmd FileType lean   :iabbrev \MiI 𝐼
autocmd FileType lean   :iabbrev \MiJ 𝐽
autocmd FileType lean   :iabbrev \MiK 𝐾
autocmd FileType lean   :iabbrev \MiL 𝐿
autocmd FileType lean   :iabbrev \MiM 𝑀
autocmd FileType lean   :iabbrev \MiN 𝑁
autocmd FileType lean   :iabbrev \MiO 𝑂
autocmd FileType lean   :iabbrev \MiP 𝑃
autocmd FileType lean   :iabbrev \MiQ 𝑄
autocmd FileType lean   :iabbrev \MiR 𝑅
autocmd FileType lean   :iabbrev \MiS 𝑆
autocmd FileType lean   :iabbrev \MiT 𝑇
autocmd FileType lean   :iabbrev \MiU 𝑈
autocmd FileType lean   :iabbrev \MiV 𝑉
autocmd FileType lean   :iabbrev \MiW 𝑊
autocmd FileType lean   :iabbrev \MiX 𝑋
autocmd FileType lean   :iabbrev \MiY 𝑌
autocmd FileType lean   :iabbrev \MiZ 𝑍
autocmd FileType lean   :iabbrev \Mia 𝑎
autocmd FileType lean   :iabbrev \Mib 𝑏
autocmd FileType lean   :iabbrev \Mic 𝑐
autocmd FileType lean   :iabbrev \Mid 𝑑
autocmd FileType lean   :iabbrev \Mie 𝑒
autocmd FileType lean   :iabbrev \Mif 𝑓
autocmd FileType lean   :iabbrev \Mig 𝑔
autocmd FileType lean   :iabbrev \Mii 𝑖
autocmd FileType lean   :iabbrev \Mij 𝑗
autocmd FileType lean   :iabbrev \Mik 𝑘
autocmd FileType lean   :iabbrev \Mil 𝑙
autocmd FileType lean   :iabbrev \Mim 𝑚
autocmd FileType lean   :iabbrev \Min 𝑛
autocmd FileType lean   :iabbrev \Mio 𝑜
autocmd FileType lean   :iabbrev \Mip 𝑝
autocmd FileType lean   :iabbrev \Miq 𝑞
autocmd FileType lean   :iabbrev \Mir 𝑟
autocmd FileType lean   :iabbrev \Mis 𝑠
autocmd FileType lean   :iabbrev \Mit 𝑡
autocmd FileType lean   :iabbrev \Miu 𝑢
autocmd FileType lean   :iabbrev \Miv 𝑣
autocmd FileType lean   :iabbrev \Miw 𝑤
autocmd FileType lean   :iabbrev \Mix 𝑥
autocmd FileType lean   :iabbrev \Miy 𝑦
autocmd FileType lean   :iabbrev \Miz 𝑧
autocmd FileType lean   :iabbrev \MIA 𝑨
autocmd FileType lean   :iabbrev \MIB 𝑩
autocmd FileType lean   :iabbrev \MIC 𝑪
autocmd FileType lean   :iabbrev \MID 𝑫
autocmd FileType lean   :iabbrev \MIE 𝑬
autocmd FileType lean   :iabbrev \MIF 𝑭
autocmd FileType lean   :iabbrev \MIG 𝑮
autocmd FileType lean   :iabbrev \MIH 𝑯
autocmd FileType lean   :iabbrev \MII 𝑰
autocmd FileType lean   :iabbrev \MIJ 𝑱
autocmd FileType lean   :iabbrev \MIK 𝑲
autocmd FileType lean   :iabbrev \MIL 𝑳
autocmd FileType lean   :iabbrev \MIM 𝑴
autocmd FileType lean   :iabbrev \MIN 𝑵
autocmd FileType lean   :iabbrev \MIO 𝑶
autocmd FileType lean   :iabbrev \MIP 𝑷
autocmd FileType lean   :iabbrev \MIQ 𝑸
autocmd FileType lean   :iabbrev \MIR 𝑹
autocmd FileType lean   :iabbrev \MIS 𝑺
autocmd FileType lean   :iabbrev \MIT 𝑻
autocmd FileType lean   :iabbrev \MIU 𝑼
autocmd FileType lean   :iabbrev \MIV 𝑽
autocmd FileType lean   :iabbrev \MIW 𝑾
autocmd FileType lean   :iabbrev \MIX 𝑿
autocmd FileType lean   :iabbrev \MIY 𝒀
autocmd FileType lean   :iabbrev \MIZ 𝒁
autocmd FileType lean   :iabbrev \MIa 𝒂
autocmd FileType lean   :iabbrev \MIb 𝒃
autocmd FileType lean   :iabbrev \MIc 𝒄
autocmd FileType lean   :iabbrev \MId 𝒅
autocmd FileType lean   :iabbrev \MIe 𝒆
autocmd FileType lean   :iabbrev \MIf 𝒇
autocmd FileType lean   :iabbrev \MIg 𝒈
autocmd FileType lean   :iabbrev \MIh 𝒉
autocmd FileType lean   :iabbrev \MIi 𝒊
autocmd FileType lean   :iabbrev \MIj 𝒋
autocmd FileType lean   :iabbrev \MIk 𝒌
autocmd FileType lean   :iabbrev \MIl 𝒍
autocmd FileType lean   :iabbrev \MIm 𝒎
autocmd FileType lean   :iabbrev \MIn 𝒏
autocmd FileType lean   :iabbrev \MIo 𝒐
autocmd FileType lean   :iabbrev \MIp 𝒑
autocmd FileType lean   :iabbrev \MIq 𝒒
autocmd FileType lean   :iabbrev \MIr 𝒓
autocmd FileType lean   :iabbrev \MIs 𝒔
autocmd FileType lean   :iabbrev \MIt 𝒕
autocmd FileType lean   :iabbrev \MIu 𝒖
autocmd FileType lean   :iabbrev \MIv 𝒗
autocmd FileType lean   :iabbrev \MIw 𝒘
autocmd FileType lean   :iabbrev \MIx 𝒙
autocmd FileType lean   :iabbrev \MIy 𝒚
autocmd FileType lean   :iabbrev \MIz 𝒛
autocmd FileType lean   :iabbrev \McA 𝒜
autocmd FileType lean   :iabbrev \McC 𝒞
autocmd FileType lean   :iabbrev \McD 𝒟
autocmd FileType lean   :iabbrev \McG 𝒢
autocmd FileType lean   :iabbrev \McJ 𝒥
autocmd FileType lean   :iabbrev \McK 𝒦
autocmd FileType lean   :iabbrev \McN 𝒩
autocmd FileType lean   :iabbrev \McO 𝒪
autocmd FileType lean   :iabbrev \McP 𝒫
autocmd FileType lean   :iabbrev \McQ 𝒬
autocmd FileType lean   :iabbrev \McS 𝒮
autocmd FileType lean   :iabbrev \McT 𝒯
autocmd FileType lean   :iabbrev \McU 𝒰
autocmd FileType lean   :iabbrev \McV 𝒱
autocmd FileType lean   :iabbrev \McW 𝒲
autocmd FileType lean   :iabbrev \McX 𝒳
autocmd FileType lean   :iabbrev \McY 𝒴
autocmd FileType lean   :iabbrev \McZ 𝒵
autocmd FileType lean   :iabbrev \Mca 𝒶
autocmd FileType lean   :iabbrev \Mcb 𝒷
autocmd FileType lean   :iabbrev \Mcc 𝒸
autocmd FileType lean   :iabbrev \Mcd 𝒹
autocmd FileType lean   :iabbrev \Mcf 𝒻
autocmd FileType lean   :iabbrev \Mch 𝒽
autocmd FileType lean   :iabbrev \Mci 𝒾
autocmd FileType lean   :iabbrev \Mcj 𝒿
autocmd FileType lean   :iabbrev \Mck 𝓀
autocmd FileType lean   :iabbrev \Mcl 𝓁
autocmd FileType lean   :iabbrev \Mcm 𝓂
autocmd FileType lean   :iabbrev \Mcn 𝓃
autocmd FileType lean   :iabbrev \Mcp 𝓅
autocmd FileType lean   :iabbrev \Mcq 𝓆
autocmd FileType lean   :iabbrev \Mcr 𝓇
autocmd FileType lean   :iabbrev \Mcs 𝓈
autocmd FileType lean   :iabbrev \Mct 𝓉
autocmd FileType lean   :iabbrev \Mcu 𝓊
autocmd FileType lean   :iabbrev \Mcv 𝓋
autocmd FileType lean   :iabbrev \Mcw 𝓌
autocmd FileType lean   :iabbrev \Mcx 𝓍
autocmd FileType lean   :iabbrev \Mcy 𝓎
autocmd FileType lean   :iabbrev \Mcz 𝓏
autocmd FileType lean   :iabbrev \MCA 𝓐
autocmd FileType lean   :iabbrev \MCB 𝓑
autocmd FileType lean   :iabbrev \MCC 𝓒
autocmd FileType lean   :iabbrev \MCD 𝓓
autocmd FileType lean   :iabbrev \MCE 𝓔
autocmd FileType lean   :iabbrev \MCF 𝓕
autocmd FileType lean   :iabbrev \MCG 𝓖
autocmd FileType lean   :iabbrev \MCH 𝓗
autocmd FileType lean   :iabbrev \MCI 𝓘
autocmd FileType lean   :iabbrev \MCJ 𝓙
autocmd FileType lean   :iabbrev \MCK 𝓚
autocmd FileType lean   :iabbrev \MCL 𝓛
autocmd FileType lean   :iabbrev \MCM 𝓜
autocmd FileType lean   :iabbrev \MCN 𝓝
autocmd FileType lean   :iabbrev \MCO 𝓞
autocmd FileType lean   :iabbrev \MCP 𝓟
autocmd FileType lean   :iabbrev \MCQ 𝓠
autocmd FileType lean   :iabbrev \MCR 𝓡
autocmd FileType lean   :iabbrev \MCS 𝓢
autocmd FileType lean   :iabbrev \MCT 𝓣
autocmd FileType lean   :iabbrev \MCU 𝓤
autocmd FileType lean   :iabbrev \MCV 𝓥
autocmd FileType lean   :iabbrev \MCW 𝓦
autocmd FileType lean   :iabbrev \MCX 𝓧
autocmd FileType lean   :iabbrev \MCY 𝓨
autocmd FileType lean   :iabbrev \MCZ 𝓩
autocmd FileType lean   :iabbrev \MCa 𝓪
autocmd FileType lean   :iabbrev \MCb 𝓫
autocmd FileType lean   :iabbrev \MCc 𝓬
autocmd FileType lean   :iabbrev \MCd 𝓭
autocmd FileType lean   :iabbrev \MCe 𝓮
autocmd FileType lean   :iabbrev \MCf 𝓯
autocmd FileType lean   :iabbrev \MCg 𝓰
autocmd FileType lean   :iabbrev \MCh 𝓱
autocmd FileType lean   :iabbrev \MCi 𝓲
autocmd FileType lean   :iabbrev \MCj 𝓳
autocmd FileType lean   :iabbrev \MCk 𝓴
autocmd FileType lean   :iabbrev \MCl 𝓵
autocmd FileType lean   :iabbrev \MCm 𝓶
autocmd FileType lean   :iabbrev \MCn 𝓷
autocmd FileType lean   :iabbrev \MCo 𝓸
autocmd FileType lean   :iabbrev \MCp 𝓹
autocmd FileType lean   :iabbrev \MCq 𝓺
autocmd FileType lean   :iabbrev \MCr 𝓻
autocmd FileType lean   :iabbrev \MCs 𝓼
autocmd FileType lean   :iabbrev \MCt 𝓽
autocmd FileType lean   :iabbrev \MCu 𝓾
autocmd FileType lean   :iabbrev \MCv 𝓿
autocmd FileType lean   :iabbrev \MCw 𝔀
autocmd FileType lean   :iabbrev \MCx 𝔁
autocmd FileType lean   :iabbrev \MCy 𝔂
autocmd FileType lean   :iabbrev \MCz 𝔃
autocmd FileType lean   :iabbrev \MfA 𝔄
autocmd FileType lean   :iabbrev \MfB 𝔅
autocmd FileType lean   :iabbrev \MfD 𝔇
autocmd FileType lean   :iabbrev \MfE 𝔈
autocmd FileType lean   :iabbrev \MfF 𝔉
autocmd FileType lean   :iabbrev \MfG 𝔊
autocmd FileType lean   :iabbrev \MfJ 𝔍
autocmd FileType lean   :iabbrev \MfK 𝔎
autocmd FileType lean   :iabbrev \MfL 𝔏
autocmd FileType lean   :iabbrev \MfM 𝔐
autocmd FileType lean   :iabbrev \MfN 𝔑
autocmd FileType lean   :iabbrev \MfO 𝔒
autocmd FileType lean   :iabbrev \MfP 𝔓
autocmd FileType lean   :iabbrev \MfQ 𝔔
autocmd FileType lean   :iabbrev \MfS 𝔖
autocmd FileType lean   :iabbrev \MfT 𝔗
autocmd FileType lean   :iabbrev \MfU 𝔘
autocmd FileType lean   :iabbrev \MfV 𝔙
autocmd FileType lean   :iabbrev \MfW 𝔚
autocmd FileType lean   :iabbrev \MfX 𝔛
autocmd FileType lean   :iabbrev \MfY 𝔜
autocmd FileType lean   :iabbrev \Mfa 𝔞
autocmd FileType lean   :iabbrev \Mfb 𝔟
autocmd FileType lean   :iabbrev \Mfc 𝔠
autocmd FileType lean   :iabbrev \Mfd 𝔡
autocmd FileType lean   :iabbrev \Mfe 𝔢
autocmd FileType lean   :iabbrev \Mff 𝔣
autocmd FileType lean   :iabbrev \Mfg 𝔤
autocmd FileType lean   :iabbrev \Mfh 𝔥
autocmd FileType lean   :iabbrev \Mfi 𝔦
autocmd FileType lean   :iabbrev \Mfj 𝔧
autocmd FileType lean   :iabbrev \Mfk 𝔨
autocmd FileType lean   :iabbrev \Mfl 𝔩
autocmd FileType lean   :iabbrev \Mfm 𝔪
autocmd FileType lean   :iabbrev \Mfn 𝔫
autocmd FileType lean   :iabbrev \Mfo 𝔬
autocmd FileType lean   :iabbrev \Mfp 𝔭
autocmd FileType lean   :iabbrev \Mfq 𝔮
autocmd FileType lean   :iabbrev \Mfr 𝔯
autocmd FileType lean   :iabbrev \Mfs 𝔰
autocmd FileType lean   :iabbrev \Mft 𝔱
autocmd FileType lean   :iabbrev \Mfu 𝔲
autocmd FileType lean   :iabbrev \Mfv 𝔳
autocmd FileType lean   :iabbrev \Mfw 𝔴
autocmd FileType lean   :iabbrev \Mfx 𝔵
autocmd FileType lean   :iabbrev \Mfy 𝔶
autocmd FileType lean   :iabbrev \Mfz 𝔷
autocmd FileType lean   :iabbrev \cent ¢
autocmd FileType lean   :iabbrev \brokenbar ¦
autocmd FileType lean   :iabbrev \degree °
autocmd FileType lean   :iabbrev \y ɏ