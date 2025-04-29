Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E05C2951B9
	for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 08:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916720; cv=none; b=P1/mr4sX1z4fEqw3/ToLWIRsDtlw8rMhIzKDVZFf51vdrXawmEmlzPIbTpgu4l5WEOT99k3gEK3T7FGhQlbr+H9SDaqX3tq+3KeuqkQ0hKyWaXKlwXnc83yqz+wqYBj8TJgJPmFF5G+MShmpooMDqQ2Ddm1bqq/HoblrhXKt0lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916720; c=relaxed/simple;
	bh=J4NuNn/tXwp9sQqsV0iWm0NCqyaD25RTgEa4ZmPkOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJSmlpMJRzajQzV5EtmklYFt2WQhBWQceerrSNjiG9AYK9i2NnSL6Jie9iLSJTi++o49CZC+GRd0c1nFlNe1lasBQEZ9rURMe3u5fmcPQkBRK8inbDyd4keqPc1KgkIizMm940ViLuC8zhGL1ICVOTXmYqQhZc6zKOnxCEeK+Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mWiwIEYg; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mWiwIEYg"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7396f13b750so6340714b3a.1
        for <spacemit@lists.linux.dev>; Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745916718; x=1746521518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=mWiwIEYgF9Q+K+lZU8mah0T6vyrquWup65vcXerxAM1I8ubYLNoFCNWGsQNn3V8g9q
         xos+Gy7U1Y0ht9+itH5zeZsYYv8isUOhPIuUxCg8AWablsa8ZrbedS7BBI+IFZol/0Sf
         hLi8H0Je/CkIpHedF8koctdwkvkFC2W/akFnDQbyH4jGSMKXHVizZl3atNHS1ERJkZVy
         X6BhhWa6nn2bNHhINjrpG7gqW0INJnApbGG5RoxmvWu6di2smvJvAi6nC/DCrb79/Mxm
         pn3Pt8riaBMu517OAS+a8JZ3F1cGs5QVdbV9vctpoMWNv5QVt9uVdnF8zFfceGk27wlo
         mIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916718; x=1746521518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYS2eMiVk4Xt0bu0VrX3eSLEVjDrDZlAzYja2cax6VM=;
        b=tuPzO7Z3Ad5EvOKBDYJT6Suv8BLWDXjdAXfgbLYMis3e6FmhTPm+UPU/kRQi3Ulqew
         5nSovVvFUmtmGlnarTBrsauy4ToKFZtZ3+FQxwjZMXUdZbx3MczaMw3b0nwih6+BC2h9
         T4/EgSMHM4c3/F4Tuz8jaDJQMrYFLIbGx+3ik8UiMKaAp9mDeqjssP21pAy/obtN3SiP
         9iZJvsB2wSwvVRBLMMgnm6zfz8q9RUPksv4XK9FeesxFzjMA9xn2RTM0KC1UmtvdYxIh
         gYM4AMhPe6kpSa/xRz32yOlLKtlSUcXzuO7XZVevE0rJry/VB0bhuTTWfqP3+ZA7K4IF
         gijw==
X-Forwarded-Encrypted: i=1; AJvYcCVRn+DRV0qO4tNpaDMB3U5acJckVFc4exm8ssk7DIeypJ4MUxwidrkBLv9aP5YbeRydyoWiTc/36g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlq0X6tTylisUtdyLYugp0Sfx3lEzjkDDnpNIz9j6EqMqUtG/f
	0TkBg+DnX7mHW68PtLFgkd/RnJULcxzESuKQZ9+skKST+Sts0mc6ghCUVobQ3Rc=
X-Gm-Gg: ASbGncvEzerc4xPbsZ7lH+zPf+gIU2hKyoBrPqrMNOjuTDKNxNmkEREUKvKzio4TrT2
	fCLQUYqch6eq1RydCpGZbdZmVSMImqRQQqtyjcm0GbGJFyEtzAq97AT3x0a8gYZGv3KPoKq/xeV
	6G7VHjgZYciGOeRuoR6l9L3cLULy/X7UbZEQKytqojPPev0dpJH4Q3GZuEKbah8CvwGHQiAXkJU
	QK5oCIm/pPA53gRr7ncxZLaPNBD7PyAr4HJ+Dz7RekCuQOabAO0nfHggk/se6EUvv5JBGIxgba6
	EOM0i4IwhPl15vUv2i2XOJcXfcD1PX0W7CJsJRYr2zYFGnC6jGDsnfZkNzluFIq55yMkm7ITiqn
	7Nztx/dk5oRK53cQ=
X-Google-Smtp-Source: AGHT+IFY1/NJQY1EBeDwxCimqA2xJLyNhndajPdetd6CnjlEWVopEm9ixDmG0zsCZTOnJTyyL/yb/g==
X-Received: by 2002:a05:6a21:3a41:b0:1fa:995a:5004 with SMTP id adf61e73a8af0-2095aa9a073mr3324411637.26.1745916718351;
        Tue, 29 Apr 2025 01:51:58 -0700 (PDT)
Received: from localhost.localdomain (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597e0bsm8550119a12.44.2025.04.29.01.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:51:57 -0700 (PDT)
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
Subject: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Date: Tue, 29 Apr 2025 16:50:46 +0800
Message-ID: <20250429085048.1310409-5-guodong@riscstar.com>
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
v3: No change
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

