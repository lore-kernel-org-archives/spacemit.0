Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B63EDAC5;
	Tue, 28 Apr 2026 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777373859; cv=none; b=lAeMzpEO4r0q7D3yGbSfeK+/1GzjSfLEIk5HGHkf5JYxg/RYDqE6qSkoESzjcbQGC5AJUGH5ps4w7tpbbyA6jU3WMqJB8tjqRo0vGg+x41o6IIC+EQgz7S//V4DfkzEVeIgr3Y0hCb55Nvdt8FDBTPXQpfwfsgGACw7vYP3ekbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777373859; c=relaxed/simple;
	bh=sImdUFiTEcsJdvzgMX0S2OmS7j920K5wziuXQQGFWQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bvd2snTsI41K2HkwmN0LJy5QcmZjZV5qErsya1tix3cX/XJGVpizs1H47Xcuu9Vl8O7OOuzsc+1ojrVTE8JaP5oCZKqprivlgoZanmjE1uWF2ZXx+mwVpEnYnf9CD5xNe3p/Bl3ev+l+kWG0fhoPlf6n+vkP9Fx+hkol+JKBD/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXFcVyUd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXFcVyUd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E68DC2BCAF;
	Tue, 28 Apr 2026 10:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777373859;
	bh=sImdUFiTEcsJdvzgMX0S2OmS7j920K5wziuXQQGFWQA=;
	h=From:Date:Subject:To:Cc:From;
	b=UXFcVyUd66XBuZhePJDCFKvm3Y77H7TcLBc5a/CZ87XcuTMwCFiwpVSJLwFxuf1g3
	 G2/XPPz/p0oJALALcTIRGJAHWDKjvO2w1gDtxOa0Ll3c9vsJDgNHmAVYHpHHZuAB/J
	 fOQL8qVGoQUC/2WUl2m2WwWPDQl77q8aXChbJVsKc3U5cGSqySe/F8Le6Fd4Me+Hj3
	 TIEadrsbRiTBdGM2rFgyhRrCIVwqQSKafhAAGhDGejWhBiUfQfE5oVtdFQBOuZc5AI
	 aw36KKJEVjs+5bPZJRZnK4QlqFamKM0qQg4L0ANBQti68YDHmR+Ws3Fuy4laK45kDR
	 L8MCxcPSCjDUg==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 28 Apr 2026 10:57:29 +0000
Subject: [PATCH] dts: riscv: spacemit: correct 32k clock frequency
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-06-k3-clk-osc32k-v1-1-e2378da7cb9b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJiS8GkC/x3MTQqAIBBA4avErBvwD6muEi3MphoMC4UIwrsnL
 b/Fey9kSkwZhuaFRDdnPmOFbBvwu4sbIS/VoISywgiJwmLQ6I+AZ/ZaBZR9Nxup3bp4BzW7Eq3
 8/MtxKuUD+sOugGIAAAA=
X-Change-ID: 20260401-06-k3-clk-osc32k-198b413afdca
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
 Haylen Chu <heylenay@4d2.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1490; i=dlan@kernel.org;
 h=from:subject:message-id; bh=sImdUFiTEcsJdvzgMX0S2OmS7j920K5wziuXQQGFWQA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBp8JKb4can4DX2EGCETug/6t/HtvRYOvcPe/X3y
 Gy0mPy7gR2JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCafCSmxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1LdQ//fz3qLgK2xl4jCgcTQBwFSGHt2w/qnvoBke6D/sBWr43n/9cRlMwVE
 OZkIvhOITGPVsSbfZTB85uQqOjJODGSb3K2XkDTaQa1BrTD7xH3JdDbfKv8HMMVxLlTl2udl7i6
 JLUy46sqyqfgLiTLO9oxRcQtofjWmZAIVJYTrdozR7IpFrpMQdXzdgj9y5GUNNylkEVCfA4s6a6
 VJ89HJi1AlHoyXuba53lEprGDOPKhaGWHIUXVMGhhePyyse72VN36/tPM+dkj2NN+jd/cq0/g9l
 WUDZ6XyGjOYf99CC9LXLL6pIfij1F/b+yp3MeEV7a3hHF6zyVvgLqnyNV4IJQeKeAjDMYQX14HT
 TYm0bcBjkNlxXJisTJWHeT2mNyoQWaGTWwMs0i8txZ8PnCv6NeQ5FoT1NgdR8wAYEYFq+JF8jRI
 xbWDKBQTCAdfQ0lCLT/ggrfB7iK1utX3djtBlDb7vGTqHRdyDdFdQag/sPn1DDmbMksnD6QBh9k
 gE1Ob01vTF6+C6ikoke72ZQMfATbaCfYyrboI5uc3NlRI88QRON3XfPQzxzTQ5mdV2uzrLd1Qkx
 meMOonposZbPchIeAiHJmQtefX8mAG4aDwbsrhQAfUcB3c6hfxT5/pUZfgisaGFdtnWB3uHDDoH
 EU4iHNnf4oYwgRSw78qnaTuHB+Yn08=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The 32k oscillator's clock frequency is actually 32768Hz, so correct it.

Fixes: 67072c8cd48c ("riscv: dts: spacemit: k3: add clock tree")
Fixes: a6fafa64b03a ("riscv: dts: spacemit: Add clock tree for SpacemiT K1")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 2 +-
 arch/riscv/boot/dts/spacemit/k3.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f0bad6855c97..b0b9c19b56a0 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -333,7 +333,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
 		};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..e6faf8d8759e 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -424,7 +424,7 @@ vctcxo_3m: clock-3m {
 
 		osc_32k: clock-32k {
 			compatible = "fixed-clock";
-			clock-frequency = <32000>;
+			clock-frequency = <32768>;
 			clock-output-names = "osc_32k";
 			#clock-cells = <0>;
 		};

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260401-06-k3-clk-osc32k-198b413afdca

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

