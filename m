Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796A34E25D
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892069; cv=none; b=kOzPVwKHMRMsTRsb4lTuVBvRcMH5xwLJtd/8aXKBhmEQYPZsGRgpETB8JJuGkD9eTBL+XlU1bxmGElIcvY4Gp3d1mUHuvld0TB3NnQJA4ByqEThhrYW01Zq9TnfQ7cQAJDghn/0nZwdwtHAoIWe2nnGYvklr+P/8KJYzg5pxL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892069; c=relaxed/simple;
	bh=KjhTJTkDXnNRFpIPUaoSGbev6YIGfYkMTsBBPhzGvcE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6TcWz5eOP3iLINCzF2KumXLHskiafqkTbZ4DdxCy6zlZegr8667WbOu85toF2po0Cxvbmg9xNhk0vKA6mOTdqWkSzZtbiRCWGsM9faiSHhoghnly7CXBJJPtpluN87oneYQEQa5Z928em8b9cGw6z2g/jeC6n4HX1bMtJADAko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1GQZnQMF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1GQZnQMF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f0f875bc5so60714605ad.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892066; x=1766496866; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjtsZDFBVTJEjQk/WUDeFopXVBua3qA0F4qJMc77ff0=;
        b=1GQZnQMFzuMmKLpp43ju7IbkR8awgTlBUF1JaZJG9mh+qcXpzBJNS65sGdKKoM3H9d
         0cLvX5ei1rsaAf35jGmA6gelYetlRdlg/1cyflz4KFZHvLJI3+xv2Y7SFOfpgM5PULeD
         xnCtIvSpOJJjEotq1CYEYItchCKPvUCFGNsNnEED20sT5+4y+jLfKjQuCdiv0pnqiuzR
         M2RxyV+twXvh3oNT/Nzt6jzC1/20e8fvo7qX7nJKiRRVHBdAjJ8Cmo2tZVZ2tZGx5wTx
         yqrcRGniDqVMjkOtoYPTrJaVdz+tVWd5mxGKzJMahpyv+ZwBv0UO5qklxr49fmNfuwt6
         1/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892066; x=1766496866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjtsZDFBVTJEjQk/WUDeFopXVBua3qA0F4qJMc77ff0=;
        b=Wnf64HvrpKE6a/uTEQ99mWSS+4K8Q6Dpo5hTTooqTomV/BDVVl/i8jVJ81BbN8qITD
         XWZXQccu08JGTLLD+SgUdmuu0CzJ6TnOpIrTXVJ2qNf8FPP+hOp8dO0IujU3qdi3taWK
         rTneHuKgrdH/5I8+v016kP1leTuGtAmbR3T7kZJctXLuMV5ZzFsimVKDmjBr3t1P6r4h
         rnvT/F872foKAOIs1XCf6UZmglGD+/RqFLxqxzNF7KeVlUdpuA7glqvWD1ePpotyAxbp
         M12vgTGrRFGVA4c42o/yPZ+CPEHI/TYYLOkYMjuaZ+NQmdzixwyUj/BPfxBjZhQ8VUpk
         T8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWHjEXSSLUElktwzQSifX96pOA2nch6EjJqo/OqJsdsQxfGssJFL3jiKb77V/5tfCh6i3QyJX8QZw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHrBih6SGhFc+nYCqfLxh8usfBVzjtTbqoYjtkw8igFwwZm50y
	PMOCzqAwP3A4b37NE7JQ2QVz+zrzO1Te3OJqtQJs1fwIH80YtDEAg87Lhu/N2LWHhfU=
X-Gm-Gg: AY/fxX6SLvStv+Fugxo/BhqStmRrgV/zvteqSk+Q1QGhMXG6dxECkLy2v+e+kux5sx9
	6sO4xaqNuc486WpSUFupBKCOX4P4qa3mkJj+L7+aqwe8T17i7rT40c9UiWYCNV/eIgFdYtUpJIL
	yBBn2Z6m4Hn1YDTviyD/4a4nBxXW/rRj1dUAnUVujm5OPRY8MmT6c+SGXuQGNJBNAjcDKGTENYb
	5K+wZUJfK4qbyT2mSY13+OTjNN1rrxODyo3eu+IF5oUWZyY7ZpKyuOqIhw2mZXUCDeiusflK/76
	Al433H9OlnfwWE6XoANdEmleulqRPcc7puJxJC2lkcf5WOhEZ6+NJkBrD8AIRFzj7EV60Maa1mV
	5voZ9ivjhOZhf8PaMyQSP2uirBfNst5Odq7roSA+T226m2yCO+F9DlR5iLeCoznVCBBpC1sB9Ho
	O0TWAAw1zaP/wS00MLEZ4kZleeKIzD+fdLjfiodwfcXA==
X-Google-Smtp-Source: AGHT+IGVOxm+/QKyxHcc5Grjn3kteFx1uRcmQu8o0lO93tndrJa8YJKE/y22hloJlPWLdYElnvZGNQ==
X-Received: by 2002:a17:902:ef44:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a0a9f849f9mr99550055ad.55.1765892065830;
        Tue, 16 Dec 2025 05:34:25 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:25 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:32 +0800
Subject: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
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
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

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
index 0000000000000000000000000000000000000000..0f9d04dd352f5331e82599285113b86af5b09ebe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,25 @@
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
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100200000 {
+		device_type = "memory";
+		reg = <0x1 0x00200000 0x3 0xffe00000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0

