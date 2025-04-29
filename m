Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016FE29CB45
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916708; cv=none; b=c2iMf3NXCR1uwK2v+qcXoXbSPG3LLh7LC46g8yGGhfUH87rE34uDPAy0typ+m4IL2jSroqAub8sKHeP71/nc0M9cPvAcxCiCQ4gEz0tkwO896NMYlhjgYkTkZsUTp+ieovf9VvfVDrMwe2r8hv6jmQSiRWgu9oV4X7B01vxWiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916708; c=relaxed/simple;
	bh=unz/GArn5oq7rBFAQN1e0CgDX1gyE0iTVCyPB09o4uA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+BffFgx3ilzbE0pWOK5K1pwQ9ZRPZu9y471SoRZylTIGp+TOmkyUO2XJrHVcm2fGqE36U2KYGFugrwlnzNPJpAMnPatd6/y5G3MukZY1shMcMLLN0b5tcx8y0EbIq1k+JPUixbGqlsDG1LykKMsP2dTeZbr5aFHCmG396Qf8cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qYz5NAl8; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qYz5NAl8"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so4402938a12.0
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916706; x=1746521506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQiOfIT4Y6cd0OqbpS97ZsP9HrOyG2drOaiW2vvWtVw=;
        b=qYz5NAl8FSgOIRGy/76mUNO00PY/gSkramaUS3lXvkuRHYfxDphI6XB8XJdylWYnY7
         5DCqkFfK8vnjPPJ2yor385AVmv+Ps6x2xSaH8MtDefO3cbJBrCZVidKMcqtQ33ZbsYju
         hEFIBXLdFe2PQ5UWL74J2J6Kjlacu/WjjqKB4E8cSb16ByY0pqefWdUgiDXNhN0WrNgI
         i9hlYbhUBRDUuMfo+E2xns3poiaVwNjVB2g+Zwmab3DIwJB9pFJbN3ly8oCrVUdjXHvQ
         OX5DPPsjRzD/JvolLpy1sdhbRQ9R0I3q24hVeywyrmel0dZrjYl/oPD6xXjEGA8MMVqv
         KcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916706; x=1746521506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQiOfIT4Y6cd0OqbpS97ZsP9HrOyG2drOaiW2vvWtVw=;
        b=kCRXsa9dAk13JwuggtKZJVomjUVRmRYxPtc6dxk360QamqHMofucFdjEEBbEusweDw
         JqZBz2RJgXuqq8U+dt1D0lMNfWiklzxaL3OvpSadR1rMomLVndSA8As10SrxUOrDc8Az
         +JutZSl/6j5w/ym4Rl9MEKukGTFZ73IMxAae3D/T+BK6FtT6jGvwbvAi+UgHZUT+pe5j
         tQ0jcjmmcSXsGBiAhTZcREG1L/fftIxdO4ysFf7iVuMXTh9ntThaF/tYMFkoztzVKGT1
         6npykYZR6Nqn5j0erKGQ3B4yTr+stVMV/44RzvtfGaOlNYOYske1gqs+Iv88r0jWVfzo
         XVhA==
X-Forwarded-Encrypted: i=1; AJvYcCX22dXc8cOPnH6KTOes4MCcdMwsUmbOtD/PEjjuTI8xs7QLm+UqBVNeh9d+R8Wvvq+hk/68b3L8Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws7nD1Czr8LYGbps8WPE26Zj8Ab9kyRxMDnwySZZmN3YtUFXEL
	HjygXiRtDCJVNrMD3gLhJv7cz4Pt3iM1oiQm/vbrZFrRgKabC1keQDAW2jWJDFc=
X-Gm-Gg: ASbGncsUZUlCmc9ay8uMgy2WKp5fnA6MMpTNCC5pAb+i2ZLFSsqI9u9PIlM8be4pME7
	yttLvt8bBZeDcSFGLiqcZH3LxVMya/TnxDOLa7D2Ev6HsTi9SVh3R+GUIdCRtdj8UxTFlO25gbj
	7PXaesxqhNYnD860v/Uh3UFjwP25rm+3Yb7nq7V0knPTQyuV3q09N4q3h11ztXXCvhutUqMoZ8o
	rCZf2n694y1jt7Q450Xaw7czvSLrBcomUP0SLyZhzSyrsgk1Hq6sl1meTMkm4mUxN8uR/PaC8A1
	uNWdjyXut62ns9EjUaDAuaTm8rOYy1l5i4+ElPdgpBT/ND6e2htpufFUbKTMe2s26e+LQA68iXi
	hlyql6XuxSEiEsTw=
X-Google-Smtp-Source: AGHT+IGMNd2BwqPorstDPO+7WDARX7h5Gi5J8S+MkMkte/NeVmwAhf3z+Fk/S8vbtM/Sb8c+7Ms4+g==
X-Received: by 2002:a05:6a20:c6c9:b0:1f3:397d:86f1 with SMTP id adf61e73a8af0-2046a56a58cmr15449500637.16.1745916706277;
        Tue, 29 Apr 2025 01:51:46 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:45 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v3 3/6] riscv: dts: spacemit: add PWM support for K1 SoC
Date: Tue, 29 Apr 2025 16:50:45 +0800
Message-ID: <20250429085048.1310409-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429085048.1310409-1-guodong@riscstar.com>
References: <20250429085048.1310409-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC features a PWM controller with 20 independent
channels. Add the corresponding 20 PWM nodes to the device tree.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Changed #pwm-cells from <1> to <3>
v2: Changed compatible string with the fallback marvell,pxa910-pwm

 arch/riscv/boot/dts/spacemit/k1.dtsi | 180 +++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index f4afb35dc6bc..99bf7a3f5458 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -580,5 +580,185 @@ sec_uart1: serial@f0612000 {
 			reg-io-width = <4>;
 			status = "reserved"; /* for TEE usage */
 		};
+
+		pwm0: pwm@d401a000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM0>;
+			resets = <&syscon_apbc RESET_PWM0>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@d401a400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM1>;
+			resets = <&syscon_apbc RESET_PWM1>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@d401a800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401a800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM2>;
+			resets = <&syscon_apbc RESET_PWM2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@d401ac00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401ac00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM3>;
+			resets = <&syscon_apbc RESET_PWM3>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@d401b000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM4>;
+			resets = <&syscon_apbc RESET_PWM4>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@d401b400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM5>;
+			resets = <&syscon_apbc RESET_PWM5>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@d401b800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401b800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM6>;
+			resets = <&syscon_apbc RESET_PWM6>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@d401bc00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd401bc00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM7>;
+			resets = <&syscon_apbc RESET_PWM7>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@d4020000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM8>;
+			resets = <&syscon_apbc RESET_PWM8>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@d4020400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM9>;
+			resets = <&syscon_apbc RESET_PWM9>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@d4020800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM10>;
+			resets = <&syscon_apbc RESET_PWM10>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@d4020c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4020c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM11>;
+			resets = <&syscon_apbc RESET_PWM11>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@d4021000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM12>;
+			resets = <&syscon_apbc RESET_PWM12>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@d4021400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM13>;
+			resets = <&syscon_apbc RESET_PWM13>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@d4021800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM14>;
+			resets = <&syscon_apbc RESET_PWM14>;
+			status = "disabled";
+		};
+
+		pwm15: pwm@d4021c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4021c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM15>;
+			resets = <&syscon_apbc RESET_PWM15>;
+			status = "disabled";
+		};
+
+		pwm16: pwm@d4022000 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022000 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM16>;
+			resets = <&syscon_apbc RESET_PWM16>;
+			status = "disabled";
+		};
+
+		pwm17: pwm@d4022400 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022400 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM17>;
+			resets = <&syscon_apbc RESET_PWM17>;
+			status = "disabled";
+		};
+
+		pwm18: pwm@d4022800 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022800 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM18>;
+			resets = <&syscon_apbc RESET_PWM18>;
+			status = "disabled";
+		};
+
+		pwm19: pwm@d4022c00 {
+			compatible = "spacemit,k1-pwm", "marvell,pxa910-pwm";
+			reg = <0x0 0xd4022c00 0x0 0x10>;
+			#pwm-cells = <3>;
+			clocks = <&syscon_apbc CLK_PWM19>;
+			resets = <&syscon_apbc RESET_PWM19>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0

