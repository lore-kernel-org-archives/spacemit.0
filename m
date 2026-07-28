Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757753B102F;
	Tue, 28 Jul 2026 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785238281; cv=none; b=Xjp9f1nVx4nxwMVowzUl+/YxI0HhPHQh4XwuY51dIekjSTuGDkqT/rT0MivUUz1pwylgcO8MKdrh2DHi1o9yCz+0BNtByOUgjKOC3HB11XtO7tBQ6Xma/SkIiRvzRXa6X6UE97IiOgLM/EmcEq5Q+nJ7LQUMzKbzGagQWalyzRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785238281; c=relaxed/simple;
	bh=i81mPMVY/ze5o3qsEOtbEOcHmlHBojo9HokZUUfR0JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pucuUOoWHsRj8yNXFMhJ4zAnXEOGsAM1mDUF/Q+NZVNFCKWc0dUgSNV3KNUczKQoWH3xfigslf1sPgcA+0hBWpXwGobuhboPlrn4ylpD1feFz3wCgv+h9EutCUbdw827aaaxSZEiDlBBtiB9ARtF6C07wlnEpU0JjltqD/SgJDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJgQc7Ye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJgQc7Ye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6ED1F000E9;
	Tue, 28 Jul 2026 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785238280;
	bh=/5/caRe3ZcVfEMk0Kh5LSH6IafAiN5eUy+1jfGZrCU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jJgQc7YeAN9KYM4G4ymJIKnpULPieJt8h9uDbLNYDlMW+eriAs3710n6Q67jOqJ44
	 Z+KQ6T2b7TFvyb87eOpj78cVTkVg43rYn2XF4LxyvApsNoIIGsUtA4wF80sMvZ57N+
	 SlR/J2bX19Hcfwtz7HTRRXSl83qS8xabn7AU0e4/SJeluqFO1KmXAyPwjMpbqdS/m4
	 lVjzXNomXLfowUWiE0/murGUaU3h+gSQERbU2LYTDTAbZLLZU3dCs7aTpa6VQHQee0
	 ZgdxkiR3Ha3jaw4zQU5S2Z3RBZXLA7Cylhsct/d+z1KLVoYyOKoAWNQK1wUnZtBISG
	 dI2K4B2/lNjEA==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <guodong@riscstar.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paolo Abeni <pabeni@redhat.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH v3 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6 IO board
Date: Tue, 28 Jul 2026 11:31:11 +0000
Message-ID: <178523813343.622718.11560262898938675370.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
References: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 12 Jul 2026 12:00:00 +0800, Junhui Liu wrote:
> This adds initial support for the Banana Pi BPI-CM6 IO board. The
> BPI-CM6 is an industrial-grade RISC-V compute module powered by the
> SpacemiT K1 SoC, featuring board-to-board connectors similar to the
> Raspberry Pi CM4 form factor. For evaluation and development, the module
> is paired with a companion IO carrier board.
> 
> During the board bring-up, GPIO45 and GPIO46 were found to be used by
> the BPI-CM6 hardware as Ethernet PHY reset GPIOs, while the common K1
> GMAC pinctrl groups currently mux them as optional GMAC reference clock
> pins. Since the reference clock pins are not required on all K1 boards,
> the second patch separates them into independent pinctrl groups so board
> DTS files can select them only when the signal is actually wired.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=c5b108626dc5f21c34cf5119c6f5e0cd7561daa8
[2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=8270311d70fdf36bc8aab1e52b554e654a8839ff
[3/3] riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=46a8c01700ac21e1b83385df00aa0baa5d287b44

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
