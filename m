Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD8A38E11E
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734235; cv=none; b=ixuAGavYb+M/3/1Q4Dbpn0RIqG4vsO/YPEDngzoiQZgy7O1xrcxXVH1upTzgtpcnnv9n6Lo4EJfq2I2WEILF015IQf2woSogtH/2EDlN44suEJaGtrVsU+ZUSXZJiySUu1+wot2VID9KST/SLUucwPwnN5YZS3zpCQf4D0EvnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734235; c=relaxed/simple;
	bh=88z24i4Mu4dMX0+3MiP08K4JRaNoaZcAVvLBU8NrdgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=L8QYxa7JnUHDpLOZ6YZxymdS7kCr5DEl4HPDYxvOQWjvdtzylkcrM6A9fw2H4p67pqKLkI1FFEhIJip0tfJU2ABHTyVxEkcaW21eSvzQPQVE2aAwdByJsSgIGM4OM9pyLJuRAW1/0lAPmd2ohIrWAbfRA+p+el/byEOavFMXnk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=dYbF7Q6n; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="dYbF7Q6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1773734166;
	bh=2x3H1s4Sa0yhs6+gMgWwNOfaEbRWoZBFTbfGwSBZafY=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=dYbF7Q6nb2cc/qoUejdBXiUr+41s4aTx1d4OvdkboUsVEEI4jpsqTOOWd20XtZfI4
	 SrlrZDSTxgc1Hbbzw90cHcBHe/jAk1KtqcAJ1KIDbAQHM9LiCNCZ2Ep+3kn+RfJ7Yn
	 Ugvr4H87aaVuxnntqJnvPheTFWZoz1ubzwd7g+rk=
X-QQ-mid: esmtpgz14t1773734164td4b9ac16
X-QQ-Originating-IP: M88vjTllWXtDO6TtolrovEckKrAGjRt6n+l2s8Qou0g=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Mar 2026 15:56:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16495269182346670904
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Mar 2026 15:55:58 +0800
Subject: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3Wxj3YKU3ERd82RDc2MTE2NDE2MzJaDqgqLUtMwKsEnRsbW1AGc
 2xwxZAAAA
X-Change-ID: 20260317-k3-pdma-7c1734431436
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773734161; l=1958;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=88z24i4Mu4dMX0+3MiP08K4JRaNoaZcAVvLBU8NrdgM=;
 b=Y+IAEWOo3h4hOK1f8C70fhGXYsB4h9Xx8sqUos0crU5miTr+1bZ1OxlGMdybE07C1Vd2OpstJ
 4wWif//EQX8A6wH/vL1rtXbCBp3niqfCWVk+0H2ZX2YGj5rR23c8EwR
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Oe4bhvFplmDXywCtraLnPVnfRIOs167xFFlvtE7uIQdyZugF9l+/08bQ
	NV4k/uT5ta8i4YXTKskAZN2qkptO59mnJJh6nsOiQteun6B3OMxI46nVxlBEV+okMXt3ka7
	w2EoXoc11XZ0uS+X9Yd0SkKEtRki0yXM4c4q7y3L5+pyKHW1fXy356035Lh325MW1uMgXq+
	imMYw8f6r+OsguluXjNu8RJf8B6Y3lPcwd4ak434dKM+Gl/FIFEkJHmmtVLkCWDzdwMsYRY
	OJiJn+9TtcMBqeVOU+aaprkd3rvMHQ0ESvYK+tMMHOIxOEHPvMZGVH/6ohsn1oJ6Q3Qsj72
	szJMtfiBstItxmHx9X9RR+WComGAnQAN1PkbLc/7oAjNLamy2GmFp7tNYDCH99D50GaK2MZ
	OVahCdYbxc7ek1BfH2UunLcwMugWLsOkTcgrjY5VF1hTfwgyLX0PBmAZJhXL/XKZ+Rzr1+3
	+gQnT2jv71EQKoQ6vK0BKUxWdEtj6ulV+s1y0tlqxos7PVlJvrFX9sBi1Vjcikotr6R6Ppr
	NG3XvCOzTEXuZIzxKIi0kQMAMtM5jlojOJsdKfmoxdU1mvOEsLKcFjOfb1kx+weaViARrGt
	z6696u7qzoJYIaglEYECb9Bh5gW/5viUBzGK19NLynxU/woW6kIeZM1EiH/2X2VNM6kq00v
	/MGq1EMTSjDY3xMxbqGa10OKAb36dNOoVxfhntaYwjqrwGwY89H/cXzuSQpvk2Ec2X0wROU
	cGIWpyLtLqZYIiFg2YVRiJHZ4VG3mQ+nbyGfprvhmzqW6lP6OumP9XilMsousHFyGI3sbkr
	PpTjSAVPr43/XNfAHcXnoB43ZOvTCL62sM33IZI0NRnApOm1ZqfAR3gBn5YH01J3I8ehvvn
	MiCVz2ptj6nwKBfguJuEFvPX8NCtJzOm9IjlnC6oGugSzGfkZIwNjkmM9R/bhtZBWzu3v/5
	dSgHNvvhT5N8JiAcHJa+aNzVbxvzbD62FlRSL0Nc4tF36CTginaaUdByZR1M8NqU7c1XrOs
	R1EfkiLLgEerSObo1++SzEsc/elp1E/MeN1yTrBPJ7jpVBU7PGiaRWU1rojm8u8F9ENoiKc
	ST6daC9H0KUXHfDV4IViwKmNcYO0PLvcWQUO5vHYHvf22mT348CCica89Rr3EKa8fO9O4UC
	zJgx7wSSwgzupQ/eDPk8QVZ73A==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
The PDMA controller provides general-purpose DMA capabilities for various
peripheral devices across the system to offload CPU data transfers.

Unlike the previous K1 SoC, where some DMA masters had memory addressing
limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
with dma-ranges to restrict memory allocations, the K3 DMA masters have
full memory addressing capabilities. Therefore, the PDMA node is now
instantiated directly under the main soc bus.

This configuration defines the essential hardware properties:
- Register base address and size
- High-level triggered interrupt
- Associated APMU clock and reset controls
- 16 hardware DMA channels

The node is disabled by default and should be enabled by specific
board device trees as needed.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a3a8ceddabec..f90d34a81be0 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -438,6 +438,17 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		pdma: dma-controller@d4000000 {
+			compatible = "spacemit,k1-pdma";
+			reg = <0x0 0xd4000000 0x0 0x4000>;
+			clocks = <&syscon_apmu CLK_APMU_DMA>;
+			resets = <&syscon_apmu RESET_APMU_DMA>;
+			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <16>;
+			#dma-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k3-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260317-k3-pdma-7c1734431436

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

