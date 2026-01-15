Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D8309DD2
	for <spacemit@lists.linux.dev>; Thu, 15 Jan 2026 06:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460002; cv=none; b=eFKXHskCzFsuGC4JKr3aM7IWzL83fabwtGoHruAcmiDDpgdMAWGFxnL42K9X7J34ySFAjE+w9gy9FE6K+ixaI2ZbO+VuQtyKYNWJsOYGUvG/mct9tgdiBj0Fh50tWteGSJDa/W1d8eBcmi9aGsaS+ULaCwPl+Rr2TRGhSHzJrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460002; c=relaxed/simple;
	bh=QjJKkTUz/26FCCJorplE27fDB3J4K9QRmD2HajPhw84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uamqQG2G1CQ+SJjUcfKTThyIKJc3tNCkcI3z2piJeiq1Q4cTKWGsL2zP8UCAdP9KG4cM+CH6/a/y685N/j6F4T5pioo4abK5ef44tJuZ1PNNAIPZRX5/+jTVh2d72uJ8CX8atWbaVjn0sHfF7dxwOmVRrBJtlTRZvjxf/7gU6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=uQECKgrD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="uQECKgrD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0d52768ccso3949895ad.1
        for <spacemit@lists.linux.dev>; Wed, 14 Jan 2026 22:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768459995; x=1769064795; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN4w43030nBMnmCgDRIi09REyeuq/cQHIYBn+3h/zwU=;
        b=uQECKgrDZb9QVMcxOel+g2v5SSQMgZFm2uU9xkmVkWhghRTHFV/fzjmVv3YyZ8NRSb
         mh4rHrguTRLi7XYCoEhHjt3nhRAapJxOfBNIFGV+jJiD65vBs5UbaprK/CTKlwdibReC
         AueW1Gv07BFrSmw+z/6b1pxKuXI2cx4yNKCiEciSeWRrGhgkArDjU5jS8eTn3w5B7D60
         YpMpi+XtRfunCNkHxt75ulGluGCo1vT+v4XleXRFnwS/b/UZMH+Zg+Uawr0ZvqeoIvle
         vfMwr5kPc7DrdNOSLnUpaTXDqr6fCj+2kdH5pKJXB9uWJvY7geOdSykeb+7K4swPpNpi
         29GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459995; x=1769064795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JN4w43030nBMnmCgDRIi09REyeuq/cQHIYBn+3h/zwU=;
        b=C1F3JI+eVuuo1ubYVXWrTEBzn66GN/gYc07t/p+ZzY3iWkeNuYrk04GJxzakvJnKjo
         xfrFP9+50nYTd2+Hruj54ZIB6S4GRqSWqD5Jm5JIrJ2tt1LYpCAteA1/xarvlYXxC0Fu
         TxoDDBxp/0yQMeP7VyHJuIKMl51AU5douGeVZcyF0cT6WC5QTBGd690gK2M9T3st6RZg
         SMaEeqeQb7u5YvaA/AeUt0qXIcI2ilj7kSqCU7OL7eTfgwwJfSM0FnGuG2rVghiIF9Tb
         T4+A+YY5w1PZW9m5JoOEsy2/k05aEcHZdZH/M38csJkMRes+UIBgHscUaHY7gzJiIoC7
         Rmlg==
X-Forwarded-Encrypted: i=1; AJvYcCXqP11R5yrpNiLq566edqVqwupcC7kqKS4/5ri9ldzNogjT0o0/8pVotlOhOSlicHqTkXI9MfQo7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwqxRi2b+fEOAHYZQmIQfer54R3lYgtcslKvlJkk/9noW3NeMdO
	6PRPcMw1LjezDpDzAnYVohPnxbGBl7LrZpO0peuoJDowBes8dZKtHqv19rCbiZ0+h2Y=
X-Gm-Gg: AY/fxX7KrpyScz5EFQsv5qcVp5f/2uc4vxq+J2pwEmzM48IxxmXlSiOLA/cWnhJ20Il
	SCsbwRAkIqCuuwPcwMrm7e5PjIUo4bb+3mlQfYRqka0aBhJkmBogjNvw4iyOIQg79yuptNj71zE
	Zv0DYt4aFL8ZXzyRDC4anvVm7vn2fQnLXiiBwaeLoTU8OrvSh7UxolAztVfMb12SuZPaplTpmBo
	SoIvlwNbN/xz4C5m1ZgeZ+Xt1dOCgWFlS4515iv6xCHccwU1Nhoyna5OXSOsgWwN2M02+o4NzlK
	0ebNWek+KYU3mX/aA0Yt9HWnely6tGo5izf9gdtekNn75Zvu2J9wOKT9cZHwnUBRPfR0C6uLNCg
	R1ntnhecE5sO6CNzyVnNjIPOwIbQzMfK3xdZO+4L7rnFESPbwcqwMyciPinE2+aWYS+GuU3fWke
	FDmpD14zXJz35kFrDKM2GSwFOJ3mtNBIlN37YgjuG0RuGwnE+NV4vvAw==
X-Received: by 2002:a17:902:e94c:b0:2a0:c5b6:67de with SMTP id d9443c01a7336-2a59bc43586mr44946485ad.52.1768459994844;
        Wed, 14 Jan 2026 22:53:14 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e7a3c6fdsm235081015ad.15.2026.01.14.22.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:53:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 14:51:46 +0800
Subject: [PATCH v5 7/7] riscv: dts: spacemit: add K3 Pico-ITX board support
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-k3-basic-dt-v5-7-6990ac9f4308@riscstar.com>
References: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
In-Reply-To: <20260115-k3-basic-dt-v5-0-6990ac9f4308@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>, Thomas Gleixner <tglx@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v5: Update the commit message subject per Yixun's suggestion.
    Remove the unused aliases.
    Update the copyright year to 2026.
v4: No change.
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 29 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1..7e2b87702571 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 000000000000..b691304d4b74
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2026 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include "k3.dtsi"
+
+/ {
+	model = "SpacemiT K3 Pico-ITX";
+	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0

