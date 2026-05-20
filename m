Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA4D345CBD;
	Wed, 20 May 2026 23:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321017; cv=none; b=fFT01UIZ0mIe5gqXtBCRJCjEjYmwDuZ1hCa9b3zp68dAXaNgCCMVHIJkJf67U/xspKiG+6o9cQt+EjIlZOBn8UoVYCuEFAP9SNcmR0t9/qa2CcGHL+jG+mGID6qbN2w9bQ3DtQUuDnH0K8GXXCETf9SnHQzN2OXYbRwmaDUUu+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321017; c=relaxed/simple;
	bh=AbbSz4LthpMXKRACSrwXbomjYt9uXXl5/u2EyMaNhik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NOXj/w7Wfat1Zcf/qcQbstYdpqQ3UH20+NiuX0cyxp+bSIIrO9rPGcTKvkJR8XOKVN3FdJ6/blxEn7s5rkvLM++D0emqmrtYGzMaSTAttOo6wBirvLdb8EVHggSU4qjvLjg+T+lKfv/JwX3pKe+zviPf4LdlLvfMTeAQyeyBr0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2VptDsE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2VptDsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86BE1F000E9;
	Wed, 20 May 2026 23:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779320997;
	bh=xjuAmu848cUm0BYqU0QDEvIwlbDtmRBEIx8pj1h/PmA=;
	h=From:Date:Subject:To:Cc;
	b=O2VptDsE3qKaTvMs3fQgzml1/T9tFGIJkZIhS8NsN7WTJVWOe+vGM/PgnW2uOaB4Y
	 X7aqaq+YyRyghGgWvtQia/Qr4iDX+Ol3vK/koHwiuWXpPddZ6ReRoezmyucb+qFWNJ
	 CHmUXWuxDwnXEtaOH5JIfJXWFOxwaedl+MfSesI8o36R9fceMUFOpqNcmK+bC4sWDo
	 t6bg/kzSKzwspu58vlUb9lg5ZJH4qVTARzeDA3eaNvRP7NhpEuwpZGqb73JTDs0V5r
	 24rgWfxbbsLWUxJOnjEpe639q2aOKp5bLuc7doloUc9agM2OHQuM9mS88SRctb1eBd
	 XrZwAXOxO/WxA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 20 May 2026 23:49:41 +0000
Subject: [PATCH v3] riscv: dts: spacemit: k3: Add pwm support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-04-k3-pwm-dts-v3-1-974add67c592@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJRIDmoC/13MQQ6CMBCF4auQrh3TaQEbV97DuIB2Cg0KpCVVQ
 7i7BTfK8r3k/2YWyDsK7JzNzFN0wQ19GvKQMd1WfUPgTNpMcFFyKRB4Dp2E8fkAMwVAg6UolOV
 GcJaa0ZN1r8273tJuXZgG/974iOv7lQrcSxEBQaHVhlCd0KpLR76n+3HwDVupKH5ztc9FyjXXu
 q5yyava/uXLsnwAb/oG8+oAAAA=
X-Change-ID: 20260321-04-k3-pwm-dts-1d16258f0d20
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19891; i=dlan@kernel.org;
 h=from:subject:message-id; bh=AbbSz4LthpMXKRACSrwXbomjYt9uXXl5/u2EyMaNhik=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDkifdhsibj89zHEJ3r00IBL55tQZFcmRWw7Ey
 ZKjJnpTYfeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5InxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3xzw//S3A+59heJxeQDvhliK9FQto3pvPYgPeM0Qx+dPFYrx2hOiB8S8u0B
 2TupJS3JsrV5/JN2xjWPjW5QNwdxoFFzDnajNnKwkgzt8HF/PIs1pquzVousSrVYx951/iJ6OJ6
 NGaNWIawgvT9/5LtVkwbgKNvQO8eANIIz9FPeRrZkUUp5u8wC7SS48OjwGeqpkoPETb/61JKsZa
 RFTsq5s6bNQvnOtYINybD/W0IOU8/m4wd9q8vvm6Sk7cKxvhBiX9KF2I31u+mE7XZvnvm8lqWND
 LppxWaz9iAlF7jH4CgtclJa4u2W8wNz2RPlMn8fZItSGRqxzjeOXWerekBovrKfzjZDfpVgEgIn
 /MYJ9R++t7SKcTig0M/PzqTxdTwKDfIfzIbBBKEy2Gcw1KlrjuSCNKY0rIphbY8OnCvQP61LwKW
 aqO1ehHQcvjd9jcXFoBGSE0ok79T8Ulx1VDEFbH0kvnyM1BeSfb6LEpnlfoPpZAv/xJE9ygDsY7
 DU87Vxs4MGnmuYYok/6eOfQu6PSAUFMxzdrvjU25gMxvOkWIthheFaffxlrvitOWIxL5o7J6bYn
 poyUeMqun/45XlFVUml0apc5O2U7ffkwUKuLcvEzCojr2brrGv44iKCsRaQicMIbKBIgK73dwwx
 xehn/6JXk+ghXEQaD6Ld5mx72bAgfA=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

Populate all pwm device tree nodes for SpacemiT K3 SoC, also documents
the pinctrl info which would easily help to enable them in future.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Although we have not enabled any specific pwm device in this patch..
but should be easy to achieve that.

For test purpose, we've used pwm11 as the instance to test functions.

Please note, to make PWM work, it need to pull the change of K3's pwm
driver which was already merged, see
https://lore.kernel.org/all/agbgG00YENm388dd@monoceros/
---
Changes in v3:
- Again, fix pwm1_1 pinctrl info
- Link to v2: https://patch.msgid.link/20260518-04-k3-pwm-dts-v2-1-c0ccba430abf@kernel.org

Changes in v2:
- Fix pwm1_1 pinctrl name
- Link to v1: https://patch.msgid.link/20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 590 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 220 ++++++++++
 2 files changed, 810 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..28cb0490de3b 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -56,6 +56,596 @@ i2c8-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm0_0_cfg: pwm0-0-cfg {
+		pwm0-0-pins {
+			pinmux = <K3_PADCONF(0, 3)>;	/* pwm0 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm0_1_cfg: pwm0-1-cfg {
+		pwm0-0-pins {
+			pinmux = <K3_PADCONF(42, 6)>;	/* pwm0 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm1_0_cfg: pwm1-0-cfg {
+		pwm1-0-pins {
+			pinmux = <K3_PADCONF(1, 3)>;	/* pwm1 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm1_1_cfg: pwm1-1-cfg {
+		pwm1-1-pins {
+			pinmux = <K3_PADCONF(43, 6)>;	/* pwm1 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm1_2_cfg: pwm1-2-cfg {
+		pwm1-0-pins {
+			pinmux = <K3_PADCONF(95, 6)>;	/* pwm1 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_0_cfg: pwm2-0-cfg {
+		pwm2-0-pins {
+			pinmux = <K3_PADCONF(2, 3)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_1_cfg: pwm2-1-cfg {
+		pwm2-0-pins {
+			pinmux = <K3_PADCONF(44, 6)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_2_cfg: pwm2-2-cfg {
+		pwm2-0-pins {
+			pinmux = <K3_PADCONF(96, 6)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_3_cfg: pwm2-3-cfg {
+		pwm2-0-pins {
+			pinmux = <K3_PADCONF(134, 4)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_0_cfg: pwm3-0-cfg {
+		pwm3-0-pins {
+			pinmux = <K3_PADCONF(3, 3)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_1_cfg: pwm3-1-cfg {
+		pwm3-0-pins {
+			pinmux = <K3_PADCONF(45, 6)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_2_cfg: pwm3-2-cfg {
+		pwm3-0-pins {
+			pinmux = <K3_PADCONF(97, 6)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_3_cfg: pwm3-3-cfg {
+		pwm3-0-pins {
+			pinmux = <K3_PADCONF(135, 4)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_0_cfg: pwm4-0-cfg {
+		pwm4-0-pins {
+			pinmux = <K3_PADCONF(4, 3)>;	/* pwm4 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_1_cfg: pwm4-1-cfg {
+		pwm4-0-pins {
+			pinmux = <K3_PADCONF(46, 6)>;	/* pwm4 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_2_cfg: pwm4-2-cfg {
+		pwm4-0-pins {
+			pinmux = <K3_PADCONF(136, 4)>;	/* pwm4 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5_0_cfg: pwm5-0-cfg {
+		pwm5-0-pins {
+			pinmux = <K3_PADCONF(5, 3)>;	/* pwm5 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5_1_cfg: pwm5-1-cfg {
+		pwm5-0-pins {
+			pinmux = <K3_PADCONF(47, 6)>;	/* pwm5 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5_2_cfg: pwm5-2-cfg {
+		pwm5-0-pins {
+			pinmux = <K3_PADCONF(137, 4)>;	/* pwm5 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm6_0_cfg: pwm6-0-cfg {
+		pwm6-0-pins {
+			pinmux = <K3_PADCONF(6, 3)>;	/* pwm6 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm6_1_cfg: pwm6-1-cfg {
+		pwm6-0-pins {
+			pinmux = <K3_PADCONF(145, 3)>;	/* pwm6 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm6_2_cfg: pwm6-2-cfg {
+		pwm6-0-pins {
+			pinmux = <K3_PADCONF(48, 6)>;	/* pwm6 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm7_0_cfg: pwm7-0-cfg {
+		pwm7-0-pins {
+			pinmux = <K3_PADCONF(7, 3)>;	/* pwm7 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm7_1_cfg: pwm7-1-cfg {
+		pwm7-0-pins {
+			pinmux = <K3_PADCONF(146, 3)>;	/* pwm7 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm7_2_cfg: pwm7-2-cfg {
+		pwm7-0-pins {
+			pinmux = <K3_PADCONF(49, 6)>;	/* pwm7 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm8_0_cfg: pwm8-0-cfg {
+		pwm8-0-pins {
+			pinmux = <K3_PADCONF(8, 3)>;	/* pwm8 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm8_1_cfg: pwm8-1-cfg {
+		pwm8-0-pins {
+			pinmux = <K3_PADCONF(147, 3)>;	/* pwm8 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm8_2_cfg: pwm8-2-cfg {
+		pwm8-0-pins {
+			pinmux = <K3_PADCONF(50, 6)>;	/* pwm8 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm9_0_cfg: pwm9-0-cfg {
+		pwm9-0-pins {
+			pinmux = <K3_PADCONF(9, 3)>;	/* pwm9 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm9_1_cfg: pwm9-1-cfg {
+		pwm9-0-pins {
+			pinmux = <K3_PADCONF(148, 3)>;	/* pwm9 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm9_2_cfg: pwm9-2-cfg {
+		pwm9-0-pins {
+			pinmux = <K3_PADCONF(51, 6)>;	/* pwm9 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm10_0_cfg: pwm10-0-cfg {
+		pwm10-0-pins {
+			pinmux = <K3_PADCONF(10, 3)>;	/* pwm10 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm10_1_cfg: pwm10-1-cfg {
+		pwm10-0-pins {
+			pinmux = <K3_PADCONF(52, 6)>;	/* pwm10 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm10_2_cfg: pwm10-2-cfg {
+		pwm10-0-pins {
+			pinmux = <K3_PADCONF(141, 4)>;	/* pwm10 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm11_0_cfg: pwm11-0-cfg {
+		pwm11-0-pins {
+			pinmux = <K3_PADCONF(53, 6)>;	/* pwm11 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm11_1_cfg: pwm11-1-cfg {
+		pwm11-0-pins {
+			pinmux = <K3_PADCONF(140, 4)>;	/* pwm11 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm12_0_cfg: pwm12-0-cfg {
+		pwm12-0-pins {
+			pinmux = <K3_PADCONF(54, 6)>;	/* pwm12 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm12_1_cfg: pwm12-1-cfg {
+		pwm12-0-pins {
+			pinmux = <K3_PADCONF(139, 4)>;	/* pwm12 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm13_0_cfg: pwm13-0-cfg {
+		pwm13-0-pins {
+			pinmux = <K3_PADCONF(55, 6)>;	/* pwm13 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm13_1_cfg: pwm13-1-cfg {
+		pwm13-0-pins {
+			pinmux = <K3_PADCONF(138, 4)>;	/* pwm13 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm13_2_cfg: pwm13-2-cfg {
+		pwm13-0-pins {
+			pinmux = <K3_PADCONF(13, 3)>;	/* pwm13 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm14_0_cfg: pwm14-0-cfg {
+		pwm14-0-pins {
+			pinmux = <K3_PADCONF(56, 6)>;	/* pwm14 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-0-pins {
+			pinmux = <K3_PADCONF(144, 4)>;	/* pwm14 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm14_2_cfg: pwm14-2-cfg {
+		pwm14-0-pins {
+			pinmux = <K3_PADCONF(14, 3)>;	/* pwm14 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm15_0_cfg: pwm15-0-cfg {
+		pwm15-0-pins {
+			pinmux = <K3_PADCONF(57, 6)>;	/* pwm15 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm15_1_cfg: pwm15-1-cfg {
+		pwm15-0-pins {
+			pinmux = <K3_PADCONF(142, 4)>;	/* pwm15 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm15_2_cfg: pwm15-2-cfg {
+		pwm15-0-pins {
+			pinmux = <K3_PADCONF(21, 3)>;	/* pwm15 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm16_0_cfg: pwm16-0-cfg {
+		pwm16-0-pins {
+			pinmux = <K3_PADCONF(58, 6)>;	/* pwm16 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm16_1_cfg: pwm16-1-cfg {
+		pwm16-0-pins {
+			pinmux = <K3_PADCONF(143, 4)>;	/* pwm16 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm16_2_cfg: pwm16-2-cfg {
+		pwm16-0-pins {
+			pinmux = <K3_PADCONF(22, 3)>;	/* pwm16 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm17_0_cfg: pwm17-0-cfg {
+		pwm17-0-pins {
+			pinmux = <K3_PADCONF(23, 3)>;	/* pwm17 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm17_1_cfg: pwm17-1-cfg {
+		pwm17-0-pins {
+			pinmux = <K3_PADCONF(59, 6)>;	/* pwm17 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm17_2_cfg: pwm17-2-cfg {
+		pwm17-0-pins {
+			pinmux = <K3_PADCONF(105, 6)>;	/* pwm17 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm18_0_cfg: pwm18-0-cfg {
+		pwm18-0-pins {
+			pinmux = <K3_PADCONF(24, 3)>;	/* pwm18 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm18_1_cfg: pwm18-1-cfg {
+		pwm18-0-pins {
+			pinmux = <K3_PADCONF(60, 6)>;	/* pwm18 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm18_2_cfg: pwm18-2-cfg {
+		pwm18-0-pins {
+			pinmux = <K3_PADCONF(106, 6)>;	/* pwm18 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm19_0_cfg: pwm19-0-cfg {
+		pwm19-0-pins {
+			pinmux = <K3_PADCONF(25, 3)>;	/* pwm19 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm19_1_cfg: pwm19-1-cfg {
+		pwm19-0-pins {
+			pinmux = <K3_PADCONF(61, 6)>;	/* pwm19 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm19_2_cfg: pwm19-2-cfg {
+		pwm19-0-pins {
+			pinmux = <K3_PADCONF(107, 6)>;	/* pwm19 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e6faf8d8759e..e331adbcb11a 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -797,6 +797,226 @@ i2c8: i2c@d401d800 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@d401a000 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a000 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM0>,
+				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM0>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@d401a400 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a400 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM1>,
+				 <&syscon_apbc CLK_APBC_PWM1_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM1>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@d401a800 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a800 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM2>,
+				 <&syscon_apbc CLK_APBC_PWM2_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM2>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@d401ac00 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401ac00 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM3>,
+				 <&syscon_apbc CLK_APBC_PWM3_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM3>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@d401b000 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b000 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM4>,
+				 <&syscon_apbc CLK_APBC_PWM4_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM4>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@d401b400 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b400 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM5>,
+				 <&syscon_apbc CLK_APBC_PWM5_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM5>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@d401b800 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b800 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM6>,
+				 <&syscon_apbc CLK_APBC_PWM6_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM6>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@d401bc00 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401bc00 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM7>,
+				 <&syscon_apbc CLK_APBC_PWM7_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM7>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@d4020000 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020000 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM8>,
+				 <&syscon_apbc CLK_APBC_PWM8_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM8>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@d4020400 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020400 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM9>,
+				 <&syscon_apbc CLK_APBC_PWM9_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM9>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@d4020800 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020800 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM10>,
+				 <&syscon_apbc CLK_APBC_PWM10_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM10>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@d4020c00 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020c00 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM11>,
+				 <&syscon_apbc CLK_APBC_PWM11_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM11>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@d4021000 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021000 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM12>,
+				 <&syscon_apbc CLK_APBC_PWM12_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM12>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@d4021400 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021400 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM13>,
+				 <&syscon_apbc CLK_APBC_PWM13_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM13>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@d4021800 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021800 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM14>,
+				 <&syscon_apbc CLK_APBC_PWM14_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM14>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm15: pwm@d4021c00 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021c00 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM15>,
+				 <&syscon_apbc CLK_APBC_PWM15_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM15>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm16: pwm@d4022000 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022000 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM16>,
+				 <&syscon_apbc CLK_APBC_PWM16_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM16>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm17: pwm@d4022400 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022400 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM17>,
+				 <&syscon_apbc CLK_APBC_PWM17_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM17>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm18: pwm@d4022800 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022800 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM18>,
+				 <&syscon_apbc CLK_APBC_PWM18_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM18>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
+		pwm19: pwm@d4022c00 {
+			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022c00 0x0 0x10>;
+			clocks = <&syscon_apbc CLK_APBC_PWM19>,
+				 <&syscon_apbc CLK_APBC_PWM19_BUS>;
+			clock-names = "func", "bus";
+			resets = <&syscon_apbc RESET_APBC_PWM19>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k3-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x1000>;

---
base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
change-id: 20260321-04-k3-pwm-dts-1d16258f0d20

Best regards,
--  
Yixun Lan <dlan@kernel.org>

