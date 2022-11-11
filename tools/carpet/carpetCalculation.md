### carpet calculation

![alt text](carpet_memory_diagram.png "Diagram")

$$\begin{aligned}
S_y: \text{line in backgroundmap/video memory}\\
SC_y: \text{viewport scroll value}\\
S_s: \text{current scanline on screen/viewport}\\
m: S_s\text{ in screen plane}\\
\\
m - S_y = 0\\
(SC_y + S_s) - S_y = 0
SC_y + S_s = S_y\\
\therefore SC_y = Sy - S_s\\

\end{aligned}
$$