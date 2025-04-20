Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B054C1C2437
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132738; cv=none; b=jWWMPI5by0V1nNCbCtAL+pV4OGh+zm8/CDrhQIVf/RAhiXR9grv3DCva4qmjkhAO+gCh/a+uavlMKnGSDg9+RohxQb5SFqVuRa6AJafAjcHZSBiT8NnXOenXgO/TPC036sgRvjfRyBGwTLXMGnycvl8BSbRG/iQo+ljp0MKtVsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132738; c=relaxed/simple;
	bh=ihM64sX2+hs/Hqt+UK2WTdRWQIa8EuuoOdmKBDR0058=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9Q9A60pM7xzAi8KrCbf6TNA5KyRHhytKIxc6OHcz5RlLRNqoyp/KCTy4uMXBNaMeXfj3pya+onfNVWAC5VIg63F7jprNT2Y7rVUpuByX+rCuLzDD6h7EzdhXjuVELx02ygm2N7fFUhPNi32/2NgPASZ80kXIyHDksoOeF2ZWyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FYE7Mt7h; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FYE7Mt7h"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7399838db7fso2950102b3a.0
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132736; x=1745737536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmOqJQRui7bzs7fivZ3106VDf78wzGBoncjdDrfzqjQ=;
        b=FYE7Mt7htqiwhyqO7WOBjoZVW3+aVEo7Ci4y0yFQ1bImAw5+HawlXMgSv66Lou31nK
         xS4I8r9FHaWB+eagJ0Fj/jDGnUEIkC5mdUS3Hzjx3aJarzMj8jJ5QAZkiQJidnM5AsyG
         U/wG74iGX5wPY3vRUjWMNu+nbwy66Ly5x2PdCvHAwavX0CyJaxnQ79Hklh95kXvfQaGZ
         ssQ4i5/SU21n0A1txhcmmVBWj3rIq9EcOTKyCvWNupEO7oj7Y5UW5VHj3ceK/8ZwhJPv
         0DIh0vtVCWcueHmYrEwzCG+860IRchMm5C2e59KaTNnYZoIw0qjE7OxgXIPiNoQ38A53
         G+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132736; x=1745737536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmOqJQRui7bzs7fivZ3106VDf78wzGBoncjdDrfzqjQ=;
        b=NZgit8i1/L3f12PgjzVoyxUZQxSpNjymhiYFIVLvo7Qg2ROYL3ikwz93e4aBREX7p2
         fzgl8Pe91+GaQ70NQAalPvZKe5+AjwQoLwx3s1Iq1CJ+DPDXxd/t8GSuApA62kun9XuM
         NCS7Wb8PfR9GO79A54aDY+xe7dA6jz0xbZAw0nKnB62/X1zPn6C8M9L6T6Xmmwaxw+nE
         i5KW67P2plJZrr6Hm7wWLtFf0jUf8D2yUW1tZVzsXYlvTQ4z0LNAu41uh8xWC1RD5NUS
         23j259sBNwUm/fOApG6itOfFsZ5dVX3YLPGdVxd4fQFa9YEf7vt79dMT+Fl/pD6+/p0M
         kliQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5KjuzMznhtKgJTEPgINwyaqunQ5a2ebIxbethjSMERVV5xrkf98yG2RiomDROnNo+UTCSr3576A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSSeYcCJTk30Kse3mzGeVDIPPx3J0UbSaqqlpr7pRNy2LGsOQd
	jA+S5t2SOKgVur83BvVg2SwzMLz85doNzjHX+xIEwZQDtk9netdzgY6sHxhi4aQ=
X-Gm-Gg: ASbGnct5IKf7zAxZlR3rO9PeFieIj4VCq3TTYp8LXiydUpEe3bMaSxfe1Oa31xHyS10
	mzfOhyQ3nVdKpjfuvv3e834O7UBOeeBWjZf2DJ0xiyGvjPuErsbNS8846Qfc8jWmVlntlobjzne
	OzkXOHXZab+YeAzuc3+PyUC//aMHSWrV+ALjZqbbbm7jVoguSfkoUEJ/OltlBiujPj/1F8RK/uG
	N9XcSbed/Mu7YaqkDFzvWP9mbiuWc8hxclrQnEwOJJ51Op1VNSvpnPbntYjTMYiYeyQqICHJtCf
	b1BPFHOcupy76CfZdtSle2vdNyKb4Z4E5UWb1kEq
X-Google-Smtp-Source: AGHT+IHFuVLoWyEV69AHMEphs3R/4V0RmqgjZGMtJgQzyiUWElzohukYn3f3PlJSmIVrROFiyThGIw==
X-Received: by 2002:a05:6a21:3388:b0:1f3:34a4:bf01 with SMTP id adf61e73a8af0-203c9600f8amr11912750637.17.1745132736128;
        Sun, 20 Apr 2025 00:05:36 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:35 -0700 (PDT)
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
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Date: Sun, 20 Apr 2025 15:02:49 +0800
Message-ID: <20250420070251.378950-5-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the option 1 (hence the name pwm14_1) pinctrl
configuration for PWM14 on the SpacemiT K1 SoC.

PWM14 option 1 is used for PWM-based backlight control on MIPI displays.
This configuration is present on all existing K1 development boards,
such as the Banana Pi BPI-F3 and the Milk-V Jupiter.

For reference, a more complete list of PWM0-PWM19 pinctrl configurations
including all options can be found in [1].

Note: Since the corresponding functionality for other pins is not yet
in use or ready for upstreaming, this patch includes only the pwm14_1
setting.

[1] https://lore.kernel.org/all/20250411131423.3802611-7-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Discard pwm0-pwm19 pinctrl configurations, and adds only pwm14_1_cfg

arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86..195eb8874f3c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -20,4 +20,11 @@ uart0-2-pins {
 			drive-strength = <32>;
 		};
 	};
+	pwm14_1_cfg: pwm14-1-cfg {
+		pwm14-1-pins {
+			pinmux = <K1_PADCONF(44, 4)>;
+			bias-pull-up = <0>;
+			drive-strength = <32>;
+		};
+	};
 };
-- 
2.43.0

