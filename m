Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592795;
	b=ihBiY7enDMRz+M3HJHyw+DZE7XC2k5Ngl8MrX43gdyqDa/xvlAlebXzHlrADrfF/t+BG
	 P/7ICbP3ho0fmpJPcIxa8zKDI8U6pgWXQ8YYWqW3RuVcsdjX3seWby4rBSMF4OBmKNJOV
	 b/Iv7ukuFPVHjAw0JUHa21FLTFFEIUlh0uAij3xiliFpoYCJZZbiWkPhfcGLcflWqVSJJ
	 DXq18EuDTSDQXRFdnYJGS5b59J/I72fv/hfYYz0OqgPVKQNiZT/sU4Pnn91FCtgyNSgOq
	 7wJOFmUNgGcoAjP5AcSJaVrvimd2nQyI44fQSI8rNkDjhxse/yiqY23QGc49SBL8AEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592795;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wyzL7xSHwG07AHAVXIarfFNMx2ryQoGUjtaQKy+SekM=;
	b=zmouKDfjdBASTmooyvftqk/ocpFg/DSwV/AbR0Arpl+s9eC0TAJBFwglrGXUl91S1AZc
	 sfcUD4defhbmrtZeReOiusaVsE7FDi9PkiANUGp4weRvi836nQx3QkstEsYFssjp/alKA
	 lQdsbm0mW5UPOVxEBIRC9ND0wJztBVISz5zBfwvt80JB/Lsg5h0YNquiiXgwjwUEyLRdt
	 59EWsl6akmESSJjaqUzYQY/5Z5idPJj8cpApwXZBPqNFR5dHqEj+fA22DzUOg0r71qbD8
	 mPDaOB4dGQU2YsyfvO7t4H65Vi8oL5cPHcz1W3vEjOZiRi7eLXuKv8CdkN36fGsZqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uib7j0Nd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92828606A69F;
	Wed, 25 Nov 2026 07:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uib7j0Nd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F261F000CA;
	Wed, 25 Nov 2026 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592795;
	bh=wyzL7xSHwG07AHAVXIarfFNMx2ryQoGUjtaQKy+SekM=;
	h=From:Subject:Date:To:Cc;
	b=Uib7j0NdX1D+qDVQjzoYbda9gGP9cz0zWCeDkmvuoT6VOI47SofU7L02PbTC/F7xT
	 0O4jz+wXGbw0pMMam7qmq+Q8v+lPFANKN68intuSGbZlXid1sAOHlKdniVUEIFSfdd
	 D45jGJFEw9NhFbaoPn614zm7LPHSBkHdCAlcUpEIuoe8CNMUJHygEpGYPVO1QcWR3d
	 z4g+7J0GxFvBmB6r/qO/6j1vUUgzIkEo0vp8PCZlX0Oeoib6ScAXxB7A7Zto0H1Qfj
	 Jz9HdLkwdHlu6JnRBvpleuNIRJ4qtT3rULHBaUrXAJAH5ezRyEUyEFYjmeFibKOuEj
	 Nyrm5NhqRpA+A==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/4] riscv: dts: spacemit: Some minor improvements to K3
Date: Wed, 25 Nov 2026 07:46:13 +0000
Message-Id: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBBFryKzdiBJi2KvIi5sMtFRGiWTloJ49
 07bzYfH570DhDKTwK06INOLhbekYOsK/DymiZCDMjjjGmvdFU2H6wVDwQenLeuKxxhIXxNd0xK
 ouWeK/P5V++HP8rwv5Ms3Bef5AUQ9KN53AAAA
X-Change-ID: 20261124-09-k3-dt-minor-misc-fde2610f267e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=dlan@kernel.org;
 h=from:subject:message-id; bh=16U7h0aKOarFfxiA3lDLd7920xWf8TsRkzBLdHH6oTo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJH5QbFc2ugtaJyOGAfzadyJFj0f9xjO3wvM
 2TuMJekOluJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSRxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3zKQ//UVzoytlvzLKEn8GUoC5vVljYFBlGqUThDcXrKWXQzBJkaAmxatmNw
 m89mLvm22ttJbLCptAghfXV0dmJGj9FsEQnlI2/NTAL9Ug2uVe1TOBABEMlICTUA3QpjiuXXTcx
 LsQalHp9iuRf/p/OFZlAqW3FiWQCGrBW3+UZX6ShRldbz1hrTtgl9d8GR2eu79qmvfr93p5ndHE
 oy3ebRDs7F8naF6x4B1pcSQdkZv9WHwemsJVAdfc3tVbX/bfyCZK75Z209iwG/I+kFJmx021UdW
 HvFHv7Rgz+VfJWpJOJyakPEvQTI/gyXzkU93w3Q4UcQ4JhjTXWSXXcO3K/w+HHWaPRQ39wQgVg5
 niQP2R2G4nUcxAH7aSkxs5Te+71Jpfn8iJUD0GyEEFO7EDoJ3rlrF2/isV6EM8UHgUgTPCBO3ks
 aYtQO+E9Ij6zuLe+V9TYtQQvVMaNy/7Acw+n59tC2yyidJ4C/ETB9wEAarZ65JJG8frRUUZOESs
 LHNX+54ft6i4YUT/Ecqg9FfOiLV1kTlWfORKDKPpMrqpZP5MmcIV7JuelWH6DohVh5L6MA81w5b
 VxPeRR9FDINLmP3ZCLJ4COT6xNIhXXgex3D9Fzl0dqjPNIlyQfben36MBEx51pbQR0XKBM0uS22
 dFsNHyKos81+r0PiOW0L73fZPckcW8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Some misc changes combined in this series, the first three
patches are quite minor and obvious, the CD pin patch fix
an issue in U-Boot side which request explicit bias settings.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (4):
      riscv: dts: spacemit: k3: Rename PMIC node
      riscv: dts: spacemit: k3: Use Pin Macro
      riscv: dts: spacemit: k3: Add alias for MicroSD Card
      riscv: dts: spacemit: k3: Set CD pin bias

 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 +
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 4 ++--
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)
---
base-commit: da3f64e708a342ab2804754fa26fb4a132dc1809
change-id: 20261124-09-k3-dt-minor-misc-fde2610f267e

Best regards,
--  
Yixun Lan <dlan@kernel.org>

