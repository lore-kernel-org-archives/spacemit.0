Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04441B361
	for <spacemit@lists.linux.dev>; Mon,  2 Mar 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464449; cv=none; b=ZsJPetWi3iDaMPhz7r2xouLJGJHs52ImRRjPMlirle5AtXEwdA9FoahGZm36qSmiBzrqIi2TLaB+GoE0SDdrg5Ah15uE4INo0kDJk/9poEsyuG2CwWj0uGWhi3+nX+Q6pEKWLJ29wsiFcbdV2poZqOl19cl1+KVL8A7qPSEu36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464449; c=relaxed/simple;
	bh=dcEFhqPvKdwQuanA4mTY4Hc01u8XbBg6NksC+/+CuBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dwb7O46fgWdipFm7SJfTbni2RdgkDdhvZT+44U1PmZsvPrO+Wu/fyGcabfidCKyUq1MVsx0TcyoQ9HvzZgK/4S1wJu7+dfroc0UsydetiyEBijjPN+w2FMEuQ0dxRpiOMG3dL5afdTbX58wTpwAHf/H5o0FFSdAE3aXsmcp14kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njn4qYQD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njn4qYQD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so34300535e9.2
        for <spacemit@lists.linux.dev>; Mon, 02 Mar 2026 07:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464443; x=1773069243; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=njn4qYQDtAcEhHdGwQuueT/4WUuyytfVd62CSrXHFsQDWRxpDLLPslO2mU68/G8u47
         NfdHy0fNxs2PZ4t1aw4fzYTdvMBSac8s6E8pCJFI6oJaAg1Citgie0/eQx2FtR8w8NRg
         hPmSJz5gngL8wHNEY83MDbB5GIB5Fs8FYLh96gOCJt0K1tr42htuH0u1BmkiFKD2d6k3
         CKmJKgIzclbWoo03i2TNZy2LwaRqE44Hu+78JUlO6j1X8eraGXXj5Ql2uMBgn+NZDn14
         R0NBPy9fchK/pElBGjr0DlU70QGOMHLL0Lu6/W07wqngNKvuZmicCZruCCDbgTuyRNXk
         rgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464443; x=1773069243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dz1rwkI02gKLCCAejR8NRcSe9CYDdLI50V/yGcp3k+8=;
        b=OzQG/LbZDOALzSw+jJX7KtfmE7iHZsSXxKXhvZNVRjWxu7SGf8XEmz8OtWNcRmgU9P
         pvZGpT1mHpbbhbVZLgatmSXn/EYyCkH1Tk/yVLOGezuyjGOaz1xwf9838BnIcGssSXeb
         Vnn24dJqNEKMAm9fY1lFhUcthMQmCVJBvjhypbIgJZ5gx5kVGBdSNpVHZsRYMYLWzmdq
         OV+9ZXDoDnDJEzruqi/sPG4jVobs2Z1vM7MKA/rVo4/hKpaZ7pmJTPPqhxRhESHMXep8
         oTxZCd3poYoN+JgdNNHpcigF3s+FWv5fu0Z9htp1jkOYL7puY5puourgjsITGc0w7B7r
         EmMw==
X-Forwarded-Encrypted: i=1; AJvYcCWdQZCIqVgxKyePJSRH0+DPOA54zjGZb9ZE7vuwjuUc3YU/MOFFDqxrEHOM/Fg+T8DsGNFVca5HKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJG7bVe+jw6r+gnGPp1PlAmZwpWolhCWaoUpAjk37PUEx+fgb/
	yxx05zs2d10i19MpNfks1CRVFdqiMYTf8ESNNzapKEpkdITdkveodvIV
X-Gm-Gg: ATEYQzw1i2g9aPyBUQ5cp2oAJaKpY2cWClJSh/oQG4v9fXAt0CLyruvDIpUPuwodxuZ
	og3hQ0MhwzsH89oiojmFwd0XQZ8Qmfx6w7AFBh4GkugvHmI1tV9ttocJOCEoOZkYmZT34ndoYqo
	df/4Tu2M4v48Q34f3yuNCXFFiZ1JzIwR4RjUOzXKTBWrAXZdLI8qqlOSfBImh6CnNH8J8jWhUDf
	esq53MOQAreepdeIEgxBeddv4kLkjl6p6mOgNP3vUgZsUMbxVJesdN6WHw5WOgUp89wV21aRl2y
	lbtOfMWB7QqG592r23b0UtbXBrBhVebxc9KWfwziMYE+eNJulTW0X/M4FgBfMSIBVAhLAJAkToZ
	XrYHCByNBsjSQl1iDmQDPFyHGYv8am3lMhJf7MUKQWWh6iAmkXBzGGE1krsQE2jEu8W7NV/Yewq
	X9LY1bIAd9448fX2QzEUmjxWrbr08DrbHgGwF7rAfUXaR4Ifjr/Ulp6YNfJ1WmYwuZrg==
X-Received: by 2002:a05:600c:4e16:b0:47e:e414:b915 with SMTP id 5b1f17b1804b1-483c9bb6564mr218276695e9.2.1772464443134;
        Mon, 02 Mar 2026 07:14:03 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:14:02 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:29 +0100
Subject: [PATCH 08/10] riscv: dts: spacemit: k1: add SD card controller and
 pinctrl support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-orangepi-sd-card-uhs-v1-8-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add SD card controller infrastructure for SpacemiT K1 SoC with complete
pinctrl support for both standard and UHS modes.

- Add sdhci0 controller definition with clocks, resets and interrupts
- Add mmc1_cfg pinctrl for 3.3V standard SD operation
- Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
- Configure appropriate drive strength and power-source properties

This provides complete SD card infrastructure that K1-based boards can
enable.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 40 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 13 +++++++++
 2 files changed, 53 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index b13dcb10f4d66022d27307de73a6ea3287e97441..8d82011f1af666fb78c282a2abcc0cb88f962053 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -570,4 +570,44 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	mmc1_cfg: mmc1-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <7>;
+			power-source = <3300>;
+		};
+	};
+
+	mmc1_uhs_cfg: mmc1-uhs-cfg {
+		mmc1-data-cmd-pins {
+			pinmux = <K1_PADCONF(104, 0)>,   /* mmc1_d3 */
+				 <K1_PADCONF(105, 0)>,   /* mmc1_d2 */
+				 <K1_PADCONF(106, 0)>,   /* mmc1_d1 */
+				 <K1_PADCONF(107, 0)>,   /* mmc1_d0 */
+				 <K1_PADCONF(108, 0)>;   /* mmc1_cmd */
+			bias-pull-up = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+
+		mmc1-clk-pins {
+			pinmux = <K1_PADCONF(109, 0)>;   /* mmc1_clk */
+			bias-pull-down = <1>;
+			drive-strength = <13>;
+			power-source = <1800>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23eb2a93c04e9ccd3f22a01c4cc4ff..1e9e4f4f41c196326f20c0e5ae6721ea85ea5091 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1207,6 +1207,19 @@ emmc: mmc@d4281000 {
 				interrupts = <101>;
 				status = "disabled";
 			};
+
+			sdhci0: mmc@d4280000 {
+				compatible = "spacemit,k1-sdhci";
+				reg = <0x0 0xd4280000 0x0 0x200>;
+				clocks = <&syscon_apmu CLK_SDH_AXI>,
+					 <&syscon_apmu CLK_SDH0>;
+				clock-names = "core", "io";
+				resets = <&syscon_apmu RESET_SDH_AXI>,
+					 <&syscon_apmu RESET_SDH0>;
+				reset-names = "axi", "sdh";
+				interrupts = <99>;
+				status = "disabled";
+			};
 		};
 	};
 };

-- 
2.53.0

