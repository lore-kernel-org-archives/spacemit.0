Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190883F58EF;
	Mon, 18 May 2026 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104716; cv=none; b=rt5Nw+Kpdp9UCsjX1WnaSx6+A5QlJNgK4ccqXvXGSNFZU+SNCQP5UsUkJvg6LmMAr1af2Inlo0m7RfFBO8WuhR22QJzab2uH06+CNVCZ9w638QTkEeqrqZf9xwmnmBJvnsAX3M8vjWjLHjpJ9cC80p5peXdKXS+dQc6LX5hT12k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104716; c=relaxed/simple;
	bh=T2OcJxG9YjtGzQMFdL8racQ46R8Hj63WzawCWTCsqRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HGA2/VcSc6Tjs+/hAsK7eolVkeyGWD6iQO1kBiMmdtfN0tVy2iIgXDfEEoq3Z7V6pKWGbZfQqusSU7FUU2hC8zOLCyEZKO3kcqWTtIo/EIukNe6ZaQ7PIZD/EyzuZky+CJmSodyiZX/QlrISLiK2oHq2cEpmKnyfbr4ZG9Xs/U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZ7Nc9Ep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZ7Nc9Ep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA81C2BCC6;
	Mon, 18 May 2026 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779104715;
	bh=T2OcJxG9YjtGzQMFdL8racQ46R8Hj63WzawCWTCsqRc=;
	h=From:Date:Subject:To:Cc:From;
	b=oZ7Nc9Ep82Q2h1l+q60OCO1bB5VdQnYtn7/XJI9S85h5KuoAAoCB1KsrxiXVkt8iM
	 efwxWCkrSBo0IAiIFVRU1rAJhWbZUIkcLCBV8WK7QIXe6oayv3e4pbP35dTWv/TplM
	 htl0wZ3T3p7BOU94K9JEYx/2dHh2ypY7rhYIpns9F66ADIqaQIDNxcVkU3c9+8JLOD
	 KnguQ5cJ+k3SvpNlrRmJfYcD/25O88l1zpDKSHMjso0AeaqRMyGKk9rfWDQIoONjEq
	 qT4Ut36H3Byi5ujvPwYokPtQltan5sGYpKPK5NtdSPIiLCrxg068cclLnnIgmCdyyu
	 Bv/xDTt65um4Q==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 11:45:08 +0000
Subject: [PATCH v2] riscv: dts: spacemit: k3: Add pwm support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-04-k3-pwm-dts-v2-1-c0ccba430abf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMT7CmoC/13MQQ6CMBCF4auQWTumUwQbV9zDsDB0Cg3akpZUD
 endrbhz+b/kfRtEDpYjXKoNAicbrXcl5KGCYbq5kdHq0iCFbEUtCcUJ5xqX5wP1GpE0tbJRRmg
 poHyWwMa+du/al55sXH1473yi7/qTGvqXEiGhIjNoJnUmo7qZg+P70YcR+pzzByyc8OerAAAA
X-Change-ID: 20260321-04-k3-pwm-dts-1d16258f0d20
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=19747; i=dlan@kernel.org;
 h=from:subject:message-id; bh=T2OcJxG9YjtGzQMFdL8racQ46R8Hj63WzawCWTCsqRc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqCvvGhNWnsYABOxBPl66GWDwp7i+t3OMl0jpSU
 ctZ4/WvcDOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagr7xhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2maw/8D4oMpz/9i6qD6qGkB27Cfq7uU+lvVYjxyRJCk4hXWPykm4tr2XMkT
 0g6q/so/Aehc5kyu6vd4LT+N0WV+SGPhDE8C9jch0a+JGuvqIYdvGdqgWVvjj+z2BPsFgOvUD61
 95jUGO/LIE9uWOa4qDDYRuVo5TgeDMqJqIo4YfwYeYwSZ/GIVyI7jV+wLaGVmCy94ciJkoSnyXJ
 Xl4wk0AhO6XpOlxlv2fVC821mC2nIQHxp9E0S2uM7GCPdjp+A2tJhYp25JOK1nI36MJYhdTTgJg
 Kk//2T/CryHoWFfReRu1c2I/52vLCIgj6FvwyoXCm38VZwthHkpnNpKeDHSSmSTDqazlZS0hqg1
 x4eHEGRfp28jkCS7rJMsy/YjV5kWd3qpmeCu56vkUgr5KjFLuq4d0PVLAQ9KEivxxjUk0O6UMhf
 fWwl46dANzjpwz5urOznzLwQ5ZrT2PbTTzsooU2dJzC31W1RsTjdI7L+aQaB7OSQRR5M758U9s6
 IZnaNLN3pcXCUIeENRK3J7UX89hxGcYgpCcyii+9BGUocw+xj7h2DnPYIIdIvC8TgihGQaDNgW/
 zIKNvTK3+C0Jv8IPD+ZhzZ245aOVUzFPDLgJEnI6bg7mrFQvAxQwqYKAV27+eDLE/vU2AGZqBQA
 ZbeoMBUlJ9+tfnLNeuTdz0cQUDFPSg=
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
Changes in v2:
- Fix pwm1_1 pinctrl name
- Link to v1: https://patch.msgid.link/20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 590 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 220 ++++++++++
 2 files changed, 810 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..06abca6d0883 100644
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
+		pwm0-0-pins {
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

