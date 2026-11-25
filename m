Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570744;
	b=D4mvWuEhNWo3rgw3ysL9IpKLDSVpf+c0S1fkee4VFx66tAbnHuvUdelSPLPf2//A9J5I
	 WaVmvBq4l5OsBXzRR/R3AANYWM0A4Td3ILL3mub0p3EmwMRtmrmpbX089xrOYxTVRHSJ6
	 LkgfqNEDP70BjF7WohscRNLaNgjbft0iZxcSXmybWP5af6q6vSVpLTHu3doblzqVa8pr7
	 5mDL1AKXJZqXZcouqQOLrlGL30E7wT3HDnMNx2Rfh+WhNL+JQZZ5UD4UfEAX6aZamblhb
	 YloCtmr3/szP9NqkVVdCCdcC6GdxX/3LO+NmAMD6k/091t8Pydg6p+HXf5LHbCnf92A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570744;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	b=REsivPntNnWAVW1tpUxwzBvca8RZOFFP4K3clwR3B+MT+jsrKbS1Jy8FTOb7uQQTrMej
	 DG0ySGE5N1fLtCd+Ma25BWIMcu9BUWUA5iSGDy6DMjgFakhXQaZ5+biI/hiET8vccAwMa
	 RdytdctfevTZPQDud7g7JtYWW3Ih2UIonESQdxy6dzADAufx5DJk01+gWUa60l/qgvzL3
	 AEnXMiblT1bo7b78RT3gdmJzuIXMcZ8R/tjlYA/bp+g9i8b15+p8XynXsfMVdNmH6kPNX
	 ATR8cByl1OOM6zeF071W8FuaywvwX8+pBourArtazgTpmZv13oaepnZGPqnlFTagdIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ej2PdTyW;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B37606A696
	for <spacemit@lists.linux.dev>; Wed, 25 Nov 2026 01:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B37606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ej2PdTyW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795570727;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=ej2PdTyWp2BLpKWOJlrXqbaQlnb8jf47akj+TqjC26FfCIlcH/07fHJj3hIC7P8gf
	 uiPVmy2QbVL9y4RnD8zBoEr4p2y5MrG/g2qOiX4PbBBuJFoRmt+MXzlgxB/oOjRxXV
	 Evv6ZgzsD4pyDP/YO1F+PUhIBQ1ejm13oIXNoqUo=
X-QQ-mid: zesmtpsz6t1795570726t3875f953
X-QQ-Originating-IP: 1pUHN2W2v/cwes8S0A48xd4P62TBf9qf6ZLNZV/KyCU=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:38:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15465363206099856492
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Wed, 25 Nov 2026 01:38:22 +0000
Subject: [PATCH v3 3/5] riscv: dts: spacemit: Add the K1 APB timer
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
Message-Id: <20261125-spacemit-soc-timer-v3-3-e6390f3ae4a6@linux.spacemit.com>
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=MskIDgqPGeV/8XRXVLyf9Iga/gwF4QUehWI17LXRw8Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDNlsNqLsAtoNqulCF2yfnZpmX8D/xTC1TI7Raif/gt2Ox
 n2/HbZ1lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATER/FcP/NNaXb88c5Ht6S/6I
 WLpuaEZs+dGL0Zl/09bON6jY8++iOyNDW2v2z+K4Z0e2V6mFxKtPOpNwlE88bNYe2cSATI71NVs
 5AQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NEAuM+RWOySTu/6gG6xcPy8RPcRCS9wqJdwA9O2ucA7v+gN6A2M2gXyx
	ofw0ZjUm8X4w4+PNDoUg1dlh7IKZ9J+8IBZTC4VfUK5YmFRFQmrObYdLMSSosCXgBixFoRw
	7E+PvHOsA5cgLemmWkOFK+3PwgqiIWXbfacOSOFf+NDg9V7aQLqYTJkz5t3Cbd/FLsYunFD
	Np6Ul2mXcSL+cmXHN5cIrZSYeClLFRFyHIU5XROVrFd0h+9J+4lfWbPnmK68AehiSXt0Bzr
	DdKQk8/HQ5XSH4J5YL4g4KgfQeYQgJbRLl4kgTEw+bLohyKmqfJ0xsiCXppFvJRX5QNC1IZ
	srPlDWRQlCzUr6OW3N57l6A5YO1XACcqeXaiYlW8VMvPDG8xpa6um+k6Mges0DRtyBmMfYz
	qTHCdeVesVz3O1qePPOvQM1H46TdQRZvkLnIGlCKC8myDQ9SVFxIDocjTC6xg7t6oFtVddO
	WjJVhUbh3c0VAXSIaLFLdRxTJhxY5sEenzuiWQPkEbygXT/9qlGHvH7Gr9ycXLs1sCdftpb
	KBjoGTGnfSTxIpqdEfRC/foPkkuPA28guFGfQoLSXIstzTRDhRquYfyMl7lqBEZXgogjFHv
	iVcQNxhsTLTYDCgegOx01/ev82gWVIfB0995avisxduqbs4oA0IsdNIaCK8zg+sHtdo4aPW
	xnd24tWbA6GzZf9sDziYt8OozNzxEcgBSUT0ifAbE5CmReB9MwqANtOMIB4tYZ/v2LqJMPn
	tOKxTbealQRulR2HKzH9MIZV3OzOivsgW7pw3RZX2PA9KRJTlHNA5zYE1uHiZzKDWXNrIUn
	EblgxSc2ktaC92Yq//X08ZxWaGz/WUbuPoIfVqjgn9AReCzcEPEK5xYaeKPy0EoEuEuPj66
	VHA1S51/bjvU9XRZr7Bd8q3MAPO3P4ZokNw18+8vdvcWKp+qbkZ8tkccIxZrWRoZYlqaf2I
	R+v4tFbwLUjHLX3ZkjVXEjA9SnD74Emn69BW81dxOye9emruucnnMGxL31alICp1GPn3usP
	tB6tmpmNKvxNHX8NLsI/HwnMBTeZzgFSOJRXdueX6LEmIcGJlYbY1ESMVzDERj+gKGtEtPD
	HOdm4w4Xa5GD0UdnbCYU88=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Describe the first APB timer block and its counter 0 interrupt so it can
provide a shared clockevent. Connect its functional and bus clocks and
reset, and select the oscillator-derived 1 MHz input for a stable counter
rate independent of the PLLs.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 542bfc0d19f5..c3db90f6bf14 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -583,6 +583,18 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
 		};
 
+		timer0: timer@d4014000 {
+			compatible = "spacemit,k1-timer";
+			reg = <0x0 0xd4014000 0x0 0x100>;
+			interrupts = <23>;
+			clocks = <&syscon_apbc CLK_TIMERS1>,
+				 <&syscon_apbc CLK_TIMERS1_BUS>;
+			clock-names = "func", "bus";
+			assigned-clocks = <&syscon_apbc CLK_TIMERS1>;
+			assigned-clock-rates = <1000000>;
+			resets = <&syscon_apbc RESET_TIMERS1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.56.0

