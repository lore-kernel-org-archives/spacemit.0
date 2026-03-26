Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2598D3B8D40
	for <spacemit@lists.linux.dev>; Thu, 26 Mar 2026 08:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513124; cv=none; b=F0maiPn1/dL0gfBdOcrAmB2/rV9LdRedG/YkKHkFdLboL6LB58Bwki7VyldWXnlitnJt6/JRSM0AbYylBNko/2vMgg+nv0ZHBYB2WI+xS1rJJCoS4IaU8+y1iGRE6jJLF8dKqJDHY0iAfShzJjs/z7Q3z43HbRon1PQkOLnT88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513124; c=relaxed/simple;
	bh=QZYhKiS4lwwd48rBHO86C8x7uMbv/XFwiRuoHArvWw4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aNWSYPm7CHTYyHDH8eRYcav0LuBZPm7j/VF4XlXJmcA5IjMxeE2fEOa9CCe84TJ2n9JVSmjf1j2kHaqU5j4qyKYQ6EqWm+hEXu8jh94SAHIP3em8qHQrWKhMDIAAQwaZp0i16vjSPkcenzZtA1wBHeng5l3CfqLs3CjyJPq34wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Fcsk5S4X; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Fcsk5S4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513078;
	bh=rRU+260XXpNc6ZQtDU8cpYIkfTiNBj6tvslzTN4JpFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=Fcsk5S4XZowMEIB14aRNuJZWwyB7hrTogztfkHlb17xaaFqW2DX6odrvYBv8xAaqM
	 KQ2dpyNaI4dWxrFruk4FlGAHVXM94pe/U2aYiqucsuLU7HlyJ2AwUmXvFDQVS6cdJ9
	 IsJ95CZCbf82/WjZLKerLedhz47JyiY9TnpM/cik=
X-QQ-mid: esmtpgz14t1774513076t119d99a7
X-QQ-Originating-IP: SyEQruZzhtsP2fkfOFgqYJ5sWBGHI2PROvsDS28KBOA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:17:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 203640637198776903
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/7] dmaengine: Add Peripheral DMA support for SpacemiT
 K3 SoC
Date: Thu, 26 Mar 2026 16:17:15 +0800
Message-Id: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ6CMBCF4auQWVtCO0iDK+9hWNQyyEQLTYsEQ
 3p3K1uX/8vLt0OkwBThUuwQaOXI85RDnQqwo5keJLjPDapSTYVSiycK3zsjtJUa6xpljQ3ktw8
 08HZIty73yHGZw+eAV/lb/41VCikGbHukVt/PaK4vnt5bGb2x5Hgp7eygSyl9ARwTgkOnAAAA
X-Change-ID: 20260317-k3-pdma-7c1734431436
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 liyeshan <yeshan.li@spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=2351;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=QZYhKiS4lwwd48rBHO86C8x7uMbv/XFwiRuoHArvWw4=;
 b=gDmQLaCbeIT3EXk4mBIUOPgp92kb86VjaSMjPN5Kwpi0jRYxJtns2hHmFjYP7tv7jA8SASiJ6
 AnyHEpc0ly0ClqNUvYN8KKtWfpzN85L8nHYz7+JrgBfNYZ9dpPAb+Gm
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OPtS5Xt3l5tAKtpLhiOjL9eT4geL0t0ojocuJsbK4sbkwK117zJEuvWH
	IqP+XiGrPSeWfhxaE45rGuId2FN24GV3oMdfUbMw2NhgyPGGRXnFI0AmQdJGTu3Goiw18IP
	yfXhuSEQ1N88J0DeBYpDTbLc33dkH5YQD7czauWgdD3PgaM2ssVCM9e8a1Acp0PA2h3083w
	B3cXUn37SUZ7qAbOjFgZjW/cE9vE37LUyxd1tO+XC7sN/PHYnF0UJuIAqDUuuPYmC/0H2zc
	+qJ/c4P3eDb7AoEB5FmrfvDQGDNWUnggOpVux35x7Tav2r+twNmipMFqZHUhHceLd2ZJNBz
	Tt2ckV8mCBY8YZjuhtI+cQ7eZPHONNlnI/B+/MbhqxFVyea7w9mOJY5JdoP0KElLx1mcqO4
	tzCSBlGKYhOk+B9qcv12D/vfkNLeQsw/xBBENuAeQdIUUL+pPpvl/fdzbEgdOdnTBOQtH+h
	2eqXIglRa2s+DHsyR4aebQoPNapK0EEow9zIocLtHfH/tlzf3zlO0RGRJr42m0gXjyqK/O/
	ScTlyseLVIDYxFMFzNVeENZqhA/jpwlgNG3AySGGLFodTRzoT1/ONUmRf6X6CC014vVtczQ
	O/403ACb7T3UospVJGw/0XLDCoIl1unS3KsBGqc12Ka6hPMTVkhORaSIoQBFELYH3fQLSOM
	gefoF1qC041tg0rEY+YSAHXkrbDePXz++RgH5qXBBX4v6g05OjHk13x6Ei11PntmLf+h/T3
	oGdQTMhjMgAD9btzad69VDAwjQffRSFj8laSFGDncD1X191QBWV7WBMmc/ndmxdLcumCDgK
	6eb+x3weRmYwDZdchYdIhlEtc+E5pE9puejtH//5M9MsdSv1Ja5WMdxxnLjGL0xMhtlMHEE
	mcwvgL/68gi+xWzZPAYjozOgAC5oC2EAqlMcWA6lpwMTdf3AZJSG6BSYsZ7QAhfR3E5Yzsm
	jvWMOmymt32p6l2VIPpt2u8KZtLDgsRXSxQfJOwV66H94m6Z+wjXZfhCECyki3VmUOzmJUH
	0OpyhUNO21AD8owp6kg1PjVQYc0TZ0V4dC3M82ajZnPWtBmxrUiXQS9Q0TeXawapGg8xZnX
	4C3Pg8Vn2zfSM4uMdt4idLtJW3QXPkxAKTzKK7mUUEHiP5iYBuEcw0=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi all,

This patch series introduces Peripheral DMA (PDMA) support for the 
SpacemiT K3 SoC, leveraging the existing mmp_pdma driver.

The K3 PDMA IP is largely based on the design found in the previous 
SpacemiT K1 SoC, but introduces a few key architectural differences:
1. It features a variable extended DRCMR base address for DMA request 
   numbers (>= 64) depending on the hardware implementation.
2. Unlike the K1 SoC, where some DMA masters had memory addressing 
   limitations (requiring a dedicated dma-bus), the K3 DMA masters 
   have full memory addressing capabilities.

The series is structured as follows:
- Patch 1-3: Introduce the necessary dt-bindings, including DMA request 
  definitions for both K1 and K3, and the new K3 compatible string.
- Patch 4-5: Refactor the mmp_pdma driver to support variable extended 
  DRCMR bases, and add the specific implementation/ops for the K3 SoC.
- Patch 6: Fixes a critical clock issue where the DDR bus clock 
  (top_dclk) could be gated by CCF, which would cause DMA engines to 
  hang and lead to system instability.
- Patch 7: Finally, instantiates the PDMA controller node in the 
  SpacemiT K3 device tree.

---
Guodong Xu (4):
      dt-bindings: dmaengine: Add SpacemiT K1 DMA request definitions
      dt-bindings: dmaengine: Add SpacemiT K3 DMA compatible string
      dmaengine: mmp_pdma: support variable extended DRCMR base
      dmaengine: mmp_pdma: add Spacemit K3 support

Troy Mitchell (2):
      clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
      riscv: dts: spacemit: Add PDMA controller node for K3 SoC

liyeshan (1):
      dt-bindings: dmaengine: Add SpacemiT K3 DMA request definitions

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 +-
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 11 +++
 drivers/clk/spacemit/ccu-k3.c                      |  2 +-
 drivers/dma/mmp_pdma.c                             | 37 +++++++++-
 include/dt-bindings/dma/k1-pdma.h                  | 56 +++++++++++++++
 include/dt-bindings/dma/k3-pdma.h                  | 83 ++++++++++++++++++++++
 6 files changed, 188 insertions(+), 5 deletions(-)
---
base-commit: 02f90981a67f3b9ee7d6684e7503a4fed7aade0c
change-id: 20260317-k3-pdma-7c1734431436

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

