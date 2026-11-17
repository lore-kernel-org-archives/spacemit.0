Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908758;
	b=h1TVV6pJ19tR94rScybzU0KqTsjuRQula6M8l9CdLgcavWVMEA/ZEC3cEQXgS1W3dyEi
	 S/Je84lS/l4pXx9PCX76nllAeOfaWHHCbDNvnh8Jpe6eNMsjvg8b7oHq07eRIAIFwWu5a
	 sN/cYkNUS1OUy6W/eTr9ZzWgrZk/w28OytmkAhYp5/I3iT9Biuq59ireg8kVq0/VH70+0
	 usHVJh3KZ6se1pSzhgbghNw4Y7Kar36gZtLWw/H5ywXGXxvzW4TUF3vA75ZvavsdGiGE0
	 iDBNSjB3SKF+tB1LQfzvwveH+7vd9BPzHeCk64p2RMiluxR1eqIoxZsb6TqBRE6KMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908758;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	b=1j8VpVosrmFm40iBp1h9PyHS2irj8DjkQc6z3zmYvZsP82LYLZCc5nKYMr1oeesVoG3s
	 yQ+2ahu2mt+znCYbvxfhnNFoWKUvvRBZei0rgjJP8vsYos5LDyA2xbTme+Sr+lcdGPnzx
	 XQGdwo/Np3hcYPjFRJruC2Hjd0fKNa1YhcbnX4YlY2ttMez9HR9tX9OdTF6hvqtwF1ofk
	 NXMy43LcwTHz3Yj6eYPmMCT6C4vpiM1Xkqs+G9nOysAseSu8TObtXBWnteCPZmz4ME0wo
	 dvZ8QHo00ZVpYdQPPsac5FUiXS5yk0N8ymCKuJKoeVVoSp6HNSKik9J8kMSFsfo7QUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=sZdgYVpU;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E4D606A32A
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 09:45:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E4D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=sZdgYVpU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908729;
	bh=pOH/pz5YI6n5r4yeSn21B/P2nSnkvlBqbg8UUHq5vZU=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=sZdgYVpUJOYrzs2SoxyKM7If0LqoVedJ5OYlse3/WBG9fGbJqukvBzAO7Lqxj/B5W
	 9Y+Cecj25mWmvST2SbgLBb62Slp8H8pTyW1EWG8DB2xDezxRXbdmlrtnknXk/v+L4+
	 b3dUiPDxDJbTHsq+yhg8V4LJvXmP/IGQxQsxv1Ig=
X-QQ-mid: esmtpgz11t1794908728t9ebeb6f1
X-QQ-Originating-IP: GEu/9t1WGpIJN4mjgOPuwdHRUF2MxTJkCqGcgSUWFFo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14707964283917326851
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:11 +0000
Subject: [PATCH v2 3/5] riscv: dts: spacemit: Add the K1 APB timer
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
Message-Id: <20261117-spacemit-soc-timer-v2-3-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
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
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNQUQ14of2oovHZSc31Ky/moebkHtzbe9Uq8tEj53
 KTjfNE8HaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNp2sLIMNtIVP5x3a03T6LC
 43KT/2gap07ZxTLxtHt7+MJUNvM5lxgZLrq6iIp/djS7l7BE6fHL2c+yXLL8N9swSq69Yf1g99o
 PHAA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NGr+XrDfX66uvRAgLxMSeNjir3oXI+hMfzSSbsWdj++6OhWzindqeouE
	JHt/y+EqNrznjw+ZAxU+LDAEsVCApkEL4MnP8EpuntZrYkn7QS9HmmP0vyRrcE6K8bQV5L3
	EKZbthcAetVuu+xXAMf3e2Qt7jszDHbwJAvRgPHMgfK259FRKSgzNLtefgf/2oFcvz5KKfV
	guJzqTLeEf9Gr2JykUr/KD5IQsUAvc+27uftaLeDBQ4r1d/bxxF/OTnohcss0huudosyeEE
	FhN8AlLfl23Lytugv1YXXtmP2qFxOcEVuq/Sah5Nuy7d7fNsoLG4NeBU8wYKstYhhmbDphj
	u5AqFNVak8vMmWtMsIT3PctbF73Sh+MQxU1dckddMLgyW3W23TdVFm2QW+se92IO+KN9PnP
	5xirT0cYTpn+twPY9p+nSEDQYR4k3tdbMM4+P39BGZpzrJqBZ/FgfITKVNpCFMzx09NAHrn
	CWlvlbYeNwIFnxvPxHKamLaT+keRIs3j/qd9LRId2pRm9SG0czmKyp3fulinBevHTfnomEr
	FZcngtBIb4X6Q8sv1WX3KGbg73CLtnJT2tfULGeaSaRQQk6KpVfYaF3oooBdAYBDirJxJNF
	XwK40fZk/i2TxW35A5cuk6rbrGe5/fKRz2skYuL4IBRlvqhO769c/m8UDG+CgH3O7YRFZ8Y
	JO2M4AbcXz/pB5LzPp4qp5mWdJq6OrwtQR2EcxAJZqoXGQR4yDvCF/+ryszIuMAbjJwjNaB
	GYWGC53d6rMKjktyKeeH0vHezTxgWee3q/wGeajn+JnA6sq8tPIjE/xfgxlRA1vaV2lyrJx
	/ewwdAhtsEzuie6j0S24aheWWsveTGvWFlifSTmk5Xi5YO6qwxllYIu0PATizbiEr34muAL
	oQHLyptqVsKVEpPUcw5psgNyzhRlUEYw1hQSpxFVOfNyFH0KYCmD4jHseZI7dlJEKBIYLwX
	52mUhiPNDgE1dEGRFbKA1knRDrmWti/lkzC9s5Kt/QLfbFzHjjgU9rDN2lqtuhcwzSn674V
	Jatl4rHG309IIx6jD+dl6oUnY8vuh/HUZx2tVZ4RV/lnPKKdL4gNaJulJoEAt57bWm3v8aJ
	1v0EgAUOiMlxGzEP85rOLgCAvA+hf0MtRiTfgryvbY5
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

