Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867086;
	b=eJt3bweCtmbzL7sH2vZumooL4UCTjVZkILOxX/a517VwxBhFdhOEo9oKPrm+Q543vsc0
	 hCH3izs0YxV7RkAtT6KXZaPW3cEa+xGmVbTwfFXDaZlCnLxFvndY+G3xMG4Wjiw3s3Ugr
	 R5MBAOFZAQKr9UgFv+TaJl0x+h7759V7fQ4RBYrftqfo2EcKXS2t698euwcNtyYTr93if
	 im8UqOmAa/pmZNsomdouW0q39OfLNlS25xXUNESjPEP0HBVPv5zbBFacmWo9aPj3JR2o5
	 oUdxhy1DzH9DSe17AGUyaz7ZYvM5X0MkjBtUqWe4mL2QAHaOm4TLbrGj7KJudxxXgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867086;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=AP0zRsZ9xsH1/txX8W8F6xW2ty4IlAtLIMu5KyXAlxg=;
	b=Jzq9XLqEqoqcDjBz+g6pgjCz3+ei2tGlVF+CsOHFh9GGDkm/DpCTK5Mfv6/rjAz0wPN1
	 uhE+pxCfM3u5u7uHlgrKdTnOX1E7YaWIgNskfW0yn27IzJg78C/lXYu8Tx/F9rg1D/DvN
	 PkW8wVxUE7kVfyZJwCaStuPBQHBKRozl1I+nolG0K1rsVbzWYr+9uxKzuspWk9yKi1qoS
	 1pwnMW4ckU3GrKjvyU6/Q+wQs3JNM3Q3N+8eozh9LOnFngrPDlJuflavDCoE5Hv31P0wZ
	 5A8O+G3SqHGqdsbWx2Z8r8rPO7A7rjfNQZLjBX5APcSUxlmaP/ICbFQJyYtaqtmW/kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fV110O3u;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EF606A31B
	for <spacemit@lists.linux.dev>; Thu,  5 Nov 2026 08:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 988EF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=fV110O3u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867046;
	bh=AP0zRsZ9xsH1/txX8W8F6xW2ty4IlAtLIMu5KyXAlxg=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=fV110O3uo4e3D76xP7mofzd7HKt4j62w1Mg4F3MnDICurpwG0Fjn3/v0PmnU9Kp1M
	 AcAUUfzUZhw3oAA3KcxLgNzhgcOsQCd4LqfC6gRhPKQJ7q6i2PyiZFc5tHZKL3OovM
	 ceC7GIMldThm0FT9u7er6a3q+SHrMRn/vXV8ZUM0=
X-QQ-mid: esmtpgz14t1793867044t097a89bc
X-QQ-Originating-IP: bfC0YRYM6S4tUriZljan2rXWt1UUFrNrbDpzva5BQSo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13664405851354263933
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:48 +0000
Subject: [PATCH 3/5] riscv: dts: spacemit: k3-com260: Add SPI NOR flash
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
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-3-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=BqkZaDMkvSW+3nj/8yfgq4f+zkX9e4PcXZEkcZcCU0M=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEUm9z9SMv/FbyKj/Xzf16MNJ6R9XPhMmr63+VfP5
 fSoXMzaUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMBHLFkaGPcwxq+yWVZQsDPH2
 ZhTY+1O784t52t7WqIbUD/HL99tKMjIsTJeJWcTjKSU3zV0869bUbTyP2V7HTthjfSHCyHvhLSF
 OAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MbuzFk2nEjG+5OAbDusMCcPFJlp929TRXA+NR5awNZuZ0I9jiMSpAaNP
	QElvP6Rz7A8wAJ8JCIXjLU3/WKFoL2so23DWI0qyYsSBpeAw9VmRkNvbQFip7Nm1LDqUGq+
	NyUwgzxaK3n9s9qELDQYB0reS/gjfFEOoz7x+ACEKxVG52aYvggciDRKo7+NGSHMkFWj3gq
	wVZHmEKv+Fjs+3XrBKTsUlQgad3qNV9NDDKhWvrJFyQR1JGdt1SUUb5yRTbJTilWmr4Zjye
	cKVbyf7HQUCEAjhXYVTxymyCED8aIEpS+6amZrHR4ZIz7k1S4+17MjUMOtuTt/K2xU2geJE
	KTVOS9SJb9ogvo11EGyIpIxyp4uVHPTabj8pwUqbsAvTauWbnM5vG1pENeixYup38+QlsqH
	9II2ngJEokNp3E/g5wpr5NS0WBP0Y24Xiika0eFJKmNbUTmMmXc4M1sL6vR0ahndlibsE3K
	Pod6Jkm+uVB4G+9bakg6zt8YYCxu01yJ8z36u6t4asrIG5jKMJThPVmu5DotNqTywH6Qk7A
	rycsW/z51DV9pF5vUEKOXhpu4SK+XSYyjSAATs1yg8DvNCHKP1mx+gqkbNkgymuY6iARpIq
	InbE3ubHcn7AWuG8nRgoOXE91prLMkMwdjCIjreXkaYDS02rdskt3oZ2HMNKgVdxw6OOlL3
	e6kRz8qrxBy6lv83yPr+Lpnivma1lvFuVT+Wj8qVrQruGlQzKk8xvCcvmEYP7yZfzlboyhh
	IWKQiqOHvDdvppVBOfVyNs+0X3kQXjV4V4E+fh9+wZeEmv6n62nWrnw/waiVk0GfwfwtExM
	krUEpQLzi2ekreffx8yLyJmenRkddAvQoBuN44cIjBEq7NDIdy+6zGd77yr6i8IxHJmJxvf
	S8PNPlPjz0nJqina/nnjmW7TYab/bGTU3ETDMUwt86CO6diveahgNvl/np/aKix5ctqUxvB
	PDyZ7Fcgw7U+rDPGgWMLHocQkuuXmhrBZ1GkyjZaoMBYz6YvG/lvLuS8mO40vwEKVrxcs5K
	khY298Fz104MpKXkLeDIg30a8tMJzx2DnmNpZHK0byCS07qwixZPMMpLB22FVllabsdx1AX
	izxFcb5K7KO33W7VmZFLQfhK8reiJXzkfb8miSTAVF6eqmFao15SwuoJqjUvx/TskdjmW85
	aiR3HGk/lTwCn1JqzdDPONu2rQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The K3 CoM260 module carries the SPI NOR flash that holds the boot
firmware. Enable the QSPI controller with its 1.8 V pin configuration
and describe the flash together with the partition layout used by the
boot firmware, so that every carrier using the module gets access to
it.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index f2df797a2c80..f94607cb2eeb 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -233,6 +233,61 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&qspi_cfg {
+	qspi-pins {
+		power-source = <1800>;
+	};
+
+	qspi-cs0-pins {
+		power-source = <1800>;
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;

-- 
2.56.0

