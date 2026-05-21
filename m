Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9920D4E9;
	Thu, 21 May 2026 00:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323097; cv=none; b=Eygo0xpv8B5rtC+Jaw88sqatQgbT3g9xi90Z4qVZ9NbjoloaDVKQlXVfgst+VLVq9oLeLgDTSbdtXvGCd9ikmlO7l6DXskqR0+xv3uKY8mezG9r0Ij2u+suk9D65M+VPA8yl6dzKO7JOPfqJvf20+QCncMpB1qh9puRes6Ek6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323097; c=relaxed/simple;
	bh=Gl4nnKwURGYf5Q2UqyA0TWXkDSShTEK5B6sQRnloQHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=koP9cedF18lQjAaBbFhLfbjNalNpLyqDGX4noY+/vLlcuxI51zXLDO0Qky4ljozV8lTT5QGKfKYB98hs0Ksp8smfClhwuDwouUb4tcQlDiEhw2c42XooP+ng3VkPj/PIb6UzEcMfKDqh7Csl3p60bMXrNomxNCMdtk74oHQnWto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvtT95RD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvtT95RD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5391F000E9;
	Thu, 21 May 2026 00:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779323094;
	bh=+WYaUkkSYMOJn/e4+V0KJlXczzijCVr67MFTqynTZb0=;
	h=From:Date:Subject:To:Cc;
	b=WvtT95RDXIjlIBdE0J7h1gZbZ0O7BrMcfbSgPQt34uebib2I4JRTKfLML0IpfFKRa
	 vOLd3dhJxZBy2CrA5OL6u7tC3VW6MJpLRbvZ17+s+nLcgmtE1t66iGmILBd+Bb/mad
	 50AU2mW2gQD65cjrq2C9a9QZodLJhPJSzRYcDGTz7CSVixfxPs2gbvO8ZIEQRbOyCO
	 1ZQgQ0M2/6s56xp7cIQbEBrWs1Qnh2nKW6Ecl8Dly6ULwGjIAUJ8Sfx2x2sd62NTHs
	 CRtYG+BvwAEHj5S8OYLbUcEVTK8mMnGsase44txRDYC4jtsQBap2SCPdQPjaEAWjIO
	 rk5/XtnP+yYlQ==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 21 May 2026 00:24:41 +0000
Subject: [PATCH v4] riscv: dts: spacemit: k3: Add pwm support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-04-k3-pwm-dts-v4-1-04d4de0f2fc8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMhQDmoC/2XMSw6CMBSF4a2Yjq3pveVRHLkP4wD6gAYF0pKqI
 ezdghPE4TnJ90/Ea2e1J+fDRJwO1tu+iyM5Hohsyq7W1Kq4CTLMGEegLKEtp8PzQdXoKSjIMBW
 GKWQkmsFpY19r73qLu7F+7N17zQdY3m8phX0pAAUqwEilQeRgxKXVrtP3U+9qsqQCbrnYc4xcM
 imrMuGsrMwf5xuObM955EWelEpluUwL/OHzPH8AjVXg7CkBAAA=
X-Change-ID: 20260321-04-k3-pwm-dts-1d16258f0d20
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20031; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Gl4nnKwURGYf5Q2UqyA0TWXkDSShTEK5B6sQRnloQHM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqDlDQfrNDcqeedckV0s0vDSPvwMLIhZsH28t42
 Yx/mPsBzsyJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCag5Q0BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0C4Q/6Aso6kK39dbknwRLHPAcHKLuut6eqLiFfJ6VutEmMFTWy21FTAO+Bt
 2dyOl3ar8zT53RAFLVKOKrDAxoBZtvuhzjQd/QYDL5ypXdz9PXt6ekcLPReV8LKSJepefBRDULT
 HaumZAi/SMIsA7NUr6Cos1Z7aGP5V8RzQ0+6Ow4B7Le8i9Ge/DJpMc9T7Lj4m06/4bLc7WLmiMO
 YKSzoRkWxzZmPVfpsopPXk2wjWqIrfnGQyGYHgKIOpECzlHEe3AxqdJocKRKFguloTWhaOOAGyl
 SuLCi6NZeZBxcVeS/VCDe3O9u8D8WzgICINf93QhDgIIYOsmUmLmNeU2AG69SSOXIjGI25+x0FK
 srY4aEt4zwsmghNkxnH0q26pAfsQrpJ2EcfnDPRmbCy5hzH4ZQLhC6X7PxCRJG+gTQWHSoLjX7Q
 mAMabuUFBrJQVz65KUwJWxAbD0tbXGRiL9Da4uqbgg9iKn6W1vY1zhZj9dJ2wXLQ0OKpflzu7y9
 ZVnHgr5vxmJIq57mk13XH/TDUmEveu8dr2fMfx29mGf99MXu7STUA4aHySgH/ViOhvcPPrUIuOG
 SFV1LEggpgQMrn4XDZYTCPDjVeXgKi2kA7Wu8+Po0X/nGdnoEBXE4wDmAxwqjptK+X97kfQCQ7Y
 xJCKGQOMLXFdoG/KfNSmFZttKBTYO4=
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
Changes in v4:
- Fix all pwm pinctrl name..
- Link to v3: https://patch.msgid.link/20260520-04-k3-pwm-dts-v3-1-974add67c592@kernel.org

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
index 23899d3f308a..252c64af76fe 100644
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
+		pwm0-1-pins {
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
+		pwm1-2-pins {
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
+		pwm2-1-pins {
+			pinmux = <K3_PADCONF(44, 6)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_2_cfg: pwm2-2-cfg {
+		pwm2-2-pins {
+			pinmux = <K3_PADCONF(96, 6)>;	/* pwm2 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_3_cfg: pwm2-3-cfg {
+		pwm2-3-pins {
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
+		pwm3-1-pins {
+			pinmux = <K3_PADCONF(45, 6)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_2_cfg: pwm3-2-cfg {
+		pwm3-2-pins {
+			pinmux = <K3_PADCONF(97, 6)>;	/* pwm3 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm3_3_cfg: pwm3-3-cfg {
+		pwm3-3-pins {
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
+		pwm4-1-pins {
+			pinmux = <K3_PADCONF(46, 6)>;	/* pwm4 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_2_cfg: pwm4-2-cfg {
+		pwm4-2-pins {
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
+		pwm5-1-pins {
+			pinmux = <K3_PADCONF(47, 6)>;	/* pwm5 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm5_2_cfg: pwm5-2-cfg {
+		pwm5-2-pins {
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
+		pwm6-1-pins {
+			pinmux = <K3_PADCONF(145, 3)>;	/* pwm6 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm6_2_cfg: pwm6-2-cfg {
+		pwm6-2-pins {
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
+		pwm7-1-pins {
+			pinmux = <K3_PADCONF(146, 3)>;	/* pwm7 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm7_2_cfg: pwm7-2-cfg {
+		pwm7-2-pins {
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
+		pwm8-1-pins {
+			pinmux = <K3_PADCONF(147, 3)>;	/* pwm8 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm8_2_cfg: pwm8-2-cfg {
+		pwm8-2-pins {
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
+		pwm9-1-pins {
+			pinmux = <K3_PADCONF(148, 3)>;	/* pwm9 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm9_2_cfg: pwm9-2-cfg {
+		pwm9-2-pins {
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
+		pwm10-1-pins {
+			pinmux = <K3_PADCONF(52, 6)>;	/* pwm10 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm10_2_cfg: pwm10-2-cfg {
+		pwm10-2-pins {
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
+		pwm11-1-pins {
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
+		pwm12-1-pins {
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
+		pwm13-1-pins {
+			pinmux = <K3_PADCONF(138, 4)>;	/* pwm13 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm13_2_cfg: pwm13-2-cfg {
+		pwm13-2-pins {
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
+		pwm14-1-pins {
+			pinmux = <K3_PADCONF(144, 4)>;	/* pwm14 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm14_2_cfg: pwm14-2-cfg {
+		pwm14-2-pins {
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
+		pwm15-1-pins {
+			pinmux = <K3_PADCONF(142, 4)>;	/* pwm15 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm15_2_cfg: pwm15-2-cfg {
+		pwm15-2-pins {
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
+		pwm16-1-pins {
+			pinmux = <K3_PADCONF(143, 4)>;	/* pwm16 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm16_2_cfg: pwm16-2-cfg {
+		pwm16-2-pins {
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
+		pwm17-1-pins {
+			pinmux = <K3_PADCONF(59, 6)>;	/* pwm17 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm17_2_cfg: pwm17-2-cfg {
+		pwm17-2-pins {
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
+		pwm18-1-pins {
+			pinmux = <K3_PADCONF(60, 6)>;	/* pwm18 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm18_2_cfg: pwm18-2-cfg {
+		pwm18-2-pins {
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
+		pwm19-1-pins {
+			pinmux = <K3_PADCONF(61, 6)>;	/* pwm19 */
+
+			bias-pull-up = <0>;
+			drive-strength = <25>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm19_2_cfg: pwm19-2-cfg {
+		pwm19-2-pins {
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

