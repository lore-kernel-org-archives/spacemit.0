Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4F01F9F7C
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749777118; cv=none; b=cTAbBM25IISDTF1djNCXrcYkprn0bQbRE2Dutz1Olj/ahSwhlBhRaGZxYr9SNpzLtw2xQoCTGhL8/nmgtnHFQBioVl7oirPWUA8Hdded+JQyFn9ZApA8qt4PRbS3FcuxReh3eBlUEj8PhrTlgOGH//VD5c47Or7gxAtOtB3JkbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749777118; c=relaxed/simple;
	bh=ofhrWzbkHpmkRBFTa000gjfyL5s3fJzmMKuP+Rinp2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/+ELNz4X1mp3I+vMu3TkM2Sp1iaAB4jJMQDunww54W3j6HyRA98etJmWYBl2DL+JGCUYBAPXLID4K0Rr6n+/wHHZMZtF05OvFpNZBxwolyTkUUy7lllId5Gva8/ElogfllRXwhkphCIFY1vKfUD6UHyStz5t6yJINTnEqpCunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QZV+ohU9; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QZV+ohU9"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-610dfa45fa2so916068eaf.2
        for <spacemit@lists.linux.dev>; Thu, 12 Jun 2025 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777116; x=1750381916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=QZV+ohU9jqm36eS6UEYx2alAj259jcID1GVEJwA9AVlkOnmh7Y2OWgETS5kP6QwbZY
         UtrtcqAz6Ebyp6j/pz5C3VfIDKo9t7uIUBUkIa36HD4Fw9TxAD5wNLspogtFACHbMJv7
         nAhKKvv3fmH3tHcBXTkjok+waB9zs1CWlp6CccA/s/v1JZyAOHhm1oEFU1QlIJhBta7F
         +eCse/Cl90Own4VrUjH0q0V9IHfiSguzFoOBF7qG/dChXf3qfBUBNJvDMevjqayf6KMx
         W2vsSjo2ta+G4P5OQ8T7PRt7VPn0v8QU1vWx1M0y+96B8x8TGxyYFGtWQHJ+VpAEKnDE
         rLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777116; x=1750381916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=Ql89Ep0T8ONjKrnoJphg+1RYlQapbCU8DIylcPb/ZgmJK2Lsuid3bdApx38pdJPbFq
         Dpv1CfTa2eIhRAYp/wPkXdN/M/oDtAZ8eP/LNVtJcnshhNKJe3wK6cigoDRL/CYSpMQZ
         pQEuWEn8QvtEZpcZYTBrAbaGCa3LXoDi78x+8FmqR1o4QifGuKetBm4hEPPHYAr0W/l/
         JCcCaoc4yGfqmzMudw/HdT1JG1Vnv5Vm4uDwyhfwAkYXq7ZL4Klx+PYrGtDjoQOg/j0I
         5eq1MV6Y1GcaodAv5n21a5LpuH662xpt8AZQnOfyUc9jmkdrw/t0AhZqco0KxpjDAGS3
         cZGg==
X-Forwarded-Encrypted: i=1; AJvYcCXR78OeCdY3Hv9tJnAqibTnp0WutVaYPy3+NDowXLxjdhxeMXU3ss041MWhu+AEe+XrVCL34wZRRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM9SRbJowK+r4BEJeZiD9RvpncrTUbrAPyKvhK4be/akDU/w8S
	IY52q1lbaHW69cRJ/zyg+BgpCjiKW6kVAbF90PFqxEUiIceGAOAk+tomMpoGUjPvX8g=
X-Gm-Gg: ASbGncthAvKi3Oloa8UR+TcN7Cuj7VQayfesf1iYjLjKwZMYG9aSeY/AbxGlWYVehXG
	+Zlzq4ymCrLb3/8Nfz8USf+PHi2Yq8b57E4Pv5Rh9dG66zATOlnvuRl50iK1nHiGKRAkF656vwT
	Bmzh2O/Hhj+zxdJWDDbwn7stGqgINUBx7YH1ROxzlVRNWWjHSBFLIoWcNe5Ads8sIQs22VouOHx
	6pGR4tX7IcXsEwUwtuI//YacqfHNpvcnqoYNjXYOTT6oBpe1Uz2EG9c3chOU9UvPri0uliqvpb7
	xPwu6TyjARzfB7JCIcD/3hqB/SJT1KnW7600a7J7Sz113TtbM5YStCgNcalYq2cHG0x7sVx+XJ2
	70ZlYQJLM+ua4jyK2kSMSMLQ63Z+X5oM=
X-Google-Smtp-Source: AGHT+IHLGWUc6QmwDBxYgPL11fCgmmDxgrSTZTWJDq5NM0vixs6NHFASZt4TXSVYr14kHaayK453+w==
X-Received: by 2002:a05:6870:ce88:b0:2ea:d491:eb45 with SMTP id 586e51a60fabf-2ead510a3fbmr744385fac.18.1749777115684;
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 12 Jun 2025 20:11:38 -0500
Message-ID: <20250613011139.1201702-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..de403bda2b878 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

