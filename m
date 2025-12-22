Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C32EC0A7
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766408924; cv=none; b=CasUE9Vnc3B+mx4FPxg/Asp8cG7mwXUdOu/7r53fDxFTocsV4DZHqvJAl+wJhviYULw9Fg2/csohhjvkTuEZ2bndDonNmnp+jNkzLwr940B6j46E0zM0fSM7lJmlAChKzb70SQ5DJwVHDBUR2P4fpqUCTHde84n9ayD/n7NYs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766408924; c=relaxed/simple;
	bh=BDrE6CA1Qn9fgNQNXNAcSn19sHUGzVo0ZZdQlJwveko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QkjuEkzB1qdx0nIp0xY0gtaDloVAviHnQNiMLcGwXFHJx70n6/i57M1GvY7Uy04Ub7sCaucoFHcpZCRRbEY+F+UPwrV/bJ/pldmiyqr1fHzb4/xL571zSA8KvcDr1MqYvHRDrjlxzg1gLhHzWQIsPZjomx9JprXeeDXBasKprYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ZGmmOAbV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ZGmmOAbV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so3760994a91.3
        for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 05:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766408922; x=1767013722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5UDvIvaVjkkZfBeEFqY4CPR1+ruUJV7ueKVcAIMjEo=;
        b=ZGmmOAbVEIEzLMD4w2oTyLtEri5ljUsGK8kKlNSJGqGIq2Ox9/PTMgoFTeOmYrHIxo
         wggOwqB5Lv1pG5n/POzqkBjiG9Zuo6t0et2V5DhJWDuy1B9deKjx6e1eO4b+nSHpiIdl
         Ld2DaXjIWJG6PNHfREEYsAUBwJI8or/P9foM0SndGoMrQ12debCT1Gk54lRiCfoTcF15
         HhI1LetdeI0uyi30d8YuxVS9I4Q1k3r90Nrea/S0ZBw5r6355FXq3pJp2tDbkEnqbppP
         XmtijO3AjaZcOYNVxJzAiU0bidjF4C2523kEqtr8TqZdhE4CkL+wjq7UAAmPDAuMycq8
         Yhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766408922; x=1767013722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y5UDvIvaVjkkZfBeEFqY4CPR1+ruUJV7ueKVcAIMjEo=;
        b=fzZl1ahRZPhz5S0oj3tzNwFck7miwn4zOLXEs4J/QX+Fv9vXiCv1pi3lfiUAK4wMTP
         udqSeGAgAA/yVJVTO9HR6Oil9R+0pYwUEc3GsDRufh/ybOUosMH4790zk7xMLWkDi3yH
         DXJJDIZRmYRc5lwx2CE6AUnvjy20hc6hQHYA+IhYbibBHeFqslGdSYfUOGtCl6SnY7c8
         yap3wH0btsivOH8aO8kXaz6k875SpIUYhocSpGUkf2DJYgqLze4PJnLL5+eLWUujlZuj
         mRowf5CP1jhslq27MZoNYQO4pUjcTH3I05AFo0FHKbSPnseLJZj1Q1cIsowvJFvj7hmX
         aQZA==
X-Forwarded-Encrypted: i=1; AJvYcCXsLggTR7YoKhK9RLAFGjjqiC5XtvbNzpyVITwYangiwZ33v+REr9AB52NDrNLaQCHjAEqNvYAEKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLY3nU1VPz/DTgFoo8JTs1GhhIQnc+LpTZhXGALtyuOI803KXh
	K3AX9CNVgShj6iuvTyDGEF6KwYQ5lXDnwIZrztgjRv7qlGarJwfSGVUiFlFt8CK2HC4=
X-Gm-Gg: AY/fxX4+3w5nCg/3GAnasDRvyWcFgxTAY1NfggWC4GTZFIz01OFTK2qhExAgS9H5K7e
	Xc8V/NAW+5KQKq4SKMB0XknLzvwxMeiEP6mbnUB2uoi9+FBDAjnnpZ1Eo/OraCnKuG14c5Q37ST
	WuxotfqcQUdadOEEiDOsZshokmtoFLE6WY7aMmWH000p2azKRV93rSWe8xn5fJF5mzYqLQcVmdf
	p17N+vpiQtDg72p3s+A5lM6SvZBS4Oi6OZR5nxwHPuNeOD8WZDOaUYmRwiTUcKCGS4CGCKa2Bq/
	8FmsifimgC0KEQa1uKI1L9UIm9/RPwhbcqwcnVexUVb1eZc8PAZE7tWjLlYT62RiJxLJVK5skKd
	/YVU3pu8VRt2LEwoZFI0gWaoOItFRTXcAktdP1eZiSCEbX5eXIsh60yLnsTuCpieBJo4SwGnBPv
	YJy2NQ8IQgt/OM7YTK7JCeWD3bznBORvI=
X-Google-Smtp-Source: AGHT+IGmybiO9VXGvZFmDwf5i2jOPeKNvQUkXJaS7Qo1wDtRYA343Aqy0CAvztutucUMXstFcLQIPA==
X-Received: by 2002:a17:90b:4988:b0:34c:2db6:57d6 with SMTP id 98e67ed59e1d1-34e921be64fmr9184464a91.19.1766408921894;
        Mon, 22 Dec 2025 05:08:41 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::402f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70c932casm12970405a91.0.2025.12.22.05.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 05:08:41 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 22 Dec 2025 21:04:23 +0800
Subject: [PATCH v2 13/13] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-k3-basic-dt-v2-13-3af3f3cd0f8a@riscstar.com>
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
In-Reply-To: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 0000000000000000000000000000000000000000..037ce757e5bcae0258a326ea6265185d761f2b52
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
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
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+		serial10 = &uart10;
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

