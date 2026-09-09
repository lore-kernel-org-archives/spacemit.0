Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993636A37B
	for <spacemit@lists.linux.dev>; Wed,  9 Sep 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974296; cv=none; b=sfCCO2PcnFsSlMVFw3AnGudNUmmv1gKnwGhz6LQ2pFeM34OLA1rBjq4gATUToDGF6zVbfbxlXf6xwKi5uQ1CU1wHmUdJlt3/eQl1Zq5XS936OjJUQDHMQ/NDHVj4a3i3epzDILDiA/eQa1h5oJi5/YaxCWOBaR/znLpeS9U33As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974296; c=relaxed/simple;
	bh=QDc002gje6K7aWLD5mFgpduYGKNcugHovytoam+lMFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UaMAUl3rLhpEw6xKKx4xZ2fjCBqY0kl2w/dKAvxlNG/XfCmjHn9+HsaMP6UeFsUo3gB0CP+DZ4FSMuJ0Wsjq0zleiIN84zdJsMvpekrQYhPaZf0BF0WiacGY69wQwbAdttoGoI39BAcfbFaVZvAJoCZRMHc5DtvrB/6RyeuaU6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TJ2W+Tqn; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TJ2W+Tqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788974250;
	bh=c76sxIk2MyNseN85/zKGxITyLpdXrkRXOybHNCV//og=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=TJ2W+TqnsTeMszhggCpv6x9gbGja7eTE2vkqqh0wNc/BUzwwF/HjuS/we1OmG9ge9
	 RFFJANDwZ47whAUQ16QffngqWp7Xf7Z+13lndL1qn9sptULd58EIYjonQYf+gnLJpz
	 K+0tpluBHH++cUitcc6LwbwCNOcS3Ek8vvJW1vMU=
X-QQ-mid: zesmtpsz7t1788974243tbb4275db
X-QQ-Originating-IP: t3l/xZ+UK8oAAH2H6/+yMIshtVubt2OlzVX0oA+Oj+4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 01:17:20 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18037428580804553854
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 10 Sep 2026 01:17:17 +0800
Subject: [PATCH v2] riscv: dts: spacemit: k3: add i2s0-i2s5 nodes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-kx-i2s-dts-v2-1-91f5376c899d@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02Oyw6CMBBFf4V0bQkdBaIr/8OwaMsgo/KwUwiG8
 O8WMdHlmdx7z8yC0RGyOEWzcDgSU9cGgF0kbK3bK0oqAwtIIEsylcr7JAlYlp6lgn2eHezRgAE
 RCr3DiqbP2KXYmAdzQ+vXhW/C4XMIFv+L1cS+c6/PC6Nar5stB/VvG5VMZAlgTWYrrU16flA7T
 DH32mJDPrZdI4plWd7BWd1l1AAAAA==
X-Change-ID: 20260615-kx-i2s-dts-123764c9b2b2
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=QDc002gje6K7aWLD5mFgpduYGKNcugHovytoam+lMFQ=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFkLp8yLvux6KFFGo/3gsbCNtVKXwjemFrcUHuHcGfp3y
 cf0y9lSHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABOxa2Bk+M9QNunRasW4ypky
 GnnqwnWvmx0mRWevMdlrcmKlxv2PlQx/OPob+B59Nb58fsGL1JPlLI/D36fYhraWmM7v1g649u0
 YPwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbAzHc0GI1FmwWWRVC4Dc/OJbjwiVWGpNIutPo9CEaArCAIlq5Dg7RPK
	xJ+xpyfmXiJ75DH19QzHSkbKn+zH8Pj8oedMuBX3sCtffRO6pf4eEzoiQTMv0LCztWE6StM
	64RxjY+5qbZK38QufGAP31/+HfUiv52yZDQJ+Gx/Z/CecWSpBWcmwBm0trNE+uxEdYB2Jod
	K1rtkQDa5BnSNon+aJO0RPSOmXl8sghD3Upv6M/pMGB51zQqrpcK/k4BJxYaHfp+gF4mX4q
	s+ETFQfNVV4uSuNKJZzjZUDEitnQJfHSgvAoEGDRmvfgJ+pOkJS9vsEQhGQq4IH8oOqwYzZ
	JAnqRW5IEp9E+A0od6lixb6SmNpx8JSg+qGu/t9U+4odCEQx1G6SwDdXZVTA1B+ONcR3NH9
	zw43/KNGHT3T9wfycNn24/elp2+Prk1VUwCFchxKCUnYIJs97aZuQjU/gGVZzCGvzG97j47
	dFQ/C08ry4lh8WeYYAaJWLwotDD3B7MSVpbT0AP0faNOK+uZ+MOyBq1jZ9pgPV/UKmgrLR5
	NlANbkz2LKaAc5G27tmN3ptKkeG1OY3Cerh7aLX8Q7L4R1OYLF/ACDn5THwOgeVBTHR4WVO
	Mb/X6dCXaNBMmwQdFKYkhTe82eA8cMqAh5gu4Poe60eUPtThPQkfVVNt/eMKtOsJvAQjva6
	x1JUO8zk1YFCiXOnr5oWQW+zZ1KpWEzMWxaI0U2E1bpofprAWQOQ5yb12xGO4Ws5fboaugt
	X8zT1PPheQBJsz79D01lWFf3kcwusmco4HrqidHIIjenV32woRnI1a6TO2JtBdabj1L9RNn
	cihrAVm+UREbAZopSxsMSPFsxzFLpjNIPExAJwmWLf8ykuN5+P1+o8TY0Zz/n4PxBuTJ6Bx
	xn0M1mxFJlPXdg4X+Th1XSVmWjX7CFh4gJdUE7R+ZNlcTq+6U3DMfysPNPIu2vRHu3MbpRm
	MBGlP53Yk50Qh3hoL2cK7vu4QK89V2lBOhZlED1XBeQ1P6zJ12ywjSDtPLXMSjo2p1s2zNr
	kXWIzcoJVhpEnY7fOGhUfECLOuQezutfFGoMoZDCuZJB54RILGj7fMDopPiv9PUIuCgWx3J
	VqYj7qpaigQkEr++ppOyIc51kxEzqfCK6nH/TP15hMRqJeoigL+mfA=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Add the six SSPA-based I2S controller nodes for the K3 SoC.

i2s0 and i2s2-i2s5 each have a dedicated per-controller sysclk
divider, so they use the published 7-clock layout (sysclk, bclk, bus,
func, sysclk_div, c_sysclk, c_bclk).

i2s1 uses 6 clocks (sysclk, bclk, bus, func, c_sysclk, c_bclk) because
its sysclk is driven directly by a DDN (ISCCR0) and has no separate
divider stage.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Yixun Lan <dlan@kernel.org>
---
The DTS patch was applied as cd01c677869a and reverted by
1f5d8228ca2c because the SoC DT branch lacked CLK_MPMU_I2S_SYSCLK.
The clock binding, clock driver and ASoC dependencies are now all
included in v7.3-rc1, so this submission has no cross-tree dependencies.

Arnd requested resubmission after -rc1:
https://lore.kernel.org/all/cec87950-f0e1-49f8-9a2c-f8b87b460da2@app.fastmail.com/
---
Changes in v2:
- Rebase onto v7.3-rc1, which includes all prerequisite clock changes.
- Drop the already merged ASoC clock-name fix (4c69d04958ec) and
  six-clock binding update (ec926b3bcb49); retain only the DTS patch.
- Resolve the insertion conflict with the new SPI nodes by placing
  I2S0-I2S3 before SPI0/SPI1 and I2S4-I2S5 after them, in address order.
  The I2S node contents are unchanged from v1.
- Carry Yixun Lan's Reviewed-by from v1.
- Link to v1: https://lore.kernel.org/all/20260721-kx-i2s-dts-v1-0-d22cb6cfaab5@linux.spacemit.com/

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c0..f2ff9f02249c3 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1140,6 +1140,85 @@ uart10: serial@d401f000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@d4026000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S0_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S0>,
+				 <&syscon_mpmu CLK_MPMU_I2S0_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 21>, <&pdma 22>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S0>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s1: i2s@d4026800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4026800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S1_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S1_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S1>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "c_sysclk", "c_bclk";
+			dmas = <&pdma 23>, <&pdma 24>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S1>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s2: i2s@d4027000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S2_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S2>,
+				 <&syscon_mpmu CLK_MPMU_I2S2_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 56>, <&pdma 57>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S2>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s3: i2s@d4027800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4027800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S3_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S3>,
+				 <&syscon_mpmu CLK_MPMU_I2S3_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 58>, <&pdma 59>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S3>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
 		spi0: spi@d4040000 {
 			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
 			reg = <0x0 0xd4040000 0x0 0x30>;
@@ -1170,6 +1249,46 @@ spi1: spi@d4040800 {
 			status = "disabled";
 		};
 
+		i2s4: i2s@d4041000 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041000 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S4_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S4>,
+				 <&syscon_mpmu CLK_MPMU_I2S4_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 60>, <&pdma 61>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S4>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
+		i2s5: i2s@d4041800 {
+			compatible = "spacemit,k3-i2s";
+			reg = <0x0 0xd4041800 0x0 0x30>;
+			clocks = <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BCLK>,
+				 <&syscon_apbc CLK_APBC_I2S5_BUS>,
+				 <&syscon_apbc CLK_APBC_I2S5>,
+				 <&syscon_mpmu CLK_MPMU_I2S5_SYSCLK_DIV>,
+				 <&syscon_mpmu CLK_MPMU_I2S_SYSCLK>,
+				 <&syscon_mpmu CLK_MPMU_I2S_BCLK>;
+			clock-names = "sysclk", "bclk", "bus", "func",
+				      "sysclk_div", "c_sysclk", "c_bclk";
+			dmas = <&pdma 62>, <&pdma 63>;
+			dma-names = "tx", "rx";
+			resets = <&syscon_apbc RESET_APBC_I2S5>;
+			#sound-dai-cells = <0>;
+
+			status = "disabled";
+		};
+
 		syscon_mpmu: system-controller@d4050000 {
 			compatible = "spacemit,k3-syscon-mpmu";
 			reg = <0x0 0xd4050000 0x0 0x10000>;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260615-kx-i2s-dts-123764c9b2b2

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

