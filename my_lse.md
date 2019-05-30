Table:

|            function            |                               code                                |                                      paper                                       |                        note                         |
| :----------------------------: | :---------------------------------------------------------------: | :------------------------------------------------------------------------------: | :-------------------------------------------------: |
|         `Ax = calc_Ax`         |                         `Ax = Cinv.A * x`                         |
|       `Psix = calc_Psix`       |          `Psix = exp(as.sign*1j*2*pi*[0:N-1]'*tau') * x`          |
|      `Cinv = precalcCinv`      |                             `Cinv.A`                              |             $\mathbf{A}(\bm{\theta})=\mathbf{\Phi\Psi}(\bm{\theta})$             |                   Steering matrix                   |
|      `Cinv = precalcCinv`      |                            `Cinv.Cinv`                            |                                $\mathbf{C}^{-1}$                                 | `C = beta*eye(M) + Cinv.A * diag(gamma) * Cinv.A';` |
|      `Cinv = precalcCinv`      |                         `Cinv.PhiHCinvy`                          |                             $\mathbf{C}^{-1}\bm{y}$                              |                  $\mathbf{\Phi=I}$                  |
|   `[q, s] = calc_qs(_grid)`    |               `q = Cinv.A' * Cinv.PhiHCinvy(index)`               |                    $\bm{q}=\mathbf{A}^H\mathbf{C}^{-1}\bm{y}$                    |
|             ditto              |              `s = real(sum( Cinv.A' .* CinvA.', 2))`              |          $\bm{s}=\mathrm{diag}(\mathbf{A}^H\mathbf{C}^{-1}\mathbf{A})$           |
| `[r, t, u, v, x] = calc_rtuvx` | `r = Cinv.A' * (as.sign*2*pi*(index-1) .* Cinv.PhiHCinvy(index))` |          $\bm{r}=\mathbf{\Psi}^H\mathbf{D\Phi}^H\mathbf{C}^{-1}\bm{y}$           |     $\mathbf{D}=diag(0,2\pi,\cdots,(N-1)2\pi)$      |
|             ditto              |  `t = sum( Cinv.A' .* (as.sign*2*pi*diag(index-1)*CinvA).', 2)`   | $\bm{t}=\mathrm{diag}(\mathbf{\Psi}^H\mathbf{D\Phi}^H\mathbf{C}^{-1}\mathbf{A})$ |
|             ditto              | `u = Cinv.A' * ((2*pi*diag(index-1)).^2 * Cinv.PhiHCinvy(index))` |     $\bm{u}=\mathbf{\Psi}^H\mathbf{D}^2\mathbf{\Phi}^H\mathbf{C}^{-1}\bm{y}$     |